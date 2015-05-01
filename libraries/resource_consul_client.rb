#
# Cookbook Name:: consul
# License:: Apache 2.0
#
# Copyright 2014, 2015 Bloomberg Finance L.P.
#

class Chef::Resource::ConsulClient < Chef::Resource::LWRPBase
  self.resource_name = :consul_client
  actions(:create, :delete)
  default_action(:create)

  attribute(:path,
    kind_of: String,
    name_attribute: true,
    required: true,
    cannot_be: :empty)
  attribute(:run_user,
    kind_of: String,
    required: true,
    cannot_be: :empty,
    default: 'consul')
  attribute(:run_group,
    kind_of: String,
    cannot_be: :empty,
    required: true,
    default: 'consul')

  attribute(:remote_url,
    kind_of: String,
    cannot_be: :empty,
    required: true)
  attribute(:remote_version,
    kind_of: String,
    cannot_be: :empty,
    required: true)
  attribute(:remote_checksum,
    kind_of: [String, NilClass],
    default: nil)
end
