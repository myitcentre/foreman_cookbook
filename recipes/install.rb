# -*- coding: utf-8 -*-
#
# Cookbook Name:: foreman
# Recipe:: install
#
include_recipe 'foreman::repo' if node['foreman']['use_repo']

# Ubuntu Trusty (14.04) comes with Ruby 1.9.1 as default Ruby version.
# Foreman 1.14 requires Ruby >= 2.0.0.
package 'ruby2.3'

package 'foreman' do
  version node['foreman']['version'] unless
    node['foreman']['version'] == 'stable'
end

case node['foreman']['db']['adapter']
when 'sqlite'
  pkg = if node['platform_family'] == 'debian'
          'foreman-sqlite3'
        else
          'foreman-sqlite'
        end
when 'postgresql'
  pkg = 'foreman-postgresql'
when 'mysql'
  pkg = 'foreman-mysql2'
end

package pkg

include_recipe 'apache2'
# @TODO remove when apache2 will works fine
execute 'remove-other-vhost' do
  command 'a2disconf other-vhosts-access-log && sleep 2'
end

package node['foreman']['passenger']['package'] do
  action :install
  only_if { node['foreman']['passenger']['install'] }
end
