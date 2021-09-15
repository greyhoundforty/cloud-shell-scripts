#
# generate_api_key: Generate an API key for the Cloud Shell session (named after session). The key will be exported as $IBMCLOUD_API_KEY for use with other functions.
# Usage: generate_api_key 
#
function generate_api_key() {
    ibmcloud iam api-key-create $(jq -r -n env.HOSTNAME)-api-key --output json --file apiKey.json
    export IBMCLOUD_API_KEY=$(jq -r .apikey < apiKey.json)
}

#
# get_iam_token: Generate an IAM Oauth Token and set it as $iam_token environment variable. Run `generate_api_key` if you do not already have an API Key exported.
# Usage: get_iam_token 
#
function get_iam_token() {
  iam_token=`curl -s -k -X POST --header "Content-Type: application/x-www-form-urlencoded" --header "Accept: application/json" \
  --data-urlencode "grant_type=urn:ibm:params:oauth:grant-type:apikey" --data-urlencode "apikey=${IBMCLOUD_API_KEY}" \
  "https://iam.cloud.ibm.com/identity/token"  | jq -r '(.token_type + " " + .access_token)'`
}

#
# get_iam_token: Generate a Refresh Token and set it as $refresh_token environment variable. Run `generate_api_key` if you do not already have an API Key exported.
# Usage: get_refresh_token 
#
function get_refresh_token() {
  refresh_token=`curl -s -k -X POST --header "Content-Type: application/x-www-form-urlencoded" --header "Accept: application/json" \
  --data-urlencode "grant_type=urn:ibm:params:oauth:grant-type:apikey" --data-urlencode "apikey=${IBMCLOUD_API_KEY}" \
  "https://iam.cloud.ibm.com/identity/token"  | jq -r '(.token_type + " " + .refresh_token)'`
}

