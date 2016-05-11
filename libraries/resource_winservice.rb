require 'chef/resource/lwrp_base'

class Chef
  class Resource
    class WinService < Chef::Resource::LWRPBase
      provides :win_service

      self.resource_name = :win_service

      actions :create,:delete
      default_action :create

      attribute :name, kind_of: String, default: nil
      attribute :bin_path, kind_of: String, default: nil
      attribute :start_type, kind_of: String, default: "disabled"
      attribute :display_name, kind_of: String, default: nil
      attribute :run_as_user, kind_of: String, default: "LocalSystem"
      attribute :run_as_password, kind_of: String, default: nil

    end
  end
end
=begin
      #sc.exe
      create
      \"#{node['order_management']['service_name']}\"
      binPath= #{node['order_management']['bin_path']}
      start= auto DisplayName= \"#{node['order_management']['service_name']}\"
      obj= \"#{node['order_management']['username']}\"
      password= \"#{node['order_management']['username']}\"

=end
