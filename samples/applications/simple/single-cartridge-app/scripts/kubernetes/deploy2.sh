#!/bin/bash
# --------------------------------------------------------------
#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#
# --------------------------------------------------------------
#
host_ip="localhost"
host_port=9443
iaas="kubernetes"

prgdir=`dirname "$0"`
script_path=`cd "$prgdir"; pwd`
common_folder=`cd "${script_path}/../common"; pwd`
kubernetes_clusters_path=`cd "${script_path}/../../../../../kubernetes-clusters"; pwd`
artifacts_path=`cd "${script_path}/../../artifacts"; pwd`
iaas_cartridges_path=`cd "${script_path}/../../../../../cartridges/${iaas}"; pwd`
cartridges_groups_path=`cd "${script_path}/../../../../../cartridge-groups"; pwd`


echo "Adding kubernetes cluster..."
echo $artifacts_path
#curl -X POST -H "Content-Type: application/json" -d "@${kubernetes_clusters_path}/kubernetes-cluster-2.json" -k -u admin:admin https://${host_ip}:${host_port}/api/kubernetesClusters

curl -X POST -H "Content-Type: application/json" -d "@${iaas_cartridges_path}/das-zookeeper.json" -k -v -u admin:admin https://${host_ip}:${host_port}/api/cartridges
curl -X POST -H "Content-Type: application/json" -d "@${iaas_cartridges_path}/das-analytics.json" -k -v -u admin:admin https://${host_ip}:${host_port}/api/cartridges
curl -X POST -H "Content-Type: application/json" -d "@${iaas_cartridges_path}/das-dashboard.json" -k -v -u admin:admin https://${host_ip}:${host_port}/api/cartridges
curl -X POST -H "Content-Type: application/json" -d "@${iaas_cartridges_path}/das-receiver.json" -k -v -u admin:admin https://${host_ip}:${host_port}/api/cartridges
curl -X POST -H "Content-Type: application/json" -d "@${iaas_cartridges_path}/hadoop.json" -k -v -u admin:admin https://${host_ip}:${host_port}/api/cartridges
curl -X POST -H "Content-Type: application/json" -d "@${iaas_cartridges_path}/hadoopdata.json" -k -v -u admin:admin https://${host_ip}:${host_port}/api/cartridges
curl -X POST -H "Content-Type: application/json" -d "@${iaas_cartridges_path}/hbase.json" -k -v -u admin:admin https://${host_ip}:${host_port}/api/cartridges
curl -X POST -H "Content-Type: application/json" -d "@${iaas_cartridges_path}/hbaseregionserver.json" -k -v -u admin:admin https://${host_ip}:${host_port}/api/cartridges
curl -X POST -H "Content-Type: application/json" -d "@${iaas_cartridges_path}/mysql.json" -k -v -u admin:admin https://${host_ip}:${host_port}/api/cartridges


#curl -X POST -H "Content-Type: application/json" -d "@${artifacts_path}/application.json" -k -v -u admin:admin https://${host_ip}:${host_port}/api/applications

curl -X POST -H "Content-Type: application/json" -d "@${cartridges_groups_path}/hadoop-group.json" -k -v -u admin:admin https://${host_ip}:${host_port}/api/cartridgeGroups

curl -X POST -H "Content-Type: application/json" -d "@${cartridges_groups_path}/hbase-group.json" -k -v -u admin:admin https://${host_ip}:${host_port}/api/cartridgeGroups


curl -X POST -H "Content-Type: application/json" -d "@${artifacts_path}/app6.json" -k -v -u admin:admin https://${host_ip}:${host_port}/api/applications
#curl -X POST -H "Content-Type: application/json" -d "@${artifacts_path}/app4.json" -k -v -u admin:admin https://${host_ip}:${host_port}/api/applications
#curl -X POST -H "Content-Type: application/json" -d "@${artifacts_path}/app5.json" -k -v -u admin:admin https://${host_ip}:${host_port}/api/applications
#curl -X POST -H "Content-Type: application/json" -d "@${artifacts_path}/cep-das-app.json" -k -v -u admin:admin https://${host_ip}:${host_port}/api/applications

#bash ${common_folder}/deploy.sh ${iaas}
