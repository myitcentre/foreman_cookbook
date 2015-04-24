name 'foreman'
maintainer 'Guilhem Lettron'
maintainer_email 'guilhem.lettron@optiflows.com'
license 'Apache v2'
description 'Installs/Configures foreman'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.0.1'

depends 'apt'
depends 'ark'
depends 'bind'
depends 'dhcp'
depends 'git'
depends 'hostname'
depends 'hostsfile'
depends 'passenger_apache2'
depends 'application_ruby'
depends 'tftp'
depends 'uwsgi'
