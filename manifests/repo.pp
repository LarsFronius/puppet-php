class php::repo {

  if $php::params::repo == 'ondrej-php54' {
    apt::source { 'ondrej-php54':
      location => 'http://ppa.launchpad.net/ondrej/php5/ubuntu',
      key      => 'E5267A6C',
      release  => $::lsbdistcodename,
      repos    => 'main'
    }
  }
  if $php::params::repo == 'dotdeb' {
    apt::source { 'dotdeb':
      location    => 'http://packages.dotdeb.org/',
      key         => '89DF5277',
      key_source  => 'http://www.dotdeb.org/dotdeb.gpg',
      release     => 'stable',
      repos       => 'all',
      include_src => false
    }
  }

}
