ETSY006 - Execute resource used to run chef-provided command
==============================================

This rule detects when an "execute" block is using a shell command when Chef already provides a built in resource with equivalent functionality.

The list of commands to check for is defined at the top of rules.rb:

````
@corecommands = ["yum -y", "yum install", "yum reinstall", "yum remove", "mkdir", "useradd", "usermod", "touch"]
````

For example, this block would trip this rule:

````
execute "reinstall_pear" do
  command "yum -y reinstall php-pear"
end
````
