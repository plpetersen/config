#/bin/zsh
# Script heavily relies on path manipulations
# Make sure we are in the same dir as the script
SCRIPT_PATH=$( dirname -- "$( readlink -f -- "$0"; )"; )
echo "Changing directories to script location $SCRIPT_PATH"
cd $SCRIPT_PATH

echo "Getting list of config directories"
directories=($(find . -maxdepth 1 -type d ! -path './.git' ! -path '.' -printf '%f\n'))
#printf '%s\n' "${directories[@]}"

function prompt() {
  read -p "$1 " choice
  if [[ "$choice" =~ [Yy](es)? ]]; then
    return 0
  fi
  return 1
}

selected_dirs=( )
for dir in ${directories[@]}; do
  if prompt "Process dir $dir?"; then
    selected_dirs+=($dir)
  fi
done

echo
echo "Selected directories"
printf '%s\n' "${selected_dirs[@]}"
echo

for dir in ${selected_dirs[@]}; do
  cd $dir

  files=($(find . -type f -printf '%p\n'))
  for file in ${files[@]}; do
    # Strip the leading . from relative paths
    target=${file:1}
    # Replace /home with interpreted value of ~ (user's home)
    target=${target/\/home/~}
    target_dir=$(dirname $target)
    #echo $file
    echo -n $target
    if [[ $target = $HOME* ]]; then
      in_home=true 
    else
      in_home=false
    fi
    echo $in_home

    if prompt "Update file $target?"; then
      # back up the file if it already exists
      if [[ -f "$target" ]]; then
	echo "Backing up $target"
	if [ $in_home]; then
	  mv $target{,.bak-$(date --iso-8601=seconds)}
        else  
	  sudo mv $target{,.bak-$(date --iso-8601=seconds)}
	fi
      fi

      echo "Updating $target"
      if [ $in_home]; then
        cp $file $target
      else  
        sudo cp $file $target
      fi
      echo
    fi
  done
  cd ..
done
