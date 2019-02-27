#!/bin/bash
source ~/stackrc
cd /usr/share/openstack-tripleo-heat-templates
sudo ./tools/process-templates.py  -r /home/stack/templates/roles_data.yaml -n /home/stack/templates/network_data.yaml

cd /home/stack
openstack overcloud deploy --templates \
  -e ~/templates/node-info.yaml \
  -e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
  -e /usr/share/openstack-tripleo-heat-templates/environments/host-config-and-reboot.yaml \
  -e /usr/share/openstack-tripleo-heat-templates/environments/neutron-ovs-dpdk.yaml \
  -e /usr/share/openstack-tripleo-heat-templates/environments/ovs-dpdk-permissions.yaml \
  -r /home/stack/templates/roles_data.yaml \
  -e /home/stack/templates/network-environment.yaml \
  -e /home/stack/templates/puppet-ceph-external.yaml \
  -e /home/stack/templates/overcloud_images.yaml \
  -e /home/stack/templates/node-info.yaml \
  --ntp-server pool.ntp.org
