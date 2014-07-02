# Encoding: utf-8
#
# Cookbook Name:: rax-docker
# Recipe:: default
#
# Copyright 2014, Rackspace Hosting
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

group 'docker'

unless node['rax-docker']['image'].empty?

  docker_image node['rax-docker']['image'] do
    repository node['rax-docker']['registry']
    tag node['rax-docker']['tag']
  end

  if node['rax-docker']['container_port'].nil?
    prt = nil
  else
    # rubocop:disable LineEndConcatenation
    prt = "#{node['rax-docker']['host_port']}:" +
          "#{node['rax-docker']['container_port']}"
  end

  docker_container node['rax-docker']['image'] do
    command "#{node['rax-docker']['command']['name']} " +
            "#{node['rax-docker']['command']['params']}"
    cmd_timeout node['docker']['container_cmd_timeout']
    port prt
    detach true
  end
  # rubocop:enable LineEndConcatenation
end
