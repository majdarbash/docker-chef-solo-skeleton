FROM ubuntu:16.04
RUN apt-get -y update
RUN apt-get -y install curl build-essential libxml2-dev libxslt-dev git
RUN curl -L https://www.opscode.com/chef/install.sh | bash
RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc
RUN /opt/chef/embedded/bin/gem install berkshelf

RUN apt-get -y update
RUN apt-get -y install python-software-properties
RUN apt-get -y update

ADD ./Berksfile /Berksfile
ADD ./solo.rb /var/chef/solo.rb
ADD ./solo.json /var/chef/solo.json
ADD ./cookbooks /var/chef/cookbooks

RUN cd / && /opt/chef/embedded/bin/berks vendor /var/chef/cookbooks
RUN chef-solo -c /var/chef/solo.rb -j /var/chef/solo.json

CMD service php7.0-fpm start && nginx -g "daemon off;"
