#
# Cookbook:: nginx
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.


%w[
    /usr/local/scripts
    /usr/local/scripts/files
].each do |path|
    directory path do
        action :create
    end
end

bash 'apt-update' do
    code <<-EOH
        apt update

        touch /usr/local/scripts/files/apt-update-done
    EOH
    creates '/usr/local/scripts/files/apt-update-done'
end

package ['nginx'] do
  action :install
end

package ['php7.0-fpm'] do
  action :install
end

package ['php-imagick', 'php-curl', 'php-gd', 'php-mcrypt', 'php-xml', 'php-mbstring', 'php-soap', 'php-mysql', 'php-pear'] do
    action :install
end

template '/etc/php/7.0/fpm/php.ini' do
  source 'php.ini'
end

template '/etc/php/7.0/cli/php.ini' do
  source 'php.ini'
end


package ['ntp', 'htop', 'vim', 'wget', 'mutt', 'npm', 'zip'] do
    action :install
end

package ['redis-server'] do
    action :install
end

template '/etc/nginx/sites-enabled/default' do
  source 'default.conf'
end

bash 'other-configurations' do
    code <<-EOH
        echo "Installing node modules ..."
        ln /usr/bin/nodejs /usr/bin/node -s
        npm -g install grunt --unsafe-perm
        npm install -g bower
        npm install -g phantomjs-prebuilt --unsafe-perm

        echo "Installing Composer ..."
        cd /tmp
        php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
        php ./composer-setup.php --install-dir=/bin --filename=composer

        touch /usr/local/scripts/files/other-configurations-done
    EOH
    creates '/usr/local/scripts/files/other-configurations-done'
end
