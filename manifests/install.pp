class php::install {

  include php::repo

  package { $php::params::cli_package_name:
    ensure => present,
    require => Class['php::repo']
  }

}
