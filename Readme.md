# How to restore 
- Clone this repo in the home directory.
- Install brew and then run the following commands:
- brew install stow
- cd dotfiles
- stow Brewfile
- brew bundle install
- cd dotfiles
- stow *
- if you get error that the file already exist then stow dir --adapt and then git restore in the dotfiles directory
