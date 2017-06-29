class nginx::config(
  $ensure       = $::nginx::config_ensure,
  $config_dir   = $::nginx::config_dir,
  $mode         = $::nginx::config_mode,
  $owner        = $::nginx::config_owner,
  $group        = $::nginx::config_group,
  $confd        = $::nginx::config_confd,
  $log_dir      = $::nginx::config_log_dir,
  $pid_file     = $::nginx::config_pid_file,
  $vdir_enable  = $::nginx::config_vdir_enable,
  $process_user = $::nginx::config_process_user,
  $docroot      = $::nginx::docroot,
) {
  file { 'nginx_conf':
    ensure => $ensure,
    path   => "${config_dir}/nginx.conf",
    mode   => $mode,
    owner  => $owner,
    group  => $group,
    content => template("${module_name}/conf.d/nginx.conf.erb"),
  }

  file { $log_dir:
    ensure  => directory,
    recurse => true,
  }

  file { $docroot:
    ensure => directory,
    recurse => true,
    mode   => $mode,
    owner  => $owner,
    group  => $group,
  }
}
