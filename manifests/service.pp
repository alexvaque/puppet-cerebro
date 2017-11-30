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
      #restart => '/opt/cerebro/bin/cerebro -Dconfig.file=/etc/cerebro/application.conf',
      start   => '/usr/bin/nohup /opt/cerebro/bin/cerebro -Dconfig.file=/etc/cerebro/application.conf',
      #status  => '',
      #stop    => '',
    }
  }

}
