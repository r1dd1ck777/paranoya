set :password, ENV['PASSWORD'] || ask('Server password', nil)
server '91.210.190.69', user: 'deployer', roles: %w{app db web}, password: fetch(:password)
