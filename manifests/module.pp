define php::module(
  $ensure = present,
  $package_prefix = 'php5-',
  $source = undef,
  $content = undef,
  $require = undef,
  $notify = undef
) {
  include php

  $file_name = "${name}.ini"

  if $require {
    $real_require = [
      Class['php::install'],
      $require,
    ]
  } else {
    $real_require = Class['php::install']
  }

  package { "php-${name}":
    ensure  => $ensure,
    name    => "${package_prefix}${name}",
    require => $real_require,
  }

  $content_real = $content ? {
    undef   => undef,
    default => $content
  }

  file { $file_name:
    ensure  => $ensure,
    path    => "${php::params::conf_dir}${file_name}",
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    notify  => $notify,
    content => $content_real,
    require => [
      Class['php'],
      Package["php-${name}"],
    ],
  }
}
