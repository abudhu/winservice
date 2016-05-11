# winservice-cookbook

Chef LWRP for creating and deleting Windows Services

## Supported Platforms

Windows 2008R2
Windows 2012
Windows 2012R2

## Attributes

<table>
  <tr>
    <th>Name</th>
    <th>String</th>
    <th>Name of the Service</th>
    <th>nil</th>
  </tr>
  <tr>
    <td><tt>['winservice']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
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

win_service "Delete Window Service" do
  name MyService
  action :delete
end

### winservice::default

Include `winservice` in your node's `metadata.rb`:


## License and Authors

Author:: Amitraj Budhu (<abudhu@gmail.com>)
