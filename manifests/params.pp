class puppetdashboard::params {
  $app_dir    = '/usr/share/puppet/puppet-dashboard'
  $user       = 'puppet-dashboard'
  $user_home  = "/home/${user}"
  $group      = $user
  $git_source = 'git://github.com/puppetlabs/puppet-dashboard.git'
}