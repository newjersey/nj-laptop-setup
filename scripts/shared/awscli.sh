check_and_install_brew awscli

## SKIP - Case encountered issues with this :( sadness
# echo "Setting up defaults for AWS CLI..."
# default_region=$(aws configure get default.region)
# if [ -z $default_region ]; then
#     aws configure set default.region us-east-1
# fi
# default_output=$(aws configure get default.output)
# if [ -z $default_output ]; then
#     aws configure set default.output json
# fi
