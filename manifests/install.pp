
# NOTE: This class should _not_ be called directly. Instead use:
# class{ puppetdashboard: }
class puppetdashboard::install(
  $app_dir,
  $user,
  $user_home,
  $group,
  $git_source,
  $git_branch
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
    groups      => [$group,$apache::params::group],
    managehome  => true,
  }

  file{$app_dir:
    ensure  => directory,
    owner   => $user,
    group   => $apache::params::group,
    recurse => true,
  }

  git::user{$user: }

  git::repo{'puppet-dashboard':
    path    => $app_dir,
    source  => $git_source,
    branch  => $git_branch,
    owner   => $user,
  }

}