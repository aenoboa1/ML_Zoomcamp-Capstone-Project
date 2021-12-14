set ACCOUNT 655753199515                          
set REGISTRY fruits-tflite-images
set REGION us-east-1
set PREFIX "$ACCOUNT".dkr.ecr."$REGION".amazonaws.com/"$REGISTRY"
set TAG fruits-xception-v1-001
set REMOTE_URI "$PREFIX":"$TAG"