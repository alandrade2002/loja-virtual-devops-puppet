
#  Puppet Manifest File
#  Created with the Puppet Plugin for Netbeans.

class loja_virtual::db {
  include loja_virtual
  include mysql::server
  include loja_virtual::params
  mysql::db { $loja_virtual::params::db['user']:
  schema => $loja_virtual::params::db['schema'],
  password => $loja_virtual::params::db['password'],
  }
}