class profile::python {
  class { '::python':
    version    => 'python34',
    pip        => 'present',
    dev        => 'absent',
    virtualenv => 'absent',
    gunicorn   => 'absent',
  }
}


