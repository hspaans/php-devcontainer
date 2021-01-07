#!/bin/sh

curl https://get.symfony.com/cli/installer | bash

mv /root/.symfony /home/vscode
chown -R vscode:vscode /home/vscode/.symfony
