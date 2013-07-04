# == Class: puppetdb::install
#
# A class for installing puppetdb
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
class puppetdb::install(
  $package = $puppetdb::params::package,
  $version = $puppetdb::params::version,
) inherits puppetdb::params{
  validate_string( $package )
  validate_string( $version )
  package {
    'puppetdb':
      name   => $package,
      ensure => $version;
  }
}

