# == Class: puppetdb::params
#
# This class contains defaults for parameters used
# in the puppetdb module
#
# === Parameters:
#
# None
#
# === Variables:
#
# None
#
# === Examples:
#
# None
#
# === Authors:
#
# * Tray Torrance
#
# === Copyright:
#
# Copyright 2013, Tray Torrance
# unless otherwise noted.
#
class puppetdb::params {
  # Installation Parameters
  $package = 'puppetdb'
  $version = 'installed'

  # Configuration Parameters
  $var_dir     = '/var/lib/puppetdb'
  $temp_usage  = 51200
  $store_usage = 102400
  $multi_cpu   = ($::processorcount != '1')
  $threads     = $multi_cpu ? {
    false => $::processorcount,
    true  => inline_template('<%= @processorcount / 2 %>'),
  }

  $resource_query_limit = 20000

  # Service Parameters
  $service = 'puppetdb'
}

