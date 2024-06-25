# --- paru/pacman ---

alias p='paru' # alias for "paru -Syu"

alias pi='paru -S' # Update/Install a specific package

alias psua='paru -Sua' # Upgrade AUR packages

alias pqua='paru -Qua' # Show all available AUR updates

alias pr='paru -R' # remove the package only

alias prs='paru -Rs' 
# Remove a package and its dependencies that are not required by any other installed packages "s" unnecessary dependencies,

alias pn='paru -Rn' 
# Remove the specified package and its configuration files "n" it's config files

alias pc='paru -Rc' 
# Remove the specified package along with its configuration files. It also removes dependencies that are not required by other installed packages

alias pu='paru -Ru' 
# Remove the specified package and its unneeded dependencies. It is more aggressive than -Rs in removing dependencies "u" unneeded packages.

alias prsun='paru -Rsu' 
# remove a package from the system, including its dependencies that are not required by any other installed package "u" unneeded packages,

alias prsun='paru -Rsun' 
# remove the package, "s" unnecessary dependencies, "u" unneeded packages, "n" it's config files

alias pch='pacman -Qi' 
# Detailed information about a specific installed package i.e., pcheck
alias pqi='pacman -Qi' # Detailed information about a specific installed package i.e., pcheck

alias pchf='pacman -Ql' # What files does this package have? i.e., pcheckfiles
alias pql='pacman -Ql' # What files does this package have? i.e., pcheckfiles

alias pcho='pacman -Qo' # Who owns this package? i.e., pcheckowner
alias pqo='pacman -Qo' # Who owns this package? i.e., pcheckowner

alias psy='sudo pacman -Sy' # Update the complete package list
alias psyy='sudo pacman -Syy' # Forces a refresh of the package database even if it appears up to date
alias psyu='sudo pacman -Syu' # Update and upgrade all system packages.

alias pu='sudo pacman -U' # Install a package from a local file

alias parsc='sudo pacman -Rsc' # Remove the specified package, its configuration files, and dependencies that are not required by other installed packages.
alias parns='sudo pacman -Rns' # Remove a package, its configuration, and all unwanted dependencies.
alias paro='sudo pacman -Rns $(pacman -Qdtq)' # Uninstall unneeded packages

alias pal='pacman -Q' # List all installed packages on the system along with their version numbers.
alias palu='pacman -Qu' # List all packages that have updates available in the repositories.
alias paldt='pacman -Qdt' # List orphaned packages, i.e., packages that were installed as dependencies but are no longer required by any explicitly installed package. List unneeded packages

alias pale='pacman -Qe' # Explicitly installed packages are the ones that you specifically requested to be installed. It excludes packages that were installed as dependencies of other packages.
alias palii='pacman -Qii' # Extended information about explicitly installed packages.

alias pat='pactree' # What does pkg depend on?
alias patr='pactree -r' # What depends on pkg?

alias pas='pacman -Ss' # Search for a package or packages in the repositories.
alias pasi='pacman -Si' # Display information about a given package located in the repositories.
alias pasc='pacman -Qs' # Search for a package or packages in the local database.

