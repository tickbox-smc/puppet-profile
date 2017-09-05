class profile::python {
  class { '::python':
    version    => 'python34',
    pip        => 'present',
    dev        => 'present',
    virtualenv => 'absent',
    gunicorn   => 'absent',
  }

  ::python::requirements { '/vagrant/requirements.txt': }
}
