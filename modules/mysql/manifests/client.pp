
#  Puppet Manifest File
#  Created with the Puppet Plugin for Netbeans.

class mysql::client {
package { "mysql-client":
ensure => installed,
}
}

