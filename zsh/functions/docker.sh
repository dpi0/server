# Select a docker container to start and attach to
function fdstart() {
  local cid
  cid=$(docker ps -a | sed 1d | fzf -1 -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker start "$cid" && docker attach "$cid"
}

# Select a running docker container to stop
function fdstop() {
  local cid
  cid=$(docker ps | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker stop "$cid"
}

# # Select a docker container to remove
# function fdrm() {
#   local cid
#   cid=$(docker ps -a | sed 1d | fzf -q "$1" | awk '{print $1}')
#
#   [ -n "$cid" ] && docker rm "$cid"
# }

# Same as above, but allows multi selection:
function fdrm() {
  docker ps -a | sed 1d | fzf -q "$1" --no-sort -m --tac | awk '{ print $1 }' | xargs -r docker rm
}

# Select a docker image or images to remove
function fdrmimg()

 {
  docker images | sed 1d | fzf -q "$1" --no-sort -m --tac | awk '{ print $3 }' | xargs -r docker rmi
}

