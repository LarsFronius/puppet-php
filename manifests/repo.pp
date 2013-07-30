class php::repo {

  if $php::params::repository == 'ondrej-php54' {
    apt::source { 'ondrej-php54':
      location => 'http://ppa.launchpad.net/ondrej/php5-oldstable/ubuntu',
      key      => 'E5267A6C',
      release  => 'precise',
      repos    => 'main'
    }
  }

}
