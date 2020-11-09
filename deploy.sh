#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ${DIR}/_common.sh
TEMPLATE_FILE="./stack.template.yml"

PARAMETER=""
if [ $# -ge 1 ]; then
    PARAMETER="--parameter-overrides $@"
fi

function deploy_stack {
    green 'Deploy stack...'
    aws cloudformation deploy \
        --stack-name ${STACK_NAME} \
        --no-fail-on-empty-changeset \
        --template-file ${TEMPLATE_FILE} \
        --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM ${PARAMETER}
}

deploy_stack "$@"
