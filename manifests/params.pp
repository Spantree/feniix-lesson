# == Class lesson::params
#
# This class is meant to be called from lesson
# It sets variables according to platform
#
class lesson::params {

  case $::osfamily {
    'Ubuntu': {
    }
    'Debian': {
    }
    'RedHat': {
    }
    default: {
      fail("osfamily ${::osfamily} not supported")
    }
  }
}
