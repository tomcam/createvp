# createvp.sh - Creates a VuePress
#
# DIRECTIONS: READ BEFORE RUNNING THIS SCRIPT
# - Create a GitHub repo. Its name will be used for $NAME below.
# - Fill in all the variables from here to AUTHOR_EMAIL, inclusive.
# - Run like this:
# Make sure it has permissions:
# $ chmod +x ./createvp.sh
# And run it:
# $ ./createvp.sh


# Full path of directory the VuePress project will live in.
DIR=~/html

# Name of the VuePress project.
# Will also be used as GitHub directory name
NAME=foobar

# Name of the GitHub account
# Name of the GitHub repo is assumed to be $NAME
GHNAME=tomcam

# Description for package.json
DESCRIPTION="Replace with your package.json description"

# Author's full name in quotes, like "John Smith"
AUTHOR_NAME="Tom Campbell"

# Author's email address
AUTHOR_EMAIL="foo@example.com"

# Generate package.json from 
# variables supplied by this script.
read -r -d '' PACKAGE_JSON << EOM
{
  "name": "$NAME",
  "version": "1.0.0",
  "description": "$DESCRIPTION",
  "main": "index.js",
  "repository": {
    "type": "git",
    "url": "git+https://github.com/$GHNAME/$NAME.git"
   },
   "resolutions": {
    "webpack-dev-middleware": "3.6.0"
  },
  "author": "$AUTHOR_NAME <$AUTHOR_EMAIL>",
  "license": "Unknown",
  "private": true,
  "scripts": {                                                                  
    "docs:dev": "vuepress dev docs",
    "docs:build": "vuepress build docs"
  },
  "homepage": "https://github.com/$GHNAME/$NAME#readme",
  "dependencies": {
    "vuepress": "^0.14.0"
  }
}
EOM
echo "$PACKAGE_JSON" > $DIR/$NAME/package.json
echo "Created $DIR/$NAME/package.json:"
cat $DIR/$NAME/package.json 

mkdir -p $DIR/$NAME/docs/assets/{img,css}
cd $DIR/$NAME 
git init
echo -e "# $NAME\n## By $AUTHOR_NAME\n$DESCRIPTION" > docs/README.md
git add docs/README.md
git commit -m "Create home page"
git remote add origin https://github.com/$GHNAME/$NAME
git push -u origin master
git add $DIR/$NAME/package.json
git commit -m "Add deployment to /docs directory"

# Generate the site
yarn docs:build

# Deal with yarn bug
# Already here, I know. Deal with it.
cd $DIR/$NAME
rm -rf node_modules
yarn install

# Now run the site.
yarn docs:dev

