ls -latr $1
images=$(ls $1/*tar)
for image in $images; do
docker load -i $image
rm -rf $image
