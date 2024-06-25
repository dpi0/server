paste(){
  if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <my-message>"
    exit 1
  fi

  message="$1"
  random_filename="/tmp/$(mktemp -u pasteXXXXXXXX)"

  echo "$message" > "$random_filename"
  pf "$random_filename"
}

paste-file(){
  if [ $# -eq 0 ]; then
    echo "Usage: $0 <file-path>"
    exit 1
  fi

  file_to_upload="$1"

  curlie -F "file=@$file_to_upload" -Fsecret= https://0x0.st | wl-copy
}

paste-file-del(){
  if [ "$#" -ne 2 ]; then
      echo "Usage: $0 <my-token> <my-url>"
      exit 1
  fi
 
  token="$1"
  url="$2"

  curl -F "token=$token" -F delete= "$url"
}
