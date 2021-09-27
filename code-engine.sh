#!/usr/bin/env bash

#
# 
function ce_build() {
    environment="$(jq -r -n env.HOSTNAME)"
    export environment
    # Prompt for source, branch, namespace, container name and registry secret 
    ibmcloud code-engine build create --name "$environment-invoice-build" --image us.icr.io/"${NAMESPACE}"/pythoninvoice:latest 
    --source https://github.com/greyhoundforty/invoiceAnalysis --commit CodeEngine --rs "${PREFIX}-rg-secret" --size small 

}
