ETSY005 - Action :restart sent to a core service
==============================================

This rule identifies when a recipe might send "action :restart" to a service we've identified as a "core" service. We've had instances in the past of chef changes causing hard restarts of services such as memcached or httpd, which can have unexpected side effects. For this reason, we alert if any restart notifications are sent to a defined list of "core" services. Restart notifications sent to any services not in this list will not cause this rule to trip.

The core services list is defined at the top of rules.rb:

````
@coreservices = ["httpd", "mysql", "memcached", "postgresql-server"]
````

For example, this block would trip this rule:
````
cookbook_file "/etc/httpd/conf.d/myvhost.conf" do
  source "myvhost.conf"
  mode 0644
  owner "root"
  group "root"
  notifies :restart, resources(:service => "httpd")
end
````

Wheras this block would not (as we're using reload instead of restart):

````
cookbook_file "/etc/httpd/conf.d/myvhost.conf" do
  source "myvhost.conf"
  mode 0644
  owner "root"
  group "root"
  notifies :reload, resources(:service => "httpd")
end
````

And neither would this one (as sendmail is not a core service):

````
template "/etc/mail/sendmail.mc" do
  source "sendmail.mc.erb"
  owner "root"
  group "root"
  mode 00644
  notifies :restart, resources(:service => "sendmail")
end
````
