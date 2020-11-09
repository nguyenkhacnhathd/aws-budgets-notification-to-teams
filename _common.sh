#!/usr/bin/env bash
set -e # Exit when failed
if [ -n "$DEBUG" ]; then
    set -x
fi
if [ ! -t 1 ]; then
    NON_INTERACTIVE=1
fi

# Color printing helpers
end="\033[0m"
green="\033[0;32m"
red="\033[0;31m"
yellow="\033[0;33m"
function green {
    echo -e "${green}${@}${end}"
}
function red {
    echo -e "${red}${@}${end}"
}
function yellow {
    echo -e "${yellow}${@}${end}"
}
PROJECT_ROOT="$(pwd)"

# Env for stack deployment script
export AWS_DEFAULT_REGION=ap-northeast-1
STACK_NAME="aws-budgets-notification-to-teams"

function prompt_account_info {
    if [ -z "${ACCOUNT_ID}" ]; then
        ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
    fi
    if [ -z "${ACCOUNT_ALIAS}" ]; then
        ACCOUNT_ALIAS=$(aws iam list-account-aliases --query 'AccountAliases[0]' --output text)
    fi
    if [ -z "$ACCOUNT_PROMPTED" ]; then
        green "Account: ${ACCOUNT_ID} (Alias: ${ACCOUNT_ALIAS})"
        green "User: $(aws iam get-user --query 'User.UserName' --output text)"
        green "Stack name: ${STACK_NAME}"
        if [ -z "${NON_INTERACTIVE}" ] ; then
            read -p "$(yellow Correct account and stack? Press enter to continue...)"
        fi
        export ACCOUNT_PROMPTED=1
    fi
}

[ -z "${NO_PROMPT}" ] && prompt_account_info