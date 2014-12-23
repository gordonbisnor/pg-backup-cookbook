include_recipe 'backup'

backup_model :db do
  description "Back up Postgres to S3"

  definition <<-DEF
    
    cron_options({
      path: '#{node['backups']['cron_path']}'
    })
    
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

  schedule({
    :minute => 0,
    :hour   => 0
  })
end
