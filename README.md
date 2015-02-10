[![Gem Version](https://badge.fury.io/rb/mikrotik-backup.svg)](http://badge.fury.io/rb/mikrotik-backup)

# Mikrotik Backup

Backup MikroTik configuration using SSH and SFTP.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mikrotik-backup'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mikrotik-backup

## Usage

```ruby

require 'mikrotik-backup'
#Config
# name - associate host name (and name backup file)
# host - host address
# user - user name
# password - user password
# path - local folder for save backup file. "/var/backup/"
config = [
    {name:'Router1', host: '10.10.10.1' , user:'admin' , password:'admin', path:'./'},
    {name:'Router2', host: '10.10.10.2' ,user:'admin' ,password:'admin', path: './'}
]


backup = MTik_backup.new(config)
# Logging
backup.logger(Logger::ERROR)
# Start backup and download
backup.backup(true) # <-- "false" - enable only create backup and not download
```
### Logging
```ruby
# Logging only Error, out to console
logger

# Full log out to console
logger(Logger::DEBUG)

# Full log out to file 
logger(Logger::DEBUG,'backup.log')
```

### Only Download backup (previously created)
```ruby
config = [
    {name:'Router1', host: '10.10.10.1' , user:'admin' , password:'admin', path:'./'},
    {name:'Router2', host: '10.10.10.2' ,user:'admin' ,password:'admin', path: './'}
]

backup = MTik_backup.new(config)
backup.download
```

## Contributing

1. Fork it ( https://github.com/POStroi/ruby_mikrotik_backup/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
