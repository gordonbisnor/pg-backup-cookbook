include_recipe 'backup'

backup_model :db do
  description "Back up Postgres to S3"

  schedule({
    minute: node['backups']['minute'],
    hour: node['backups']['hour']
  })

  cron_options({
    mailto: node['backups']['mailto'],
    command: node['backups']['command']
  })

  definition <<-DEF
    split_into_chunks_of 4000

    database PostgreSQL do |db|
      db.name = '#{node['postgresql']['database_name']}'
      db.sudo_user = 'postgres'
    end

    compress_with Gzip

    store_with S3 do |s3|
      s3.access_key_id = '#{node['aws']['access_key_id']}'
      s3.secret_access_key = '#{node['aws']['secret_access_key']}'
      s3.bucket = '#{node['backups']['bucket']}'
    end
  DEF

end