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


echo "Adding kubernetes cluster..."
curl -X POST -H "Content-Type: application/json" -d "@${kubernetes_clusters_path}/kubernetes-cluster-1.json" -k -u admin:admin https://${host_ip}:${host_port}/api/kubernetesClusters

bash ${common_folder}/deploy.sh ${iaas}