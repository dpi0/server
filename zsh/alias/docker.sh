alias d="docker"
alias di="d images"
alias dpsa="d ps -a"
alias dpt="d build -t"
alias de="d exec"

alias dc="d compose"
alias dce="dc exec"
alias dcu="dc up"
alias dcd="dc down"
alias dcl="dc logs"
alias dcb="dc build"
alias dcp="dc pause"
alias dcup="dc unpause"
alias dsta="dc start"
alias dsto="dc stop"
alias dci="dc images" # list images used by created containers
alias dcls="dc ls" # list running compose projects
alias dcps="dc ps" # list containers
alias dct="dc top" # display the running processes

alias dr="d run"
alias drn="d run --name" # docker run --name <container_name> <image_name>
alias drd="d run -d" # docker run -p <host_port>:<container_port> <image_name>
alias dstart="d start"
alias dstop="d stop"
alias drestart="d restart"
alias dlogs="d logs"
alias drm="d rm"
alias dstats="d container stats --all"

alias dlogin="d login -u"
alias dpush="d push"
alias dsearch="d search"
alias dpull="d pull"

alias dn="d network"
alias dnls="d network ls"
alias dni="d network inspect"

alias di="docker inspect"

alias mk="minikube"
alias kb="kubectl"

