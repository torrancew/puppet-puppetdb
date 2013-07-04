# == Class: puppetdb::service
#
# A class to manage the puppetdb service
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
class puppetdb::service(
  $service = $puppetdb::params::service,
) inherits puppetdb::params {
  Class['puppetdb::configure'] ~> Class['puppetdb::service']

  validate_string( $service )
  service {
    'puppetdb':
      name   => $service,
      ensure => running,
      enable => true;
  }
}

