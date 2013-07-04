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
  $package = 'puppetdb'
  $service = 'puppetdb'
  $version = 'installed'
}

