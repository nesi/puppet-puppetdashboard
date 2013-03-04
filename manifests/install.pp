
# NOTE: This class should _not_ be called directly. Instead use:
# class{ puppetdashboard: }
class puppetdashboard::install(
  $app_dir,
  $user,
  $user_home,
  $group,
  $git_source,
  $git_branch,
  $db_host,
  $database,
  $db_user,
  $db_password
){

  # Installing from the PuppetLabs package repository would be easy
  # BUT would set up Puppet Dashboard to use WEBrick, which would require
  # disabling and purging WEBrick. Let's not do that, let's use git!

  group{$group:
    ensure      => present,
  }

  user{$user:
    ensure      => present,
    home        => $user_home,
    gid         => $group,
    groups      => [$apache::params::group],
    managehome  => true,
  }

  file{$app_dir:
    ensure  => directory,
    owner   => $user,
    group   => $apache::params::group,
    recurse => true,
    ignore  => ['.git'],
    require => [User[$user],Group[$apache::params::group]],
  }

  git::user{$user:
    require => User[$user],
  }

  git::repo{'puppet-dashboard':
    path    => $app_dir,
    source  => $git_source,
    branch  => $git_branch,
    owner   => $user,
  }

  if $db_host {
    $real_db_host = $db_host
  } else {
    $real_db_host = 'localhost'
  }

  mysql::db {$database:
    user      => $db_user,
    password  => $db_password,
    host      => $real_db_host,
    grant     => ['all'],
  }

}