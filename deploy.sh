#!/bin/bash

USERNAME="dadashkarimi"
ACCESS_TOKEN="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"  # Replace with your actual access token
REPO_NAME="ebner-2020"

cp *.py *.ipynb *.sh ebner-2020
cp -r model ebner-2020

#newest_model=$(ls -t models_feta_mgh_body | head -n 1)

#cp -r models_feta_mgh_body/"$newest_model" ebner-2020/

cd ebner-2020

git pull 

git add .

git commit -m "new commit to submit"

git remote add origin https://$USERNAME:$ACCESS_TOKEN@github.com/$USERNAME/$REPO_NAME.git

git branch -M main

git push origin main --force


cd ..


