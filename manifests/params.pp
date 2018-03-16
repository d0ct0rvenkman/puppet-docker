# == Class: docker::params
#
# Default parameter values for the docker module
#
class docker::params {
  $ensure = 'present'
  $package_manage = true
  $service_state = running
  $service_enable = true
  $service_state_storage = 'stopped'
  $service_enable_storage = false
  # options
  $selinux_enabled = true
  $bind_to = 'unix:///var/run/docker.sock'
  $log_level = 'info'
  $tmp_dir = '/var/tmp'
  $log_rotate = false
  $dns = undef
  $dns_search = undef
  $add_registry = undef
  $block_registry = undef
  $insecure_registry = undef
  $extra_parameters = undef
  # storage options
  $storage_driver = undef
  $dm_basesize = undef
  $dm_fs = undef
  $dm_mkfsarg = undef
  $dm_mountopt = undef
  $dm_blocksize = undef
  $dm_loopdatasize = undef
  $dm_loopmetadatasize = undef
  $dm_thinpooldev = undef
  $dm_use_deferred_removal = undef
  # network options
  $bridge = undef
  $iptables = undef
  $ip_masq = undef
  $network_extra_parameters = undef

  #set package to docker-io for centos6 specifically
  case $::osfamily {
    'RedHat': {
      case $::operatingsystemmajrelease {
        6: {
          $package_name = 'docker-io'
        }
        7: {
          $package_name = 'docker'
        }
      }
    }
    default: {
      $package_name = 'docker'
    }
  }

}
