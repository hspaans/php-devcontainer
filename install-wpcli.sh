#!/usr/bin/sh

[ ! -d /home/vscode/bin ] || mkdir /home/vscode/bin

curl -o /home/vscode/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chown -R vscode:vscode /home/vscode/bin
chmod 755 /home/vscode/bin/wp
