# Disable a warning so the puppet runs look clean.
Package {
  allow_virtual => false,
}
Nagios_host {
  owner => 'icinga',
  group => 'icinga',
}
Nagios_service {
  owner => 'icinga',
  group => 'icinga',
}
import 'nodes/*.pp'
