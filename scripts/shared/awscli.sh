if is_brew_installed awscli; then
    already_installed+=("awscli")
else
    check_and_install_brew awscli
    echo "Setting up defaults for AWS CLI..."
    aws configure set default.region us-east-1
    aws configure set default.output json
fi
