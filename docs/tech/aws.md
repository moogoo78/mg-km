# AWS

[aws — AWS CLI 2.13.29 Command Reference](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/index.html)

## Recipe


```bash title="count object numbers and size"
aws s3 ls s3://my-bucket/path/to --recursive --human-readable --summarize
```

最後會列出Total Objects, 跟Total Size
