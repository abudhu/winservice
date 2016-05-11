module WinServiceCookbook
  module Helpers
    include Chef::DSL::IncludeRecipe
    require "win32/service"

    def service_exists?(service_name)
      if Win32::Service.exists?(service_name)
        true
      else
        false
      end
    end

    def create_sc_command(name, bin_path, start_type, display_name, run_as_user, run_as_password)
      if run_as_user == "LocalSystem"
        command = "\"#{name}\" binPath= \"#{bin_path}\" start= #{start_type} DisplayName= \"#{display_name}\" obj= \"#{run_as_user}\""
      else
        command = "\"#{name}\" binPath= \"#{bin_path}\" start= #{start_type} DisplayName= \"#{display_name}\" obj= \"#{run_as_user}\" password= \"#{run_as_password}\""
      end
    end

    def stop_service(service_name)
      if Win32::Service.exists?(service_name) && Win32::Service.status(service_name)['current_state'] != "stopped"
        begin
          Win32::Service.stop(service_name)
        rescue Exception => e
          raise "Service #{service_name} could not be stopped. Try again later.\nFull Exception: #{e}"
        end
      end
    end

  end
end
