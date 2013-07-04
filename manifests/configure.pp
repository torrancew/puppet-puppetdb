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
class puppetdb::configure {
  Class['puppetdb::install'] -> Class['puppetdb::configure']
}

