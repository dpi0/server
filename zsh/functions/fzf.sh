f() {
	search_term="$1"

  SELECTED_FILE=$(
  fzf \
	  --query="$search_term" \
	  --exact \
	  --extended \
	  --preview="bat --style=numbers --color=always --line-range :500 {}" \
	  --preview-window="right:50%" \
	  --ansi
  )

  if [ -n "$SELECTED_FILE" ]; then
	  file_extension="${SELECTED_FILE##*.}"

	  case "$file_extension" in
		  "pdf")
			  zathura "$SELECTED_FILE"
			  ;;
		  "txt" | "py" | "rs" | "go" | "md")
			  nvim "$SELECTED_FILE"
			  ;;
		  *)
			  nvim "$SELECTED_FILE"
			  ;;
	  esac

	# Print the selected file value to stdout
	echo "$SELECTED_FILE" | wl-copy
	echo "$SELECTED_FILE"
  fi
}



# cd into dir
ff() {
	local selected_file
	selected_file=$(
	fzf \
		--query="$search_term" \
		--exact \
		--extended \
		--preview="bat --style=numbers --color=always --line-range :500 {}" \
		--preview-window="right:50%" \
		--ansi
	)
	if [[ -n $selected_file ]]; then
		local parent_dir
		parent_dir=$(dirname "$selected_file")
		cd "$parent_dir" || echo "Failed to change directory"
	else
		echo "No file selected"
	fi
}

fh() {
	selected_command=$(history -E 1 | sort -k1,1nr | fzf | awk '{$1=""; $2=""; $3=""; print $0}' | sed 's/^[ \t]*//')
	echo "$selected_command" | wl-copy
}


fkill() {
	local pid 
	if [ "$UID" != "0" ]; then
		pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
	else
		pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
	fi  

	if [ "x$pid" != "x" ]
	then
		echo $pid | xargs kill -${1:-9}
	fi  
}

# search all installed packages
finh() {
	cat /var/log/pacman.log | grep -E "\[ALPM\] (installed|removed|upgraded|upgraded|downgraded)" | awk '{print $1, $2, $3, $4, $5, $6}' | sort -r | fzf
}

fin() {
	pacman -Qq | fzf --preview='pacman -Qi {}'
}

in() {
	paru -Slq | fzf -q "$1" -m --preview 'paru -Si {1}' | xargs -ro paru -S
}

# rga into any file in current dir and recurs
fr() {
	RG_PREFIX="rga --files-with-matches"
	local file
	file="$(
	FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
		fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
		--phony -q "$1" \
		--bind "change:reload:$RG_PREFIX {q}" \
		--preview-window="70%:wrap"
			)" &&
				echo "opening $file" &&
				nvim "$file"
			}
