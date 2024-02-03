# Clean up
rm -rf ./.git
rm -rf ./setup.sh
rm -rf ./README.md

# Set
currPath=$(pwd)
dirname=${currPath##*/}
echo "# ${dirname}" > ./README.md
sed "s/customized-create-next-app/${dirname}/g" package.json
sed "s/\"version\": \"*\"/\"version\": \"0.0.0\"/g" package.json

# Init
git init
git add README.md
git commit -m "init"

# Done
echo "Done!"
