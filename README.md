# Legacy System Modernization Lab



## Project Overview



This project demonstrates the deployment of a legacy-style web application stack on AWS using Terraform.



The goal was to provision a cloud-based Ubuntu server and configure it to host WordPress using Apache, PHP, and MySQL. The project was completed as a hands-on infrastructure and cloud engineering exercise, with the infrastructure provisioned through Infrastructure as Code.



## Architecture



AWS EC2

- Ubuntu Linux

- Apache Web Server

- PHP

- MySQL

- WordPress



The infrastructure was provisioned using Terraform.



## Technologies Used



- AWS EC2

- Terraform

- Ubuntu Linux

- Apache

- PHP

- MySQL

- WordPress

- Git

- GitHub



## Implementation



The project followed these major steps:



1\. Provisioned an AWS EC2 instance using Terraform.

2\. Connected to the Ubuntu server using SSH.

3\. Updated the Ubuntu operating system.

4\. Installed Apache.

5\. Installed PHP and the required Apache PHP module.

6\. Installed MySQL.

7\. Started and enabled Apache and MySQL.

8\. Verified that both services were running.

9\. Secured the MySQL installation.

10\. Downloaded and installed WordPress.

11\. Configured the WordPress files for Apache.

12\. Created a dedicated MySQL database and user for WordPress.

13\. Configured `wp-config.php` with the database connection information.

14\. Restarted Apache.

15\. Removed the default Apache index page.

16\. Accessed the WordPress installation through the EC2 public IP.

17\. Completed the WordPress installation and verified access to the WordPress dashboard.



## Infrastructure as Code



Terraform was used to provision and manage the AWS infrastructure.



Using Terraform allowed the infrastructure to be created consistently from configuration rather than manually creating the EC2 resources through the AWS Console.



The infrastructure was destroyed with Terraform after the project was completed to avoid leaving unnecessary AWS resources running.



## Security Considerations



Sensitive infrastructure files were intentionally excluded from the repository.



The `.gitignore` file excludes:



- Terraform state files

- Terraform working directories

- Private key files

- Environment files



Terraform state files were not uploaded to GitHub.



## What I Learned



This project provided hands-on experience with:



- Infrastructure as Code using Terraform

- AWS EC2

- Linux server administration

- SSH access

- Apache web server configuration

- PHP application environments

- MySQL database administration

- WordPress deployment

- Git version control

- GitHub repository management



One of the most valuable lessons was understanding how multiple infrastructure and application components work together to deliver a functioning web application.



## Project Outcome



The final result was a successfully deployed WordPress application running on an AWS EC2 Ubuntu server.



The application was accessible through the EC2 public IP address, and the WordPress dashboard was successfully accessed after installation.



After verification, the AWS infrastructure was destroyed using Terraform.



## Future Improvements



Future versions of this project could explore:



- Configuration management with Ansible

- CI/CD automation

- Docker containerization

- HTTPS with TLS certificates

- AWS RDS instead of MySQL running directly on EC2

- AWS networking improvements

- Monitoring and logging

- Automated infrastructure testing

