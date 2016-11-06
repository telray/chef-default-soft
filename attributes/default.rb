#
# Author:: Ben Dixon
# Cookbook Name:: chef-default-soft
# Attributes:: default
#

# default environment flag (not linked to rails environment)
default[:environment] = 'development'
default["chef-default-soft"]["additional_locales"] = []
