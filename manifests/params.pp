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

  $use_postgres     = false
  $database         = 'puppetdb'
  $db_host          = 'localhost'
  $db_port          = 5432
  $db_user          = 'puppetdb'
  $db_password      = 'puppetdb'
  $gc_interval      = 60
  $slow_query_limit = 10

  # Service Parameters
  $service = 'puppetdb'
}

