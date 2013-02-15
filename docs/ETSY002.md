ETSY002 - Execute resource used to run git commands
==============================================
This rule detects when Git commands are run as bash commands inside of an "execute" block, rather than using the "git" resource. We alert on this behaviour as running these commands inside "execute" blocks gives you much less visibility of the commands' output and status.

For example, this block would trip this rule:

````
execute "checkout" do
  command "git clone git://github.com/foo/bar.git"
  cwd "/home/me"
end
````
