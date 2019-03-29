# tf-mod-elasticbeanstalk-env

This module can be used to provision a SingleInstance AWS Elastic Beanstalk environment.

Initial hopes were to allow for different types of Elastic Beanstalk environments. This turned out to be more time consuming for our limited usage of Elastic Beanstalk.

If this module is used for more applications, it should be modified or a separate module should be created for load balanced setups.

Additional resources for load balanced environments:

[Cloud Posse's Elastic Beanstalk Module](https://github.com/cloudposse/terraform-aws-elastic-beanstalk-environment)

[BasileTrujilo Elastic Beanstalk Module](https://github.com/BasileTrujillo/terraform-elastic-beanstalk-php)

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| alb\_zone\_id | ALB zone id | map | `<map>` | no |
| allow\_url\_fopen | Specifies if PHP's file functions are allowed to retrieve data from remote locations, such as websites or FTP servers. | string | `"On"` | no |
| app | EBS application name | string | n/a | yes |
| application\_port | Port application is listening on | string | `"80"` | no |
| associate\_public\_ip\_address | Specifies whether to launch instances in your VPC with public IP addresses. | string | `"false"` | no |
| autoscale\_lower\_bound | Minimum level of autoscale metric to remove an instance | string | `"20"` | no |
| autoscale\_lower\_increment | How many Amazon EC2 instances to remove when performing a scaling activity. | string | `"-1"` | no |
| autoscale\_max | Maximum instances in charge | string | `"3"` | no |
| autoscale\_measure\_name | Metric used for your Auto Scaling trigger | string | `"CPUUtilization"` | no |
| autoscale\_min | Minumum instances in charge | string | `"2"` | no |
| autoscale\_statistic | Statistic the trigger should use, such as Average | string | `"Average"` | no |
| autoscale\_unit | Unit for the trigger measurement, such as Bytes | string | `"Percent"` | no |
| autoscale\_upper\_bound | Maximum level of autoscale metric to add an instance | string | `"80"` | no |
| autoscale\_upper\_increment | How many Amazon EC2 instances to add when performing a scaling activity | string | `"1"` | no |
| availability\_zones | Choose the number of AZs for your instances | string | `"Any 2"` | no |
| composer\_options | Sets custom options to use when installing dependencies using Composer through composer.phar install. | string | `""` | no |
| config\_document | A JSON document describing the environment and instance metrics to publish to CloudWatch. | string | `"{ \"CloudWatchMetrics\": {}, \"Version\": 1}"` | no |
| config\_source | S3 source for config | string | `""` | no |
| description | Short description of the Environment | string | `""` | no |
| display\_errors | Specifies if error messages should be part of the output. | string | `"Off"` | no |
| document\_root | Specify the child directory of your project that is treated as the public-facing web root. | string | `"/"` | no |
| enable\_log\_publication\_control | Copy the log files for your application's Amazon EC2 instances to the Amazon S3 bucket associated with your application. | string | `"false"` | no |
| enable\_managed\_actions | Enable managed platform updates. When you set this to true, you must also specify a `PreferredStartTime` and `UpdateLevel` | string | `"true"` | no |
| enable\_stream\_logs | Whether to create groups in CloudWatch Logs for proxy and deployment logs, and stream logs from each instance in your environment. | string | `"false"` | no |
| enhanced\_reporting\_enabled | Whether to enable "enhanced" health reporting for this environment.  If false, "basic" reporting is used.  When you set this to false, you must also set `enable_managed_actions` to false | string | `"true"` | no |
| env\_default\_key | Default ENV variable key for Elastic Beanstalk `aws:elasticbeanstalk:application:environment` setting | string | `"DEFAULT_ENV_%d"` | no |
| env\_default\_value | Default ENV variable value for Elastic Beanstalk `aws:elasticbeanstalk:application:environment` setting | string | `"UNSET"` | no |
| env\_vars | Map of custom ENV variables to be provided to the Jenkins application running on Elastic Beanstalk, e.g. `env_vars = { JENKINS_USER = 'admin' JENKINS_PASS = 'xxxxxx' }` | map | `<map>` | no |
| environment\_type | Environment type, e.g. 'LoadBalanced' or 'SingleInstance'.  If setting to 'SingleInstance', `rolling_update_type` must be set to 'Time', `updating_min_in_service` must be set to 0, and `public_subnets` will be unused (it applies to the ELB, which does not exist in SingleInstance environments) | string | `"LoadBalanced"` | no |
| health\_streaming\_delete\_on\_terminate | Whether to delete the log group when the environment is terminated. If false, the health data is kept RetentionInDays days. | string | `"false"` | no |
| health\_streaming\_enabled | For environments with enhanced health reporting enabled, whether to create a group in CloudWatch Logs for environment health and archive Elastic Beanstalk environment health data. For information about enabling enhanced health, see aws:elasticbeanstalk:healthreporting:system. | string | `"false"` | no |
| health\_streaming\_retention\_in\_days | The number of days to keep the archived health data before it expires. | string | `"7"` | no |
| healthcheck\_url | Application Health Check URL. Elastic Beanstalk will call this URL to check the health of the application running on EC2 instances | string | `"/healthcheck"` | no |
| http\_listener\_enabled | Enable port 80 (http) | string | `"false"` | no |
| instance\_refresh\_enabled | Enable weekly instance replacement. | string | `"true"` | no |
| instance\_subnets | List of subnets to place instances on | list | n/a | yes |
| instance\_type | Instances type | string | `"t3.micro"` | no |
| keypair | Name of SSH key that will be deployed on Elastic Beanstalk and DataPipeline instance. The key should be present in AWS | string | n/a | yes |
| logs\_delete\_on\_terminate | Whether to delete the log groups when the environment is terminated. If false, the logs are kept RetentionInDays days. | string | `"false"` | no |
| logs\_retention\_in\_days | The number of days to keep log events before they expire. | string | `"7"` | no |
| max\_execution\_time | Sets the maximum time, in seconds, a script is allowed to run before it is terminated by the environment. | string | `"60"` | no |
| memory\_limit | Amount of memory allocated to the PHP environment. | string | `"256M"` | no |
| name | Solution name, e.g. 'app' or 'jenkins' | string | `"app"` | no |
| notification\_endpoint | Notification endpoint | string | `""` | no |
| notification\_protocol | Notification protocol | string | `"email"` | no |
| notification\_topic\_arn | Notification topic arn | string | `""` | no |
| notification\_topic\_name | Notification topic name | string | `""` | no |
| preferred\_start\_time | Configure a maintenance window for managed actions in UTC | string | `"Sun:10:00"` | no |
| rolling\_update\_type | Set it to Immutable to apply the configuration change to a fresh group of instances | string | `"Health"` | no |
| root\_volume\_size | The size of the EBS root volume | string | `"8"` | no |
| root\_volume\_type | The type of the EBS root volume | string | `"gp2"` | no |
| security\_groups | List of security groups to be allowed to connect to the EC2 instances | list | `<list>` | no |
| solution\_stack\_name | Elastic Beanstalk stack, e.g. Docker, Go, Node, Java, IIS. [Read more](http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/concepts.platforms.html) | string | `""` | no |
| ssh\_listener\_enabled | Enable ssh port | string | `"false"` | no |
| ssh\_listener\_port | SSH port | string | `"22"` | no |
| ssh\_source\_restriction | Used to lock down SSH access to the EC2 instances. | string | `"0.0.0.0/0"` | no |
| tags | Additional tags (e.g. `map('BusinessUnit`,`XYZ`) | map | `<map>` | no |
| tier | Elastic Beanstalk Environment tier, e.g. ('WebServer', 'Worker') | string | `"WebServer"` | no |
| update\_level | The highest level of update to apply with managed platform updates | string | `"minor"` | no |
| updating\_max\_batch | Maximum count of instances up during update | string | `"1"` | no |
| updating\_min\_in\_service | Minimum count of instances up during update | string | `"1"` | no |
| version\_label | Elastic Beanstalk Application version to deploy | string | `""` | no |
| vpc\_id | ID of the VPC in which to provision the AWS resources | string | n/a | yes |
| wait\_for\_ready\_timeout | The maximum duration that Terraform should wait for an Elastic Beanstalk Environment to be in a ready state before timing out. | string | `"20m"` | no |
| zlib\_php\_compression | Specifies whether or not PHP should use compression for output. | string | `"Off"` | no |
| zone\_id | Route53 parent zone ID. The module will create sub-domain DNS records in the parent zone for the EB environment | string | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| all\_settings | List of all option settings configured in the environment. These are a combination of default settings and their overrides from setting in the configuration. |
| application | The Elastic Beanstalk Application specified for this environment. |
| autoscaling\_groups | The autoscaling groups used by this environment. |
| cname | Fully qualified DNS name for the environment. |
| ec2\_instance\_profile\_role\_name | Instance IAM role name |
| elb\_dns\_name | ELB technical host |
| elb\_load\_balancers | Elastic Load Balancers in use by this environment. |
| elb\_zone\_id | ELB zone id |
| host | DNS hostname |
| id | ID of the Elastic Beanstalk environment. |
| instances | Instances used by this environment. |
| launch\_configurations | Launch configurations in use by this environment. |
| load\_balancers | Elastic Load Balancers in use by this environment. |
| name | Name |
| queues | SQS queues in use by this environment. |
| security\_group\_id | Security group id |
| setting | Settings specifically set for this environment. |
| tier | The environment tier specified. |
| triggers | Autoscaling triggers in use by this environment. |
