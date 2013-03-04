class puppetdashboard::params{
  $app_dir    = '/usr/share/puppet-dashboard'
  $user       = 'puppet-dashboard'
  $user_home  = "/home/${user}"
  $group      = $user
  $git_source = 'git://github.com/puppetlabs/puppet-dashboard.git'
  $config_dir = "${app_dir}/config"
  $db_config  = "${config_dir}/database.yml"
}