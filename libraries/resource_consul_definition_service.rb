#
# Cookbook Name:: consul
# License:: Apache 2.0
#
# Copyright 2014, 2015 Bloomberg Finance L.P.
#

class Chef::Resource::ConsulDefinitionService < Chef::Resource::LWRPBase
  self.resource_name = :consul_definition_service
  provides :consul_definition_service

  actions(:create, :delete)
  default_action(:create)

  attribute(:service_name,
    kind_of: String,
    cannot_be: :empty,
    name_attribute: true,
    required: true)

  attribute(:address,
    kind_of: [String, NilClass],
    default: nil)
  attribute(:port,
    kind_of: [Integer, NilClass],
    default: nil)
  attribute(:tags,
    kind_of: [Array, String, NilClass],
    default: nil)
  attribute(:checks,
    kind_of: [ConsulDefinitionCheck, Hash, NilClass],
    default: nil)
end
