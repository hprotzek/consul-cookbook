#
# Cookbook Name:: consul
# License:: Apache 2.0
#
# Copyright 2014, 2015 Bloomberg Finance L.P.
#

class Chef::Resource::ConsulDefinitionCheck < Chef::Resource::LWRPBase
  self.resource_name = :consul_definition_check
  provides :consul_definition_service

  actions(:create, :delete)
  default_action(:create)

  attribute(:id,
    kind_of: [String, NilClass],
    name_attribute: true,
    default: nil)
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

  attribute(:http,
    kind_of: [String, NilClass],
    default: nil)
  attribute(:interval,
    kind_of: [String, NilClass],
    default: nil)
  attribute(:notes,
    kind_of: [String, NilClass],
    default: nil)
  attribute(:script,
    kind_of: [String, NilClass],
    default: nil)
  attribute(:ttl,
    kind_of: [String, NilClass],
    default: nil)

  def to_json
  end
end
