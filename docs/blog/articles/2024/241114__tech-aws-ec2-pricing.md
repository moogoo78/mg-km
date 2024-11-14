---
date: 2024-11-14
categories:
  - Tech
tags:
  - aws
  - pricing
---

# AWS EC2 計價

## 大分類

- On-Demand: 用多少算多少
- Savings Plans: 先講用多少、用多久，會比較便宜，改type比較彈性
- Reserved Instances: 先講用多少、用多久，會比較便宜，但要用1~3年
- Spot Instances: 競價，價格是浮動的，出價太低instance會被砍掉
- Dedicated: 專屬

我還沒有plan，考慮on-demand

## EC2 Instance Type Pricing

pricing: hourly (monthly) USD

| type | Mem | vCPU | T2 | T3a | T3 | T4g |
|---|---|---|---|---|---|---|
| `tokyo` | | | | | | |
| nano | 0.5 | 1 | 0.0076 (5.472) | 0.0061 | 0.0068 | 0.0054 |
| micro | 1 | 1 | 0.0152 (15.5) | 0.0122 | 0.0136 | 0.0108 |
| small | 2 | 1 | 0.0304 (31.008) | 0.0245 (24.99) | 0.0272 (27.744) | 0.0216 (22.032) | 
| medium | 4 | 2 | 0.0608 (62.106) | 0.049 (49.98) | 0.0544 (55.488) | 0.0432 (44.064) |
| large | 8 | 2 | 0.1216 (124.032) | 0.0979 | 0.1088 | 0.0864 |
| xlarge | 16 | 4 | 0.2432 (248.064) | 0.1958 | 0.2176 | 0.01728 |
| 2xlarge | 32 | 8 | 0.4864 | 0.3917 | 0.4352 | 0\.3456 |
| `oregon` | | | | | | |
| nano | 0.5 | 1 | |
| micro | 1 | 1 |  |
| small | 2 | 1 |  | | | 0.0168 (17.136)|
| medium | 4 | 2 | |
| large | 8 | 2 | |
| xlarge | 16 | 4 | |
| 2xlarge | 32 | 8 | |

via: <https://aws.amazon.com/ec2/pricing/on-demand/>

## Diff Type

T2: Intel CPU

- Up to 3.3 GHz Intel Xeon Scalable processor (Haswell E5-2676 v3 or Broadwell E5-2686 v4)

T3a: AMD CPU, 比T3省10%

- AMD EPYC 7000 series processors (AMD EPYC 7571) with an all core turbo clock speed of 2.5 GHz

T3: Inter CPU

- Up to 3.1 GHz Intel Xeon Scalable processor (Skylake 8175M or Cascade Lake 8259CL)

T4g: Arm-based, 最便宜, 某些情況會更快? (大部分時間，都不全速使用CPU的應用程式設計?)

- custom built AWS Graviton2 processors


## Diff Regions
[Which AWS Region Is Cheapest? A Costing Report](https://openupthecloud.com/which-aws-region-cheapest/)

- <https://docs.google.com/spreadsheets/d/e/2PACX-1vR0gBoKn8BmtP1zVXvjZb1w6KmLE8YNd7W-6nXkQ_3EzKmPu9PMT6U8XuJ72Gr-ZW-UlLRl0yLFRI4_/pubhtml>

## Diff Latency Test

- [AWS Latency Test](https://awsspeedtest.com/latency)

## Speed Test

- <https://speedtest.globalaccelerator.aws/#/>

## 結論

便宜程度: N.Virginia (us-east-1), Ohio (us-east-2), Oregon (us-west-2)

Latency: Tokyo, Singapore, California, Oregon, Ohio, N.Virginia




 


