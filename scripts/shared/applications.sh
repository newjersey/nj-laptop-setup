# All these applications are independent, so if one
# fails to install, don't stop.
set +e

echo
echo "Installing applications"

desired_programs=(
    "rectangle"
    "postman"
    "iterm2"
    "firefox"
    "visual-studio-code"
    "macdown"
    "wget"
)

for program in "${desired_programs[@]}"; do
    check_and_install_brew $program
done

set -e
