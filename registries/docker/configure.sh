#!/bin/bash

registry_ip=`hostname -I | cut -d\  -f1`

INSECURE_REGISTRY="${registry_ip}"
IMAGE_REPOSITORY_PREFIX="${registry_ip}"
NAMESPACE_INIT_FLAGS="${NAMESPACE_INIT_FLAGS:-} --no-secret"

# Allow for insecure registries
sudo su -c "echo '{ \"insecure-registries\" : [ \"${INSECURE_REGISTRY}\" ] }' > /etc/docker/daemon.json"
sudo systemctl daemon-reload
sudo systemctl restart docker

fats_image_repo() {
  local function_name=$1

  echo -n "${IMAGE_REPOSITORY_PREFIX}/${function_name}:${CLUSTER_NAME}"
}

fats_delete_image() {
  local image=$1

  # nothing to do
}

fats_create_push_credentials() {
  local namespace=$1

  # nothing to do
}