# Class: puppetdashboard
#
# This module manages the Puppet Dashboard web interface
#
# Parameters:
# $app_dir  The root directory for the Puppet Dashboard web application
#
# Actions:
#
# Requires: Apache, concat, firewall, stdlib, git
#
# Sample Usage:
#

# This file is part of the puppetdashboard Puppet module.
#
#     The puppetdashboard Puppet module is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.
#
#     The puppetdashboard Puppet module is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.
#
#     You should have received a copy of the GNU General Public License
#     along with the puppetdashboard Puppet module.  If not, see <http://www.gnu.org/licenses/>.

# [Remember: No empty lines between comments and class definition]
class puppetdashboard(
  $app_dir    = $puppetdashboard::params::app_dir,
  $user       = $puppetdashboard::params::user,
  $user_home  = $puppetdashboard::params::user_home,
  $group      = $puppetdashboard::params::group,
  $git_source = $puppetdashboard::params::git_source,
  $git_branch = undef
) inherits puppetdashboard::params {

  # Require dependencies than must be on the dashboard web server
  require apache
  require apache::mod::passenger
  require ruby
  require git

  # NOTE: mysql is not required to allow for the use of remote databases
  # NOTE: database module is not required to allow for use for something other than mysql
  # NOTE: ruby-mysl not required (yet) to allow selection of another database library

  # Parameter validation should go here

  # Install Puppet Dashboard
  case $::operatingsystem{
    Ubuntu:{
      class { puppetdashboard::install:
        app_dir     => $app_dir,
        user        => $user,
        user_home   => $user_home,
        group       => $group,
        git_source  => $git_source,
        git_branch  => $git_branch,
      }
    }
    default:{
      warning("Puppet Dashboard not supported on ${::operatingsystem} on ${::fqdn}")
    }
  }
}
