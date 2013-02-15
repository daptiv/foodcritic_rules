ETSY003 - Execute resource used to run curl or wget commands
==============================================

This rule detects when wget or curl commands are run as bash commands inside of an "execute" block, rather than using the "remote_file" resource. We alert on this behaviour as running these commands inside "execute" blocks gives you much less visibility of the commands' output and status.

For example, this block would trip this rule:

````
execute "fetch_file" do
    command "wget -O /tmp/foo.tar.gz http://me.mycorp.com/files/foo.tar.gz"
    not_if "test -f /tmp/foo.tar.gz"
end

````
