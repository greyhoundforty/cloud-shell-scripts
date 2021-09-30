#
# list_vpc_subnets: Given $1 a VPC name, use jq to filter and return only the name and ID of the subnets
# Usage: list_vpc_subnets NAME_OF_VPC
#
function list_vpc_subnets() { 
    export VPC=${@}; 
    ibmcloud is subnets --output json | jq -r '.[] | select(.vpc.name=='env.VPC') | .name,.id' 
}

#
# list_vpc_instances:  Given $1 a VPC name, use jq to filter and return only the name and ID of the instances 
# Usage: list_vpc_instances NAME_OF_VPC
#
function list_vpc_instances() { 
    export VPC=${@};
    ibmcloud is instances --output json | jq -r '.[] | select(.vpc.name=='env.VPC') | .name,.id' 
}

#
# list_vpc_gws: Given $1 a VPC name, use jq to filter and return only the name and ID of the gateways
# Usage: list_vpc_gws NAME_OF_VPC
#
function list_vpc_gws() { 
    export VPC=${@}; 
    ibmcloud is public-gateways --output json | jq -r '.[] | select(.vpc.name=='env.VPC') | .name,.id'
}

#
# list_detached_volumes: Find all detached volumes in the given region across all resource groups. 
# Usage: list_detached_volumes 
#
function list_detached_volumes() {
    ibmcloud target --unset-resource-group
    ibmcloud is volumes --output json | jq -r '.[] | select(.volume_attachments | length > 0) | .name'
}

#
# list_bootable_snapshots: Find all bootable snapshot volumes in the given region across all resource groups. 
# Usage: list_bootable_snapshots 
#
function list_bootable_snapshots() {
    ibmcloud target --unset-resource-group
    ibmcloud is snapshots --output json | jq -r '.[] | select(.bootable="true") | .name'
}

#
# get_rhel_images: Find all public RHEL images in the current region and return the name and ID of the image
# Usage: get_rhel_images 
#
function get_rhel_images() { 
    ibmcloud is images --visibility public --json | jq -r '.[] | select(.status=="available") | select(.name | startswith("ibm-redhat-")) | .name, .id'
}

#
# get_ubuntu_images: Find all public Ubuntu images in the current region and return the name and ID of the image
# Usage: get_ubuntu_images 
#
function get_ubuntu_images() { 
    ibmcloud is images --visibility public --json | jq -r '.[] | select(.status=="available") | select(.name | startswith("ibm-ubuntu-")) | .name, .id'
}
