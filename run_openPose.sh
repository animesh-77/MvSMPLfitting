#!/bin/bash

# Add your commands here

openpose="C:\Users\student1\Downloads\openpose-1.6.0-binaries-win64-gpu-flir-3d_recommended\openpose\bin\OpenPoseDemo.exe"
model_folder="C:\Users\student1\Downloads\openpose-1.6.0-binaries-win64-gpu-flir-3d_recommended\openpose\models"

img_folder="Y:/datasets/dress3_15/upright/openposetestimages"
keypoints_folder="Y:/datasets/dress3_15/upright/OpenPose_keypoints_25"
result_img_folder="Y:/datasets/dress3_15/upright/OpenPose_images_25"

# make folders if they don't exist
mkdir -p $keypoints_folder
mkdir -p $result_img_folder

# run openpose on all images in the folder

$openpose --image_dir $img_folder \
    --write_json $keypoints_folder \
    --write_images $result_img_folder \
    --write_images_format jpg \
    --model_folder $model_folder \
    --model_pose BODY_25 \
    --display 0 \
    --logging_level 2 \
    --hand

echo "Now downsampling images"
# downsample all images in result_img_folder by a factor of 4
for img in $result_img_folder/*.jpg; do
    magick mogrify -resize 25% $img
done