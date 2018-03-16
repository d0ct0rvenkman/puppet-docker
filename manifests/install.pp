# == Class: docker
#
# Module to install an up-to-date version of Docker from a package repository.
# This module currently works only on Debian, Red Hat
# and Archlinux based distributions.
#
class docker::install {

  if $docker::package_manage {

    package { $docker::package_name:
      ensure => $docker::ensure,
    }

  }

}
