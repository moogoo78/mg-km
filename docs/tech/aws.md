# AWS

[aws — AWS CLI 2.13.29 Command Reference](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/index.html)

## How-to

```bash title="list current profiles"
aws configure list-profiles
```

[Retrieve instance metadata - Amazon Elastic Compute Cloud](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instancedata-data-retrieval.html)

```text
http://169.254.169.254/latest/meta-data/
```



### S3

```bash title="s3 sync"
aws s3 sync --profile <some-profile> <source_path> <target_path>
```

```bash title="count object numbers and size"
aws s3 ls s3://my-bucket/path/to --recursive --human-readable --summarize
```

最後會列出Total Objects, 跟Total Size


