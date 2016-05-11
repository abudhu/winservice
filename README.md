# winservice-cookbook

Chef LWRP for creating and deleting Windows Services

## Supported Platforms

<table>
<tr>Windows 2008R2</tr>
<tr>Windows 2012</tr>
<tr>Windows 2012R2</tr>
</table>
## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>name</tt></td>
    <td>String</td>
    <td>Name of the service</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>bin_path</tt></td>
    <td>String</td>
    <td>Full path to the executable</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>start_type</tt></td>
    <td>String</td>
    <td>Start type of the service</td>
    <td><tt>disabled</tt></td>
  </tr>
  <tr>
    <td><tt>display_name</tt></td>
    <td>String</td>
    <td>Display name of the windows service</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>run_as_user</tt></td>
    <td>String</td>
    <td>User to run the service</td>
    <td><tt>LocalSystem</tt></td>
  </tr>
  <tr>
    <td><tt>run_as_password</tt></td>
    <td>String</td>
    <td>Password for user, if other than LocalSystem</td>
    <td><tt>nil</tt></td>
  </tr>
</table>


## Usage

win_service "Create Window Service" do
  name MyService
  bin_path C:\\My\\Awesome\\Path
  display_name MyAwesomeService
  run_as_user Foo\\Bar
  run_as_password MySuperSecretPassword
  action :create
end

win_service "Create Window Service" do
  name MyService
  action :delete
end

### winservice::default

Include `winservice` in your node's `metadata.rb`:


## License and Authors

Author:: Amitraj Budhu (<abudhu@gmail.com>)
