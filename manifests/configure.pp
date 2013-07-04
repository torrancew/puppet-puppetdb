# == Class: puppetdb::configure
#
# A class for configuring puppetdb
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
class puppetdb::configure(
  $threads = $puppetdb::params::threads,
  $var_dir = $puppetdb::params::var_dir,
  $temp_usage  = $puppetdb::params::temp_usage,
  $store_usage = $puppetdb::params::store_usage,
  $resource_query_limit = $puppetdb::params::resource_query_limit,
) inherits puppetdb::params {
  Class['puppetdb::install'] -> Class['puppetdb::configure']

  file {
    '/etc/puppetdb':
      ensure => directory,
      owner  => 'root',
      group  => 'root',
      mode   => 0755;

    '/etc/puppetdb/log4j.properties':
      ensure  => file,
      owner   => 'puppetdb',
      group   => 'puppetdb',
      mode    => 0640,
      require => File['/etc/puppetdb'];

    '/etc/puppetdb/conf.d':
      ensure  => directory,
      owner   => 'puppetdb',
      group   => 'puppetdb',
      mode    => 0750,
      require => File['/etc/puppetdb'];

    '/etc/puppetdb/conf.d/config.ini':
      ensure  => file,
      owner   => 'puppetdb',
      group   => 'puppetdb',
      mode    => 0640,
      content => template('puppetdb/config.ini.erb'),
      require => File['/etc/puppetdb/conf.d'];

    '/etc/puppetdb/conf.d/database.ini':
      ensure  => file,
      owner   => 'puppetdb',
      group   => 'puppetdb',
      mode    => 0640,
      require => File['/etc/puppetdb/conf.d'];

    '/etc/puppetdb/conf.d/jetty.ini':
      ensure  => file,
      owner   => 'puppetdb',
      group   => 'puppetdb',
      mode    => 0640,
      require => File['/etc/puppetdb/conf.d'];

    '/etc/puppetdb/conf.d/repl.ini':
      ensure  => file,
      owner   => 'puppetdb',
      group   => 'puppetdb',
      mode    => 0640,
      require => File['/etc/puppetdb/conf.d'];
  }
}

