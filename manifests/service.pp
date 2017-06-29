class nginx::service(
  $ensure       = $::nginx::service_ensure,
  $service_name = $::nginx::service_name,
  $pattern      = $::nginx::service_pattern,
  $enable       = $::nginx::service_enable,
  $hasstatus    = $::nginx::service_hasstatus,
  $hasrestart   = $::nginx::service_hasrestart,
) {
  service { 'nginx_service':
    ensure     => $ensure,
    name       => $service_name,
    enable     => $enable,
    hasstatus  => $hasstatus,
    hasrestart => $hasrestart,
    pattern    => $pattern,
  }
}
