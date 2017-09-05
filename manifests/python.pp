class profile::python {
  class { '::python':
    version    => 'python34',
    pip        => 'present',
    dev        => 'present',
    virtualenv => 'present',
    gunicorn   => 'absent',
  }

  #::python::requirements { '/vagrant/requirements.txt': }

  ::python::pyenv { '/var/www/project1':
    ensure => present,
    version => 'python34',
    venv_dir => '/tmp/venvs',
    owner => 'root',
    group => 'root',
  }
}
