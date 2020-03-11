#! /bin/bash

export SNETD_VERSION=$1
export SNETD_CURR_VERSION=""
if [ "${SNETD_VERSION}" != "" ]; then
	SNETD_CURR_VERSION=$(ssh -o "StrictHostKeyChecking no" "${SSH_USER}"@"${SSH_HOST}" \
						docker exec "${PROD_TAG}""${DOCKER_CONTAINER}" snetd version | grep -oP 'version tag: \K(.*)' \
						|| echo "")
	if [ "${SNETD_CURR_VERSION}" = "" ] || [ "${SNETD_VERSION}" != "${SNETD_CURR_VERSION}" ]; then
		ssh -o "StrictHostKeyChecking no" "${SSH_USER}"@"${SSH_HOST}" <<- EOF
			cd /tmp || true
			wget https://github.com/singnet/snet-daemon/releases/download/"${SNETD_VERSION}"/snet-daemon-"${SNETD_VERSION}"-linux-amd64.tar.gz
			tar -zxvf snet-daemon-"${SNETD_VERSION}"-linux-amd64.tar.gz
			docker cp snet-daemon-"${SNETD_VERSION}"-linux-amd64/snetd "${PROD_TAG}""${DOCKER_CONTAINER}":/usr/bin || echo true
			rm -rf snet-daemon-*
		EOF
	fi
fi

echo 0