server '3.92.20.142', user: 'ubuntu', roles: %w[web app db]
set :ssh_options, {
  forward_agent: true,
  auth_methods: %w[publickey],
  keys: %w[/home/nascenia/Downloads/test-delowar.pem]
}
