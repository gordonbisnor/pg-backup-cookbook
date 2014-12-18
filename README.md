pg-backup-cookbook
==================

Postgres backups to S3

Add the following, in the appropriate spots, to nodes/xxx.json

    "backups": {
    	"bucket": "cloud-library-backups"
     },

    "aws": {
      "access_key_id": “xxx”,
      "secret_access_key": “yyy”
    },

    "postgresql" : {
	    "database_name": “zzz”
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