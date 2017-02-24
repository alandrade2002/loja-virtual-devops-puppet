
#  Puppet Manifest File
#  Created with the Puppet Plugin for Netbeans.

include mysql::client


include tomcat::server

$keystore_file = "/etc/ssl/.keystore"
$ssl_connector = {
"port" => 8443,
"protocol" => "HTTP/1.1",
"SSLEnabled" => true,
"maxThreads" => 150,
"scheme" => "https",
"secure" => "true",
"keystoreFile" => $keystore_file,
"keystorePass" => "secret",
"clientAuth" => false,
"sslProtocol" => "SSLv3",


$db_host = "192.168.33.10"
$db_schema = "loja_schema"
$db_user = "loja"
$db_password = "lojasecret"

file { $keystore_file:
 mode => 0644,
 source => "/vagrant/manifests/.keystore",
 }
 
 class { "tomcat::server":
 connectors => [$ssl_connector],
 require => File[$keystore_file],
}

file { "/var/lib/tomcat7/webapps/devopsnapratica.war":
owner => tomcat7,
group => tomcat7,
mode => 0644,
source => "/vagrant/manifests/devopsnapratica.war",
require => Package["tomcat7"],
notify => Service["tomcat7"],
}
 
