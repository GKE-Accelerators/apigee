/**
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

ax_region = "europe-west1"

apigee_environments = ["test1"]

apigee_instances = {
  # Single instance only for eval, add a second instance for prod setups
  euw1-instance = {
    region       = "europe-west1"
    ip_range     = "10.0.0.0/22"
    environments = ["test1"]
  }
}

apigee_envgroups = {
  test = {
    environments = ["test1"]
    hostnames    = ["test.api.example.com"]
  }
}

network = "apigee-network"

exposure_subnets = [
  {
    name               = "apigee-exposure-1"
    ip_cidr_range      = "10.100.0.0/24"
    region             = "europe-west1"
    instance           = "euw1-instance"
    secondary_ip_range = null
  },
  {
    name               = "apigee-exposure-2"
    ip_cidr_range      = "10.200.0.0/24"
    region             = "europe-west2"
    instance           = "euw1-instance"
    secondary_ip_range = null
  }
]

peering_range = "10.0.0.0/22"
support_range = "10.1.0.0/28"