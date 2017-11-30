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
      restart => '/etc/init.d/cerebro.sh restart',
      start   => '/etc/init.d/cerebro.sh start',
      #status  => '',
      stop    => '/etc/init.d/cerebro.sh stop',
    }
  }

}
