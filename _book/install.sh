#!/bin/bash


#npm install --registry=https://registry.npm.taobao.org  gitbook-plugin-
#--registry=https://registry.npm.taobao.org  
npm install gitbook-plugin-$1
cp -r ../.npm/gitbook-plugin-$1 node_modules/
