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

  attribute(:id,
    kind_of: String,
    name_attribute: true)
  attribute(:run_user,
    kind_of: String,
    required: true,
    cannot_be: :empty,
    default: 'consul')
  attribute(:run_group,
    kind_of: String,
    required: true,
    cannot_be: :empty,
    default: 'consul')

  attribute(:address,
    kind_of: [String, NilClass])
  attribute(:port,
    kind_of: [Integer, NilClass])
  attribute(:tags,
    kind_of: [Array, String, NilClass])
  attribute(:checks,
    kind_of: [ConsulDefinitionCheck, Hash, NilClass])

  def to_json
  end
end
