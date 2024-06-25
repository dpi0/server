# ag current dir files and jump to the line number, vf
vf(){
  result=$(ag --nobreak --noheading . | fzf )
  if [ -n "$result" ]; then
    file=$(echo "$result" | awk -F: '{print $1}')
    line=$(echo "$result" | awk -F: '{print $2}')
    [ -n "$file" ] && [ -n "$line" ] && nvim +"$line" "$file"
  fi
}

# go the directory of the file, vfd
vfd(){
  result=$(ag --nobreak --noheading . | fzf )
  if [ -n "$result" ]; then
    file=$(echo "$result" | awk -F: '{print $1}')
    line=$(echo "$result" | awk -F: '{print $2}')
    directory=$(dirname "$file")
    [ -n "$file" ] && [ -n "$line" ] && [ -n "$directory" ] && cd "$directory"
  fi
}

# Open file in Neovim with line number, vf
vfa(){
  result=$(ag --nobreak --noheading --hidden . | fzf)
  if [ -n "$result" ]; then
    file=$(echo "$result" | awk -F: '{print $1}')
    line=$(echo "$result" | awk -F: '{print $2}')
    [ -n "$file" ] && [ -n "$line" ] && nvim +"$line" "$file"
  fi
}

# Go to the directory of the file, vfd
vfda(){
  result=$(ag --nobreak --noheading --hidden . | fzf)
  if [ -n "$result" ]; then
    file=$(echo "$result" | awk -F: '{print $1}')
    line=$(echo "$result" | awk -F: '{print $2}')
    directory=$(dirname "$file")
    [ -n "$file" ] && [ -n "$line" ] && [ -n "$directory" ] && cd "$directory"
  fi
}
