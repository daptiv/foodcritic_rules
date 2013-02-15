ETSY007 - Package or yum_package resource used to install core package without specific version number
==============================================

This rule identifies when a recipe is installing a package for something we've identified as a "core" service without specifying a specific version number to install. We've had instances in the past of divergence occurring when action :install is used by itself, and a new package has been added to the repository resulting in new servers installing the new version while old servers are still using the previous version.

The list of package names to check for is defined at the top of rules.rb:

````
@coreservicepackages = ["httpd", "Percona-Server-server-51", "memcached", "postgresql-server"]
````

For example, this block would trip this rule:

````
package "httpd" do
  action :install
end
````
