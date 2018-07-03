# == Class: crypto_win::ciphers::null
class crypto_win::ciphers::null {

  if $crypto_win::null {
    $null_enabled = 4294967295
  } else {
    $null_enabled = 0
  }

  registry_key { 'null':
    ensure => present,
    path   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\NULL',
  }
  registry_value { 'null_enabled':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\NULL\Enabled',
    type    => string,
    data    => $null_enabled,
    require => Registry_key['null'],
  }

}
