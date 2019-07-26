# CreateVP - Bash script to create a VuePress/GitHub Pages project

Edit the  as follows:

```bash
# createvp.sh - Creates a VuePress
# BEFORE DOING THIS
# - Create a GitHub repo. It will be used for $NAME below.

# Full path of directory the VuePress project will live in.
DIR=~/html

# Name of the VuePress project.
# Will also be used as GitHub directory name
NAME=deleteme

# Name of the GitHub account
# Name of the GitHub repo is assumed to be $NAME
GHNAME=tomcam


mkdir -p $DIR/$NAME/docs/.vuepress/public
mkdir -p $DIR/$NAME/docs/assets/{img,css}
cd $DIR/$NAME 
git init
nvim docs/README.md
git add docs/README.md
git commit -m "Create home page"
git remote add origin https://github.com/$GHNAME/$NAME
git push -u origin master
nvim $DIR/$NAME/package.json
git add package.json
git commit -m "Add deployment to docs directory"

```

* Run like this:

```bash
# Make sure it's executable
chmod +x ./createvpsh

# Run it.
./createvpsh

