class cassandra::service {
    service { $cassandra::service_name:
        ensure     => running,
        enable     => true,
        hasstatus  => true,
        status => '/bin/bash -c ". /etc/rc.d/init.d/functions && status -p /var/run/cassandra/cassandra.pid cassandra"',
        hasrestart => true,
        subscribe  => Class['cassandra::config'],
        require    => Class['cassandra::config'],
    }
}
