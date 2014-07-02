rax-docker Cookbook
===================
Wrapper cookbook for chef-docker.

Requirements
------------
* [chef-docker](https://github.com/bflad/chef-docker)

Attributes
----------

#### rax-docker::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['rax-docker']['image']</tt></td>
    <td>String</td>
    <td>Name of image to deploy.</td>
    <td><tt>''</tt></td>
  </tr>
  <tr>
    <td><tt>['rax-docker']['registry']</tt></td>
    <td>String</td>
    <td>Name of registry from which to pull image.</td>
    <td><tt>''</tt></td>
  </tr>
  <tr>
    <td><tt>['rax-docker']['tag']</tt></td>
    <td>String</td>
    <td>Tag of image to deploy.</td>
    <td><tt>''</tt></td>
  </tr>
  <tr>
    <td><tt>['rax-docker']['command']['name']</tt></td>
    <td>String</td>
    <td>Command to run when starting container.</td>
    <td><tt>'sleep'</tt></td>
  </tr>
  <tr>
    <td><tt>['rax-docker']['command']['params']</tt></td>
    <td>String</td>
    <td>Parameters for command.</td>
    <td><tt>'60'</tt></td>
  </tr>
  <tr>
    <td><tt>['rax-docker']['container_port']</tt></td>
    <td>Integer</td>
    <td>Port to expose on container.</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>['rax-docker']['host_port']</tt></td>
    <td>Integer</td>
    <td>Port to expose on host.</td>
    <td><tt>nil</tt></td>
  </tr>
</table>

Usage
-----
#### rax-docker::default

e.g.
Just include `rax-docker` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[docker]",
    "recipe[rax-docker]"
  ]
}
```

If using Ubuntu 13.10, please include `rax-docker::aufs` in your `run_list`
before the `docker` cookbook in order to install the `aufs` kernel module:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[rax-docker::aufs]",
    "recipe[docker]",
    "recipe[rax-docker]"
  ]
}
```

Contributing
------------

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors:
* [BK Box](https://github.com/gondoi)
* [Brint O'Hearn](https://github.com/brint)
* [Ryan Walker](https://github.com/ryandub)
