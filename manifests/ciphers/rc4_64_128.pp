# == Class: crypto_win::ciphers::rc4_64_128
class crypto_win::ciphers::rc4_64_128 {

  if $crypto_win::rc4_64_128 {
    $rc4_64_128_enabled = 4294967295
  } else {
    $rc4_64_128_enabled = 0
  }

  registry_key { 'rc4_64_128':
    ensure => present,
    path   => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 128/128',
  }
  registry_value { 'rc4_64_128_enabled':
    ensure  => present,
    path    => 'HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 128/128\Enabled',
    type    => string,
    data    => $rc4_64_128_enabled,
    require => Registry_key['rc4_64_128'],
  }

}
