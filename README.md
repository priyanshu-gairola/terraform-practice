# Terraform AWS Environment Practice

A Terraform practice project for provisioning AWS infrastructure using
**Terraform Workspaces**, **environment-based resource naming/tagging**,
and **remote state management with Amazon S3 and DynamoDB**.

The project demonstrates how the same Terraform configuration can be
used to manage isolated `dev`, `staging`, and `prod` environments.

This repo was solely used for learning purpose and at the same time how configurations are made in real prod environment .

---

## Architecture

```text
                         Git Repository
                              |
                 +------------+------------+
                 |                         |
              main branch              dev/staging
                 |                         |
                 |                  Terraform configuration
                 |                         |
                 +------------+------------+
                              |
                       Terraform Workspace
                              |
          +-------------------+-------------------+
          |                   |                   |
         dev               staging              prod
          |                   |                   |
          v                   v                   v
     +---------+         +---------+         +---------+
     |   VPC   |         |   VPC   |         |   VPC   |
     +----+----+         +----+----+         +----+----+
          |                   |                   |
          v                   v                   v
     +---------+         +---------+         +---------+
     |   SG    |         |   SG    |         |   SG    |
     |   dev   |         | staging |         |  prod   |
     +----+----+         +----+----+         +----+----+
          |                   |                   |
          v                   v                   v
     +---------+         +---------+         +---------+
     |   EC2   |         |   EC2   |         |   EC2   |
     |   dev   |         | staging |         |  prod   |
     +---------+         +---------+         +---------+
          |                   |                   |
       dev-key            staging-key          prod-key


                    Remote Terraform State
                              |
                     +--------+--------+
                     |                 |
                  Amazon S3        DynamoDB
                     |                 |
             terraform.tfstate     State Locking
                     |
        +------------+-------------+
        |            |             |
     env:/dev   env:/staging   env:/prod
