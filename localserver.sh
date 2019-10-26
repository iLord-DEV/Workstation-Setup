#!/usr/bin/env bash

echo "Installing local dev Server with php-switching and more stuff..."
echo "Thanks to https://getgrav.org/blog/macos-catalina-apache-multiple-php-versions"

## Catalina Required Libraries
#When installing fresh on Catalina, I ran into a few libraries that were missing when completing all the steps below. To make things easier, please simply run these now:
brew install openldap libiconv

## Apache Installation
sudo apachectl stop
sudo launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist 2>/dev/null
brew install httpd
sudo brew services start httpd
open http://localhost:8080

# Colorize

# Set the colours you can use
black=$(tput setaf 0)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
white=$(tput setaf 7)

# Resets the style
reset=`tput sgr0`

# Color-echo. Improved. [Thanks @joaocunha]
# arg $1 = message
# arg $2 = Color
cecho() {
  echo "${2}${1}${reset}"
  return
}

# Set continue to false by default.
CONTINUE=false

echo ""
cecho "Does the Browser say I is working! ? – (y/n)" $red
echo ""

read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  CONTINUE=true
fi

if ! $CONTINUE; then
  # Check if we're continuing and output a message if not
  cecho "Please fix the Problem (see: https://getgrav.org/blog/macos-catalina-apache-multiple-php-versions)" $red
  cecho "Did you solved the Problem? (y/n)" $red
  read -r response
    if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
        CONTINUE=true
    fi
    if ! $CONTINUE; then
        cecho "try harder! and come back later" $red
    fi
fi
