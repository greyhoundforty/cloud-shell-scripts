# cloud-shell-scripts
Selection of shell scripts that make it easier to work in IBM Cloud Shell 

## VPC 

 - list_vpc_subnets: Given $1 a VPC name, use jq to filter and return only the name and ID of the subnets.  
   Usage: `list_vpc_subnets NAME_OF_VPC`.
 - list_vpc_instances:  Given $1 a VPC name, use jq to filter and return only the name and ID of the instances.   
   Usage: `list_vpc_instances NAME_OF_VPC`.
 - list_vpc_gws: Given $1 a VPC name, use jq to filter and return only the name and ID of the gateways.  
   Usage: `list_vpc_gws NAME_OF_VPC`
 - list_detached_volumes: Find all detached volumes in the given region across all resource groups.  
   Usage: `list_detached_volumes`
 - list_bootable_snapshots: Find all bootable snapshot volumes in the given region across all resource groups.  
   Usage: `list_bootable_snapshots`

## IAM 

 - generate_api_key: Generate an API key for the Cloud Shell session (named after session). The key will be exported as $IBMCLOUD_API_KEY for use with other functions.
   Usage: generate_api_key 
 - get_iam_token: Generate an IAM Oauth Token and set it as $iam_token environment variable. Run `generate_api_key` if you do not already have an API Key exported.
   Usage: get_iam_token 
 - get_refresh_token: Generate a Refresh Token and set it as $refresh_token environment variable. Run `generate_api_key` if you do not already have an API Key exported.
   Usage: get_refresh_token 
