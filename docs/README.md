# CreateVP - Bash script to create a VuePress/GitHub Pages project

Edit the file [createvp.sh](createvp.sh) as follows:

```bash
# createvp.sh - Creates a VuePress
# BEFORE DOING THIS
# - Create a GitHub repo. It will be used for $NAME below.

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
```

* Run like this:

```bash
# Make sure it's executable
chmod +x ./createvpsh

# Run it.
./createvpsh
```

