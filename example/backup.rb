require 'mikrotik-backup'

# Time format
time = Time.now.strftime("%d-%m-%Y")

#Config
# name - associate host name (and name backup file)
# host - host address
# user - user name
# password - user password
# path - local folder for save backup file. "/var/backup/"
# format - backup format binary or script
config = [
    {name:"Router1-#{time}", host: '10.10.10.1' , user:'admin' , password:'admin', path:'./', format:'binary'},
    {name:"Router2-#{time}", host: '10.10.10.2' , user:'admin' , password:'admin', path:'./', format:'script'},
    {name:"Router3-#{time}", host: '10.10.10.3' , user:'admin' , password:'admin', path:'./', format:'binary'},
    {name:"Router4-#{time}", host: '10.10.10.4' , user:'admin' , password:'admin', path:'./', format:'script'},
]


mtik_backup = MTik_backup.new(config)

# Logging
mtik_backup.logger(Logger::DEBUG) # remove this line if not used log, default output only Error
# Log out to file
#mtik_backup.logger(Logger::DEBUG,'backup.log')

# Start backup and download file to local machine
mtik_backup.backup_and_download

# Create backup and save to router memory, do not download file to local machine (return true)
#    mtik_backup.backup 
# Only download created file. (return true)
#    mtik_backup.download