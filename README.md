pg-backup-cookbook
==================

Postgres backups to S3


Add the following, in the appropriate spots, to nodes/xxx.json

    "backups": {
    	"bucket": "your bucket name here",
      "command": "/usr/local/rbenv/shims/backup perform --trigger db --config-file /etc/backup/config.rb --log-path=/var/log 2>&1 >> /var/log/backup-cron.log", # or whatever
      "mailto": "me@email.com",
      "hour": "*",
      "minute": "0,15,30,45"
     },

    "aws": {
      "access_key_id": your amazon access key here”,
      "secret_access_key": your amazon secret access key here”
    },

    "postgresql" : {
	    "database_name": your postgres database name here”
	   }

     "run_list": [
     	"role[pg-backup]"
     ]

roles/pg-backup.json

    {
       "name": "pg-backup",
       "description": "Postgres Backup",
       "json_class": "Chef::Role",
       "run_list": [
          "recipe[pg-backup]"
       ],
       "chef_type": "role"
    }


Test:
backup perform --trigger my_backup --config-file /etc/backup/config.rb