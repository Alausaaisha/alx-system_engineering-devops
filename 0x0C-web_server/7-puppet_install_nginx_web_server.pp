# configure nginx with puppet

exec {'update':
  command  => 'sudo apt-get -y update',
  provider => 'shell'
}

package {'nginx':
  ensure   => 'installed'
}

file {'index.html':
  path    => '/var/www/html/index.html',
  owner   => 'root',
  content => 'Hello World!\n'
}

$redirect = "\\\trewrite ^/redirect_me https://github.com/Alausaaisha permanent;"

exec {'redirect':
  user     => 'root',
  command  => "sed -i '51i ${redirect}'  /etc/nginx/sites-available/default",
  provider => 'shell'
}

exec {'nginx_restart':
  user    => root,
  command => 'service nginx start',
  provider => 'shell'  
}
