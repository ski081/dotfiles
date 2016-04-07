# Install Homebrew

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/versions
brew tap homebrew/dupes
brew update
brew upgrade

# Install packages

apps=(
  bash-completion2
  dockutil
  git
  hub
  httpie
  imagemagick
  mackup
  python
  svn
  tree
  wget
  wifi-password
)

brew install "${apps[@]}"
