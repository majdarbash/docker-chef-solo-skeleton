#
# Cookbook:: nginx
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.



package ['nginx'] do
  action :install
end

package ['php7.0-fpm'] do
  action :install
end

package ['php-imagick', 'php-curl', 'php-gd', 'php-mcrypt', 'php-xml', 'php-mbstring', 'php-soap', 'php-mysql', 'php-pear'] do
    action :install
end

package ['ntp', 'htop', 'vim'] do
    action :install
end

package ['redis-server'] do
    action :install
end



template '/etc/nginx/sites-enabled/default' do
  source 'default.conf'
end
