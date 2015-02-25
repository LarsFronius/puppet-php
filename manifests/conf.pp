define php::conf(
  $ensure = present,
  $content = undef,
  $require = undef,
  $notify = undef
) {
  include php

  $file_name = "${name}.ini"

  $require_real = $require ? {
    undef   => Class['php'],
    default => [
      Class['php'],
      $require,
    ],
  }

  file { $file_name:
    ensure  => $ensure,
    path    => "${php::params::conf_dir}${file_name}",
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    notify  => $notify,
    require => $require_real,
    content => $content,
  }
}
