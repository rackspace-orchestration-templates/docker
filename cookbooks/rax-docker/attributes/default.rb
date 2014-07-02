# Encoding: utf-8
#
# Cookbook Name:: rax-docker
# Attribute:: default
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

default['rax-docker']['image'] = ''

default['rax-docker']['registry'] = ''
default['rax-docker']['tag'] = ''

default['rax-docker']['command']['name'] = 'sleep'
default['rax-docker']['command']['params'] = '60'
default['rax-docker']['container_port'] = nil
default['rax-docker']['host_port'] = nil

default['rax-docker']['socket_retry_delay'] = 2
default['rax-docker']['socket_retry_limit'] = 10
