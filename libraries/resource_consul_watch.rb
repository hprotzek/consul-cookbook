#
# Cookbook Name:: consul
# License:: Apache 2.0
#
# Copyright 2014, 2015 Bloomberg Finance L.P.
#

class Chef::Resource::ConsulWatch < Chef::Resource::LWRPBase
  self.resource_name = :consul_watch
  provides :consul_watch

  attribute(:event_name,
    kind_of: String,
    name_attribute: true)
  attribute(:key_name,
    kind_of: String,
    name_attribute: true)
  attribute(:prefix_name,
    kind_of: String,
    name_attribute: true)
  attribute(:service_name,
    kind_of: String,
    name_attribute: true)
  attribute(:type,
    kind_of: String,
    cannot_be: :empty,
    equal_to: %w(checks event key keyprefix service),
    required: true)

  attribute(:datacenter,
    kind_of: String)
  attribute(:handler,
    kind_of: String)
  attribute(:token,
    kind_of: String)
end
