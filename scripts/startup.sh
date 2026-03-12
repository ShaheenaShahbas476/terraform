#!/bin/bash

sudo apt update
sudo apt install docker.io -y

docker login aistamprally.azurecr.io

docker pull aistamprally.azurecr.io/ai-stamp-rally:latest

docker run -d -p 3000:3000 aistamprally.azurecr.io/ai-stamp-rally:latest