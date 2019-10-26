#!/usr/bin/env bash 

##############################
# Install via Brew           #
##############################

echo "Starting brew app install..."

### Window Management
# Todo: Try Divvy and spectacles in the future
#brew cask install sizeup  # window manager

# Start SizeUp at login
#defaults write com.irradiatedsoftware.SizeUp StartAtLogin -bool true

# Don’t show the preferences window on next start
#defaults write com.irradiatedsoftware.SizeUp ShowPrefsOnNextStart -bool false


### Developement
brew cask install iterm2
brew cask install dash
brew install ispell
brew cask install codekit
brew cask install sequel-pro

### Command line tools - install new ones, update others to latest version
brew install node
brew install yarn
brew install git  # upgrade to latest
brew install zsh # zshell
# brew install grep --with-default-names
brew install trash  # move to osx trash instead of rm

### Dev Editors 
brew cask install visual-studio-code


### Productivity
brew cask install google-chrome-dev
brew cask install firefox-developer-edition
brew cask install brave-browser


### Productivity
brew cask install alfred
brew cask install the-unarchiver
brew cask install ImageOptim  # for optimizing images
brew cask install transmit
brew cask install sketch
brew cask install adobe-creative-cloud
brew cask install xscope
brew cask install carbon-copy-cloner





### Chat / Video Conference
brew cask install slack
brew cask install skype
brew cask install whatsapp
brew cask install spotify


### Run Brew Cleanup
brew cleanup


#############################################
### Installs from Mac App Store
#############################################

echo "Installing apps from the App Store..."

### find app ids with: mas search "app name"
brew install mas

### Mas login is currently broken on mojave. See:
### Login manually for now.

cecho "Need to log in to App Store manually to install apps with mas...." $red
echo "Opening App Store. Please login."
open "/Applications/App Store.app"
echo "Is app store login complete.(y/n)? "
read response
if [ "$response" != "${response#[Yy]}" ]
then
	mas install 1333542190 # 1password
	mas install 409201541  # Pages
	mas install 409203825  # Numbers
	mas install 409183694  # Keynote
	mas install 889428659  # X Scope
	mas install 497799835  # Xcode
    
	
else
	cecho "App Store login not complete. Skipping installing App Store Apps" $red
fi


#############################################
### Fonts
#############################################

echo "Installing fonts..."

brew tap caskroom/fonts

### programming fonts
brew cask install font-fira-mono-for-powerline
brew cask install font-fira-code

### SourceCodePro + Powerline + Awesome Regular (for powerlevel 9k terminal icons)
cd ~/Library/Fonts && { curl -O 'https://github.com/Falkor/dotfiles/blob/master/fonts/SourceCodePro+Powerline+Awesome+Regular.ttf?raw=true' ; cd -; }

