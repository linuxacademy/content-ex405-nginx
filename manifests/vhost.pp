define nginx::vhost(
  $port               = 80,
  $priority           = '50',
  $server_aliases     = '',
  $enable             = true,
  $owner              = $::nginx::config_owner,
  $group              = $::nginx::config_group,
  $mode               = $::nginx::config_mode,
  $config_vdir_enable = $::nginx::config_vdir_enable,
  $log_dir            = $::nginx::config_log_dir,
  $vhost_dir          = $::nginx::vhost_dir,
) {
  $vhost_docroot = "${::nginx::docroot}/${name}"

  file { "${vhost_dir}/${priority}-${name}.conf":
    ensure => file,
    content => template("${module_name}/vhost/vhost.conf.erb"),
    mode    => $mode,
    owner   => $owner,
    group   => $group,
    notify  => Service['nginx_service'],
  }

  file { $vhost_docroot:
    ensure  => directory,
    recurse => true,
    mode    => '0755',
    owner   => $owner,
    group   => $group,
  }
}
