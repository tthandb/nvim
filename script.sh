#!/bin/bash

#install gcc
if ! command -v gcc &> /dev/null
then
    echo "GCC is not installed. Installing GCC..."
    sudo apt update
    sudo apt install gcc
    echo "GCC has been installed."
else
    echo "GCC is already installed."
fi

#install npm
if ! command -v npm &> /dev/null
then
    echo "npm is not installed. Installing npm..."
    sudo apt update
    sudo apt install npm
    echo "npm has been installed."
else
    echo "npm is already installed."
fi

#install lsp server config
#typescript
if ! npm list -g typescript &> /dev/null
then
    echo "typescript is not installed. Installing typescript..."
    sudo npm install -g typescript
    echo "typescript has been installed."
else
    echo "typescript is already installed."
fi

#tsserver
if ! npm list -g typescript-language-server &> /dev/null
then
    echo "typescript-language-server is not installed. Installing typescript-language-server..."
    sudo npm install -g typescript-language-server
    echo "typescript-language-server has been installed."
else
    echo "typescript-language-server is already installed."
fi

#bashls
if ! npm list -g bash-language-server &> /dev/null
then
    echo "bash-language-server is not installed. Installing typescript-language-server..."
    sudo npm install -g bash-language-server
    echo "bash-language-server has been installed."
else
    echo "bash-language-server is already installed."
fi

#tailwindcss
if ! npm list -g @tailwindcss/language-server &> /dev/null
then
    echo "@tailwindcss/language-server is not installed. Installing @tailwindcss/language-server..."
    sudo npm install -g @tailwindcss/language-server
    echo "@tailwindcss/language-server has been installed."
else
    echo "@tailwindcss/language-server is already installed."
fi

#html/css
if ! npm list -g vscode-langservers-extracted &> /dev/null
then
    echo "vscode-langservers-extracted is not installed. Installing vscode-langservers-extracted..."
    sudo npm install -g vscode-langservers-extracted
    echo "vscode-langservers-extracted has been installed."
else
    echo "vscode-langservers-extracted is already installed."
fi
