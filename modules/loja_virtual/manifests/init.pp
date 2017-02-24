
#  Puppet Manifest File
#  Created with the Puppet Plugin for Netbeans.

class loja_virtual {
  class { 'apt':
    always_apt_update => true,
}
  Class['apt'] -> Package <| |>
}
