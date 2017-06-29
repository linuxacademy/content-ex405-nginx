class nginx(
  $ensure              = $::nginx::params::ensure,
  $package_name        = $::nginx::params::package_name,
  $config_dir          = $::nginx::params::config_dir,
  $config_ensure       = $::nginx::params::config_ensure,
  $config_mode         = $::nginx::params::config_mode,
  $config_owner        = $::nginx::params::config_owner,
  $config_group        = $::nginx::params::config_group,
  $config_confd        = $::nginx::params::config_confd,
  $config_log_dir      = $::nginx::params::config_log_dir,
  $config_pid_file     = $::nginx::params::config_pid_file,
  $config_vdir_enable  = $::nginx::params::config_vdir_enable,
  $config_process_user = $::nginx::params::config_process_user,
  $service_pattern     = $::nginx::params::service_pattern,
  $service_ensure      = $::nginx::params::service_ensure,
  $service_name        = $::nginx::params::service_name,
  $service_enable      = $::nginx::params::service_enable,
  $service_hasstatus   = $::nginx::params::service_hasstatus,
  $service_hasrestart  = $::nginx::params::service_hasrestart,
  $docroot             = $::nginx::params::docroot,
) inherits ::nginx::params {
  class { '::nginx::install': }
  -> class { '::nginx::config': }
  ~> class { '::nginx::service': }
}
