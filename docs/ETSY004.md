ETSY004 - Execute resource defined without conditional or action :nothing
==============================================

This rule detects when an "execute" block is defined without specifying a conditional (ie not_if or only_if) or action :nothing. This is to avoid the presence of resources which run on every chef run, whether they need to or not. Please note, this rule does not identify "execute" blocks which are themselves wrapped in a conditional, ie an if statement. For this reason, we recommend that you also use the built in foodcritic rule FC023, which detects this case. Rule FC023 recommends that you always use conditionals inside your resources instead of wrapping them, and we'd concur with this.

For example, this block would trip this rule:

````
execute "fetch_file" do
    command "wget -O /tmp/foo.tar.gz http://me.mycorp.com/files/foo.tar.gz"
end
````

As would this block, even though there is technically a conditional wrapping the resource.

````
if !File.exists?("/tmp/foo.tar.gz")
    execute "fetch_file" do
        command "wget -O /tmp/foo.tar.gz http://me.mycorp.com/files/foo.tar.gz"
    end
end
````
However, the above block would subsequently be flagged by rule FC023.
