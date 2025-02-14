# Server

## Cronjobs

- [CronMaker](http://www.cronmaker.com/)

## Nginx


### Config

Test config file

```bash
nginx -t
```

Display all config, virtual hosts

```bash
nginx -T
```

Basic Authentication
```text
server {
    ...
    auth_basic           "Administrator’s Area";
    auth_basic_user_file conf/htpasswd;

    location /public/ {
        auth_basic off;
    }
}
```

#### URL routing

```text title="multiple path same config"
location ~ ^/(path1/foo|path2/bar)/ {
  ...
}
```

`~`表示要用regex

```text title="for frontend app routing"
    location / {
        root /frontend;
        try_files $uri /index.html;
    }
```



### Common Issues

413 Request Entity Too Large

```
client_max_body_size 8M;
```

## Apache2

### config

```bash
apache2ctl -S
```

### rewrite & redirect

```text
RewriteEngine on

RedirectMatch "home.php" "http://my-new-site.com"
RedirectMatch "AjaxTree/some.php" "https://my-new-site.com/tree"
RewriteCond %{QUERY_STRING} name_code=([^&]+)
RewriteRule ^/some_detail\.php$ https://my-new-site.com?namecode=%1 [R=302,L]
RewriteCond %{QUERY_STRING} T2=([^&]+)
RewriteRule ^/path/to/\.php$ https://my-new-site.com/path/to?keyword=%1 [NE,R=302, L]

# others all redirect to domain's root path
RewriteRule ^(.*) https://my-new-site.com [L,QSA]
```
`NE` 防止apache自動加上特殊字元的處理，例如原本query string有"foo%20bar"，沒加`NE`轉過去就會變成"foo%2520bar" (https://stackoverflow.com/a/41355819/644070)
