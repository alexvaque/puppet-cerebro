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
      ensure => $ensure,
      enable => $enable,
      restart => '/etc/init.d/cerebro restart',
      start   => '/etc/init.d/cerebro start',
      stop    => '/etc/init.d/cerebro stop',
    }
  }

}
