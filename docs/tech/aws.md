# AWS

[aws — AWS CLI 2.13.29 Command Reference](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/index.html)

## How-to

```bash title="list current profiles"
aws configure list-profiles
export AWS_PROFILE=xxx
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


```bash title="add metadata to all objects in bucket"
aws s3 cp --recursive --metadata-directive REPLACE --content-type "image/jpeg" s3://your-bucket-name/ s3://your-bucket-name/
```

```bash title="set all objects public-read"
aws s3 ls s3://my-bucket/path/to/ --recursive | cut -c 32- | awk '{cmd="aws s3api put-object-act --acl public-read --bucket mybucket --key "$0; system(cmd)}'
```

`cut -c 32-`把前32個字元刪除，取後面的key，然後用神奇的awk，搭配 `system`執行命令。
