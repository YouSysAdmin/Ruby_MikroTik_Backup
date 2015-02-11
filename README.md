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

### Backup only
```ruby

require 'mikrotik-backup'

#Time format
time = Time.now.strftime("%d-%m-%Y")

#Config
# name - associate host name (and name backup file)
# host - host address
# user - user name
# password - user password
# path - local folder for save backup file. "/var/backup/"
# format - backup file format, 'binary' or 'script'
config = [
    {name:"Router1-#{time}", host: '10.10.10.1', user:'admin', password:'admin', path:'./', format:'binary'},
    {name:"Router2-#{time}", host: '10.10.10.2', user:'admin', password:'admin', path:'./', format:'script'}
]


backup = MTik_backup.new(config)
# Start backup
backup.backup
```

### Only Download backup (previously created)
```ruby
backup.download
```

### Create backup and download
```ruby
backup.backup_and_download
```

### Logging
```ruby
# Logging only Error, out to console
backup.logger(Logger::ERROR) #<- Default

# Full log out to console
backup.logger(Logger::DEBUG)

# Full log out to file
backup.logger(Logger::DEBUG,'backup.log')
```
### Work log (Logger::DEBUG)
```
[2015-02-11 13:01:32] INFO: SSH connect to host 192.168.1.1
[2015-02-11 13:01:36] INFO: Backup MikroTik configuration
[2015-02-11 13:01:37] INFO: SFTP connect to host 192.168.1.1
[2015-02-11 13:01:38] INFO: Download file Router1-11-02-2015.backup to ./Router1-11-02-2015.backup
[2015-02-11 13:01:38] INFO: SSH connect to host 176.xxx.xxx.28
[2015-02-11 13:01:38] INFO: Backup MikroTik configuration
[2015-02-11 13:01:39] INFO: SFTP connect to host 176.xxx.xxx.28
[2015-02-11 13:01:39] INFO: Download file Router2-11-02-2015.backup to ./Router2-11-02-2015.backup
[2015-02-11 13:01:39] INFO: SSH connect to host 188.xxx.xxx.56
[2015-02-11 13:01:40] INFO: Backup MikroTik configuration
[2015-02-11 13:01:41] INFO: SFTP connect to host 188.xxx.xxx.56
[2015-02-11 13:01:41] INFO: Download file Router3-11-02-2015.backup to ./Router3-11-02-2015.backup
[2015-02-11 13:01:41] INFO: SSH connect to host 188.xxx.xxx.74
[2015-02-11 13:01:42] INFO: Backup MikroTik configuration
[2015-02-11 13:01:42] INFO: SFTP connect to host 188.xxx.xxx.74
[2015-02-11 13:01:43] INFO: Download file Router4-11-02-2015.backup to ./Router4-11-02-2015.backup
```

## Problem

```
ERROR: Creation of file mapping failed with error: 998
```
**Close Pageant PuTTY**

## Contributing

1. Fork it ( https://github.com/POStroi/ruby_mikrotik_backup/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
