#! /bin/sh

# Check if filename is passed as argument
if [ "$#" -lt 1 ]; then
    echo "nocode.sh: missing argument"
    exit 1
fi

# Create and fill .gitignore if inexistant
if [ ! -f ".gitignore" ]; then
    $(echo "a.out" >> ".gitignore")
    $(echo -n "*.c" >> ".gitignore")
fi

ARG="$1"

# Read code from STDIN -> compile it
$(clang-format | tee "$ARG" | gcc -x c -)

if [ "$?" -ne 0 ]; then
    echo "nocode.sh: compilation failed"
    $(rm "$ARG")
    exit 1
fi

# Check if we're it a git repository
$(git status &>/dev/null)

if [ "$?" -ne 0 ]; then
    read -p "Not a git repository, do you want to create one? [Y/n] " USERCREATEGITINPUT

    if [ "$USERCREATEGITINPUT" = "n" ]; then
        echo "nocode.sh: leaving file as is"
        exit 0
    fi

    $(git init &>/dev/null)
fi

read -p "Do you want to add the file to git? [y/N] " USERGITINPUT

if [ "$USERGITINPUT" != "y" ]; then
    echo "nocode.sh: leaving file as is"
    exit 0
fi

# Perform all git actions except push, left up to the user
$(git add "$1" &>/dev/null)
$(git commit -m "$1: update" &>/dev/null)

# Remove file because we're #NoCodeCompliant
$(rm "$ARG")