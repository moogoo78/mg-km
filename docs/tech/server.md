# Server

## Nginx


### test config

```bash title="test config file"
nginx -t
```

```bash title="display all config, virtual hosts"
nginx -T
```

### url routing

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
