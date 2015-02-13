#
# Cookbook Name:: consul
# License:: Apache 2.0
#
# Copyright 2014, 2015 Bloomberg Finance L.P.
#

class Chef::Provider::ConsulServiceSysvinit < Chef::Provider::ConsulService
  action :start do
    service new_resource.service_name do
      supports status: true, restart: true, reload: true
      action [:start, :enable]
    end
  end

  action :stop do
    service new_resource.service_name do
      supports status: true, restart: true, reload: true
      action :stop
    end
  end

  action :restart do
    service new_resource.service_name do
      supports status: true, restart: true, reload: true
      action :restart
    end
  end

  action :reload do
    service new_resource.service_name do
      supports status: true, restart: true, reload: true
      action :reload
    end
  end

  action :create do
    super
    template "/etc/init.d/#{new_resource.service_name}" do
      source 'consul-init.erb'
      mode '0755'
      variables(
        run_user: new_resource.run_user,
        run_group: new_resource.run_group
      )
    end
  end

  action :delete do
    super
    file "/etc/init.d/#{new_resource.service_name}" do
      action :delete
    end
  end
end