# Server

## Nginx


### config

```bash title="test config file"
nginx -t
```

```bash title="display all config, virtual hosts"
nginx -T
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
