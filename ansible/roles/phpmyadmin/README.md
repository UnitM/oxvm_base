PHPMYADMIN
================

##Instructions
If you want to use phpmyadmin on your vagrant box, you need to setup a hostname for your application.
You also need to choose a hostname for your phpmyadmin installation in that vagrant box.
And you need to add that both those hostname in your hosts file (/etc/hosts).

You now only need to add those variable into your playbook.yml or
into a specific vars file depending on your liking.

```yaml
phpmyadmin:
  -
    user: mysql user
    pass: mysql password
    hostname: phpmyadmin hostname
    pma_dbname: phpmyadmin database name
```

Enjoy
