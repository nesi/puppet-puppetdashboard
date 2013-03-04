# Puppet Dashboard

A Puppet module (`puppetdashboard`) for installing the [Puppet Dashboard](https://puppetlabs.com/puppet/related-projects/dashboard/) web interface, using [Passenger](https://www.phusionpassenger.com/) and [Apache](http://httpd.apache.org/).

# To install into puppet

Clone `puppetdashboard` into your puppet configuration in your `puppet/modules` directory:

  # git clone git://github.com/nesi/puppet-puppetdashboard.git puppet

Or if you're managing your Puppet configuration with git, in your `puppet` configuration directory:

  # git submodule add git://github.com/nesi/puppet-puppetdashboard.git modules/puppet --init --recursive
  # cd modules/puppetdashboard
  # git checkout master
  # git pull
  # cd ../..
  # git commit -m "added puppetdashboard submodule from https://github.com/nesi/puppet-puppetdashboard"

It might seem bit excessive, but it will make sure the submodule isn't headless...

# Dependencies

This module depends on the following Puppet modules:

* [stdlib][3]
* [Apache][1], currently requires the [nesi-apache][2] fork, and depends on:
  * [firewall][4]
  * [concat][5]
  * [Ruby][6]
  * [git][7]
  
## Optional dependencies

These dependencies may be required depending on how the `puppetdashboard` module is used:

* [MySQL][8] is a remote dependency, i.e. the server specified in the `db_host` parameter must be configured with the Puppetlabs MySQL puppet module.

[1]:https://github.com/hunner/puppetlabs-apache
[2]:https://github.com/nesi/puppetlabs-apache/tree/dynaguppy_hunner
[3]:https://github.com/puppetlabs/puppetlabs-stdlib
[4]:https://github.com/puppetlabs/puppetlabs-firewall
[5]:https://github.com/puppetlabs/puppetlabs-concat
[6]:https://github.com/puppetlabs/puppetlabs-ruby
[7]:https://github.com/nesi/puppet-git
[8]:https://github.com/puppetlabs/puppetlabs-mysql

# References

* http://docs.puppetlabs.com/dashboard/manual/1.2/bootstrapping.html
* http://berndadamowicz.wordpress.com/2011/12/07/keeping-puppet-dashboards-database-small/
* http://docs.puppetlabs.com/dashboard/passenger.html
* http://keymon.wordpress.com/2010/09/20/setting-puppetmaster-and-puppet-dashboard-with-passenger-in-a-debian-apache-server-using-puppet-user/

# Attribution

This module is derived from the puppet-blank module by Aaron Hicks (aethylred@gmail.com)

* https://github.com/Aethylred/puppet-blank

This module has been developed for the use with Open Source Puppet (Apache 2.0 license) for automating server & service deployment.

* http://puppetlabs.com/puppet/puppet-open-source/

# Gnu General Public License

This file is part of the puppetdashboard Puppet module.

The puppetdashboard Puppet module is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

The puppetdashboard Puppet module is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with the blank Puppet module.  If not, see <http://www.gnu.org/licenses/>.