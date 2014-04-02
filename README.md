Description
===========

This is a template for deploying [Docker](https://www.docker.io/) container on
a single Linux server.

Requirements
============
* A Heat provider that supports the Rackspace `OS::Heat::ChefSolo` plugin.
* An OpenStack username, password, and tenant id.
* [python-heatclient](https://github.com/openstack/python-heatclient)
`>= v0.2.8`:

```bash
pip install python-heatclient
```

We recommend installing the client within a [Python virtual
environment](http://www.virtualenv.org/).

Example Usage
=============
Here is an example of how to deploy this template using the
[python-heatclient](https://github.com/openstack/python-heatclient):

```
heat --os-username <OS-USERNAME> --os-password <OS-PASSWORD> --os-tenant-id \
  <TENANT-ID> --os-auth-url https://identity.api.rackspacecloud.com/v2.0/ \
  stack-create Docker-Stack -f docker-server.yaml \
  -P ssh_keypair_name=docker-key
```

* For UK customers, use `https://lon.identity.api.rackspacecloud.com/v2.0/` as
the `--os-auth-url`.

Optionally, set environmental variables to avoid needing to provide these
values every time a call is made:

```
export OS_USERNAME=<USERNAME>
export OS_PASSWORD=<PASSWORD>
export OS_TENANT_ID=<TENANT-ID>
export OS_AUTH_URL=<AUTH-URL>
```

Parameters
==========
Parameters can be replaced with your own values when standing up a stack. Use
the `-P` flag to specify a custom parameter.

* `server_hostname`: Sets the hostname of the server. (Default: docker)
* `image`: Operating system to install (Default: Ubuntu 13.10 (Saucy
  Salamander) (PVHVM))
* `flavor`: Cloud server size to use. (Default: 2 GB Performance)
* `ssh_keypair_name`: Name of the SSH key pair to register with nova (Default:
  none)
* `docker_image`: Docker image to deploy. (Default: busybox)
* `docker_tag`: Docker image tag to deploy. (Default: latest)
* `docker_command_name`: Command to run in docker container (Default: sleep)
* `docker_command_params`: Parameters to pass to command in Docker container
  (Default: 30)
* `docker_container_port`: Port to expose on docker container (Default: 8080)
* `docker_host_port`: Port to expose on the docker host (Default: 8080)

Outputs
=======
Once a stack comes online, use `heat output-list` to see all available outputs.
Use `heat output-show <OUTPUT NAME>` to get the value fo a specific output.

* `private_key`: SSH private that can be used to login as root to the server.
* `server_ip`: Public IP address of the Docker server

For multi-line values, the response will come in an escaped form. To get rid of
the escapes, use `echo -e '<STRING>' > file.txt`. For vim users, a substitution
can be done within a file using `%s/\\n/\r/g`.

Stack Details
=============
#### Getting Started
If you're new to Docker, check out [Getting started with
docker](https://www.docker.io/gettingstarted/). The getting started document
will help guide you through the initial steps of managing Containers.

#### Docker Deployment Notes
If a container was defined to be installed, this deployment will attempt to
install it from the [Docker index](https://index.docker.io/).

If a container port was specified, but no host port, Docker will map the
container port to a random port on your public interfaces. To see determine the
mapping, find the ID of your container and then use the inspect command to find
the PortBindings. By using 'ps' and 'inspect', here is how we would find a
mapping:

```bash
root@docker:~# docker ps -a
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
e33daf024abc        ubuntu:12.04        sleep 60            16 minutes ago      Exit 0                                  ubuntu

root@docker:~# docker inspect e33daf024abc
[{
    "ID": "e33daf024abccb44cbc7df840a172a5a89bf8e594ee98b79efa91b54f99625ac",
    "Created": "2014-02-03T20:05:17.490688626Z",
    "Path": "sleep",
    "Args": [
        "60"
    ],
    "Config": {
        "Hostname": "e33daf024abc",
        "Domainname": "",
        "User": "",
        "Memory": 0,
        "MemorySwap": 0,
        "CpuShares": 0,
        "AttachStdin": false,
        "AttachStdout": false,
        "AttachStderr": false,
        "PortSpecs": null,
        "ExposedPorts": {
            "8888/tcp": {}
        },
    ...
    ...
    "HostConfig": {
        "Binds": null,
        "ContainerIDFile": "/var/run/ubuntu.cid",
        "LxcConf": [],
        "Privileged": false,
        "PortBindings": {
            "8888/tcp": [
                {
                    "HostIp": "0.0.0.0",
                    "HostPort": "49153"
                }
            ]
        },
        "Links": null,
        "PublishAllPorts": false
    }
}]
root@docker:~#
```

#### Additional Modules
There are hundreds of images that have been created by an engaged developer
community. You can browse the images on the docker
[registry](https://index.docker.io).

#### Logging in via SSH
The private key provided in the passwords section can be used to login as root
via SSH.  We have an article on how to use these keys with [Mac OS X and
Linux](http://www.rackspace.com/knowledge_center/article/logging-in-with-a-ssh-private-key-on-linuxmac)
as well as [Windows using
PuTTY](http://www.rackspace.com/knowledge_center/article/logging-in-with-a-ssh-private-key-on-windows).

Contributing
============
There are substantial changes still happening within the [OpenStack
Heat](https://wiki.openstack.org/wiki/Heat) project. Template contribution
guidelines will be drafted in the near future.

License
=======
```
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
