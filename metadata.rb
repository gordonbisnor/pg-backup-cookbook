name             'pg-backup'
source_url       'https://github.com/gordonbisnor/pg-backup-cookbook' if respond_to?(:source_url)
issues_url       'https://github.com/gordonbisnor/pg-backup-cookbook/issues' if respond_to?(:issues_url)
maintainer       'Gordon B. Isnor'
maintainer_email 'gordonbisnor@gmail.com'
license          'none'
description      'Postgres database backups to S3'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.7'

recipe "pg-backup", "Postgres backups"

depends 'backup',  '>= 0.0.0'
depends 'postfix', '>= 0.0.0'

supports 'ubuntu'
