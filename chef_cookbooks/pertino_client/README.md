pertino_client Cookbook
=======================
This cookbook installs the Pertino client on GNU/Linux.

Requirements
------------
Please see https://support.pertino.com/forums/22568567-Linux-Configuration-and-Settings for details.

Attributes
----------
#### pertino_client::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['pertino_client']['keyid']</tt></td>
    <td>string</td>
    <td>Id of Pertino signing key</td>
    <td><tt>326BD77B</tt></td>
  </tr>
</table>

Usage
-----
#### pertino_client::default
To install the client, just include `pertino_client` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[pertino_client]"
  ]
}
```

Similarly, to remove the client include the pertino_client::uninstall recipe.

License and Authors
-------------------
Authors: Pertino DevOps
