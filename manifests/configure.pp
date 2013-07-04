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
  # config.ini
  $threads              = $puppetdb::params::threads,
  $var_dir              = $puppetdb::params::var_dir,
  $temp_usage           = $puppetdb::params::temp_usage,
  $store_usage          = $puppetdb::params::store_usage,
  $resource_query_limit = $puppetdb::params::resource_query_limit,

  # database.ini
  $use_postgres     = $puppetdb::params::use_postgres,
  $database         = $puppetdb::params::database,
  $db_host          = $puppetdb::params::db_host,
  $db_port          = $puppetdb::params::db_port,
  $db_user          = $puppetdb::params::db_user,
  $db_password      = $puppetdb::params::db_password,
  $gc_interval      = $puppetdb::params::gc_interval,
  $slow_query_limit = $puppetdb::params::slow_query_limit,

  # jetty.ini
  $host     = $puppetdb::params::host,
  $port     = $puppetdb::params::port,
  $ssl_host = $puppetdb::params::ssl_host,
  $ssl_port = $puppetdb::params::ssl_port,

  # repl.ini
  $use_repl  = $puppetdb::params::use_repl,
  $repl_type = $puppetdb::params::repl_type,
  $repl_port = $puppetdb::params::repl_port,
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
      content => template('puppetdb/database.ini.erb'),
      require => File['/etc/puppetdb/conf.d'];

    '/etc/puppetdb/conf.d/jetty.ini':
      ensure  => file,
      owner   => 'puppetdb',
      group   => 'puppetdb',
      mode    => 0640,
      content => template('puppetdb/jetty.ini.erb'),
      require => File['/etc/puppetdb/conf.d'];

    '/etc/puppetdb/conf.d/repl.ini':
      ensure  => file,
      owner   => 'puppetdb',
      group   => 'puppetdb',
      mode    => 0640,
      content => template('puppetdb/repl.ini.erb'),
      require => File['/etc/puppetdb/conf.d'];
  }
}

