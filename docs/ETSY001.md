ETSY001 - Package or yum_package resource used with :upgrade action
==============================================
We've had several instances of new packages being put into our yum repository and rolled out to servers before we intended due to the use of the :upgrade action in "package" and "yum_package" resources. This rule will detect when :upgrade has been used instead of :install.

For example, this block would trip this rule:

````
package "sendmail" do
  action :upgrade
end
````
