class cerebro::service (
  $ensure = $::cerebro::service_ensure,
  $enable = $::cerebro::service_enable,
) {

  if !($::operatingsystem == 'Amazon') {
    service { 'cerebro':
      ensure => $ensure,
      enable => $enable,
    }
  } else {
    service { 'cerebro.service':
      ensure  => 'running',
      restart => '/etc/init.d/cerebro restart',
      start   => '/etc/init.d/cerebro start',
      status  => '/etc/init.d/cerebro status',
      stop    => '/etc/init.d/cerebro stop',
    }
  }

}
