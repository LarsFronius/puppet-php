class php::config {
  file { $php::params::extra_dir:
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    purge   => $php::params::purge_conf,
    recurse => true,
    force   => true,
    require => Class['php::install'],
  }

  file { $php::params::conf_dir:
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    purge   => $php::params::purge_conf,
    recurse => true,
    force   => true,
    require => Class['php::install'],
  }

  file { $php::params::cli_ini:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    content => $php::cli_ini_content,
    source  => $php::cli_ini_source,
    require => [Class['php::install'],File[$php::params::cli_dir]]
  }

  file { $php::params::cli_dir:
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    purge   => $php::params::purge_conf,
    recurse => true,
    force   => true,
    require => Class['php::install'],
  }

}
