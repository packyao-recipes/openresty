require 'json'

version = '1.9.3.2'

a = {}
a['name'] = 'openresty'
a['version'] = version
a['license'] = 'Nginx'
a['commands'] = [
  <<-EOF
  apt-get update
  apt-get -y install wget libreadline-dev libncurses5-dev libpcre3-dev libssl-dev perl make build-essential
  wget -O source https://openresty.org/download/ngx_openresty-#{version}.tar.gz
  tar xfz source
  cd ngx_openresty-#{version}
  ./configure
  make
  make install
  wget -O /etc/init.d/openresty https://gist.githubusercontent.com/vdel26/8805927/raw/249f907e465e98ac099437025218a15e55a34b4c/nginx
  chmod 755 /etc/init.d/openresty
  EOF
]
a['description'] = 'ngx_openresty is a full-fledged web application server by bundling the standard nginx core, lots of 3rd-party nginx modules, as well as most of their external dependencies.'
a['depends'] = []
a['cwd'] = ''
a['env'] = {}
a['outputs'] = %w(deb rpm)
a['package_files'] = {
  '/usr/local/openresty' => '/usr/local/openresty',
  '/etc/init.d/openresty' => '/etc/init.d/openresty'
}
a['build_distro'] = 'ubuntu'
a['build_distro_version'] = '14.04'

File.write('packyao.json', JSON.pretty_generate(a))
