# == Class: puppetdb
#
# The puppetdb module
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
class puppetdb {
  class { 'puppetdb::install': }
  class { 'puppetdb::configure': }
  class { 'puppetdb::service': }

  anchor { 'puppetdb::begin': } -> Class['puppetdb::install']
  Class['puppetdb::service']    -> anchor { 'puppetdb::end': }
}

