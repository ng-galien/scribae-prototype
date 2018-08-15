#!/bin/bash
echo "==========================="
echo "Run copy script from $PWD"
echo "==========================="
#Install Libraries
echo "Install librairies via npm..."
npm install
#Copy a prototype to a target project with librairies
echo "==========================="
target="../preview/$2"
opts="-av"
echo "Copy model $1 to $target"
mkdir -p $target
rsync $opts "$1/" $target

#Copy javascript files
echo "==========================="
echo "Copy js librairies"
rsync $opts librairies/js/ "$target/assets/js"
rsync $opts node_modules/jquery/dist/jquery.min.js "$target/assets/js"
rsync $opts node_modules/jquery-lazy/jquery.lazy.min.js "$target/assets/js"
rsync $opts node_modules/jquery-lazy/jquery.lazy.plugins.min.js "$target/assets/js"
rsync $opts node_modules/jquery-match-height/dist/jquery.matchHeight-min.js "$target/assets/js"
rsync $opts node_modules/materialize-css/dist/js/materialize.min.js "$target/assets/js"

#Copy sass files
echo "==========================="
echo "Copy sass files"
rsync $opts librairies/sass/ "$target/_sass"
rsync $opts node_modules/materialize-css/sass/ "$target/_sass"

#Copy css files
echo "==========================="
echo "Copy css files"
rsync $opts librairies/css/ "$target/css"

#Copy font files
echo "==========================="
echo "Copy fonts files"
rsync $opts librairies/fonts/ "$target/fonts"
rsync $opts node_modules/materialize-css/dist/fonts/ "$target/fonts"
