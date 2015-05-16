#
# Cookbook Name:: consul
# License:: Apache 2.0
#
# Copyright 2014, 2015 Bloomberg Finance L.P.
#

class Chef::Provider::ConsulClientSource < Chef::Provider::ConsulClient
  provides :consul_client

  action :create do
    include_recipe 'golang::default'

    directory new_resource.path do
      recursive true
      owner 'root'
      group 'root'
      mode '00755'
    end

    git new_resource.path do
      repository new_resource.url
      reference new_resource.version
      action :checkout
    end

    golang_package 'github.com/hashicorp/consul' do
      action :install
    end

    directory Dir.dirname(new_resource.filename) do
      recursive true
      owner 'root'
      group 'root'
      mode '00755'
    end

    link File.join(new_resource.path, 'consul') do
      to new_resource.filename
    end
  end
end
