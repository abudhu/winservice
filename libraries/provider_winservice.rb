require 'chef/provider/lwrp_base'
require_relative 'helpers'

class Chef
  class Provider
    class WinService < Chef::Provider::LWRPBase
      include WinServiceCookbook::Helpers
      provides :win_service if defined?(provides)

      use_inline_resources if defined?(use_inline_resources)

      def whyrun_supported?
        true
      end

      # Start main :install action
	    action :create do
        if service_exists?(new_resource.name)
          Chef::Log::fatal("Service already exists by name:#{new_resource.name}")
        else
          invoke_command = create_sc_command(new_resource.name, new_resource.bin_path, new_resource.start_type, new_resource.display_name, new_resource.run_as_user, new_resource.run_as_password)

          powershell_script "Creating Service: #{new_resource.name}" do
            code <<-EOH
            sc.exe create #{invoke_command}
            EOH
            action :run
          end

        end

      end


      action :delete do
        if service_exists?(new_resource.name)
          stop_service(new_resource.name)
          powershell_script "Removing Service: #{new_resource.name}" do
            code <<-EOH
            sc.exe delete \"#{new_resource.name}\"
            EOH
          end
        else
          Chef::Log::fatal("No Service by name of: #{new_resource.name} exists.  Are you sure you have the right service name?")
        end
      end


    end
  end
end
