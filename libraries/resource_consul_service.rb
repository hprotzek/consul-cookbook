#
# Cookbook Name:: consul
# License:: Apache 2.0
#
# Copyright 2014, 2015 Bloomberg Finance L.P.
#

class Chef::Resource::ConsulService < Chef::Resource::LWRPBase
  self.resource_name = :consul_service
  actions(:create, :delete, :start, :stop, :restart, :reload)
  default_action(:create)

  attribute(:instance,
    kind_of: String,
    name_attribute: true,
    required: true,
    cannot_be: :empty)
  attribute(:run_user,
    kind_of: String,
    cannot_be: :empty,
    required: true,
    default: 'consul')
  attribute(:run_group,
    kind_of: String,
    cannot_be: :empty,
    required: true,
    default: 'consul')

  attribute(:config_filename,
    kind_of: String,
    required: true,
    cannot_be: :empty)
  attribute(:config_dir,
    kind_of: String,
    required: true,
    cannot_be: :empty)

  attribute(:extra_options,
    kind_of: [Array, NilClass])
end
