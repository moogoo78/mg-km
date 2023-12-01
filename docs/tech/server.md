# Server

## AWS

## CLI

[aws — AWS CLI 2.13.29 Command Reference](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/index.html)

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
