# Clean up
rm -rf ./.git
rm -rf ./setup.sh

# Set
currPath=$(pwd)
dirname=${currPath##*/}
echo "# $dirname" > ./README.md

# Init
git init
git add README.md
git commit -m "Init"

# Done
echo "Done!"
