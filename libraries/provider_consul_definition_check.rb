#
# Cookbook Name:: consul
# License:: Apache 2.0
#
# Copyright 2014, 2015 Bloomberg Finance L.P.
#

class Chef::Provider::ConsulDefinitionCheck < Chef::Provider::LWRPBase
  provides :consul_definition_check

  action :create do
    file new_resource.path do
      user new_resource.run_user
      group new_resource.run_group
      mode '0600'
      content new_resource.to_json
    end
  end

  action :delete do
    file new_resource.path do
      action :delete
    end
  end

  def whyrun_enabled?
    true
  end

  use_inline_resources if defined?(use_inline_resources)
end
