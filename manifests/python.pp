class profile::python {
  class { '::python':
    version    => 'python34',
    pip        => 'present',
    dev        => 'present',
    virtualenv => 'present',
    gunicorn   => 'absent',
  }

  if ( $need_to_install == undef ) {
    
    exec { 'install python packages':
      command   => 'pip3 install flask flask_restful; touch /root/installed.txt',
      path      => [ '/usr/bin/' ],
      before    => Exec['create custom facter'],
    }

    exec { 'create custom facter':
      command  => "mkdir -p /etc/facter/facts.d; echo 'need_to_install=false' > /etc/facter/facts.d/check_pip_install.txt",
      provider => shell,
    }

  } 
}
