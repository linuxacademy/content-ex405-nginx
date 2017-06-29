class nginx::install(
  $ensure       = $::nginx::ensure,
  $package_name = $::nginx::package_name,
) {
  package { 'install_nginx':
    ensure => $ensure,
    name   => $package_name,
  }
}
