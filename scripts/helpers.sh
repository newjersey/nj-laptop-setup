is_program_installed() {
    command -v $1 >/dev/null 2>&1
}

is_brew_installed() {
    local program=$1
    brew list | grep -q "^$program$"
}

check_and_install_brew() {
    if is_brew_installed "$1"; then
        already_installed+=("$1")
    else
        brew install $1
        if [[ $? -ne 0 ]]; then
            failed+=("$1")
        else
            newly_installed+=("$1")
        fi
    fi
}

# prompt user to consent for customizations
prompt_user() {
    local child_script=$1  # Path to the child script
    read -r -p "Run script? (y/n) " user_response

    case "$user_response" in
        [yY]|[yY][eE][sS])
            source "$child_script"
            ;;
        [nN]|[nN][oO])
            ;;
        *)
            echo "Invalid input, skipping"
            ;;
    esac
}
