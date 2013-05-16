class php::fpm::install {

  include php::repo

  package { $php::params::fpm_package_name:
    ensure  => present,
    require => [Class['php'],Class['php::repo']]
  }
}
