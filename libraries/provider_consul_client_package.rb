#
# Cookbook Name:: consul
# License:: Apache 2.0
#
# Copyright 2014, 2015 Bloomberg Finance L.P.
#

class Chef::Provider::ConsulClientPackage < Chef::Provider::ConsulClient
  provides :consul_client

  action :create do
    package 'consul' do
      action :upgrade
    end
  end

  action :delete do
    package 'consul' do
      action :remove
    end
  end
end
