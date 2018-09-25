#!/bin/bash
source ~/stackrc
openstack overcloud deploy --templates \
  -e ~/templates/node-info.yaml \
  -e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
  -e ~/templates/network-environment.yaml \
  -e /usr/share/openstack-tripleo-heat-templates/environments/ovs-dpdk-permissions.yaml \
  --ntp-server pool.ntp.org
