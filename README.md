pg-backup-cookbook
==================

Postgres backups to S3


Add the following, in the appropriate spots, to nodes/xxx.json

    "backups": {
    	"bucket": "your bucket name here",
      "cron_path": "your echo $PATH here"
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