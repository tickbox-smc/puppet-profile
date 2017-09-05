class profile::python {
  class { '::python':
    version    => 'python34',
    pip        => 'present',
    dev        => 'present',
    virtualenv => 'absent',
    gunicorn   => 'absent',
  }

  #::python::requirements { '/vagrant/requirements.txt': }

  ::python::pip { 'Flask':
    pkgname => 'Flask',
    ensure  => '0.10.1',
    timeout => 1800,
  }

}
