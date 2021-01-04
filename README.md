# Cybersec-Repo
Repository including code written for U of T cybersecurity bootcamp, details of Microsoft Azure cloud deployment, and any other useful tools for cybersecurity.
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![TODO: Update the path with the name of your diagram](https://github.com/AndrewR613/Cybersec-Repo/blob/main/Diagrams/ELK.png)

These YAML scripts have been tested and used to generate a live ELK deployment on Azure. They can be used to recreate the entire deployment pictured above. Alternatively, select portions of the Ansible playbook files may be used to install only certain portions of the deployment, such as Filebeat.

(https://github.com/AndrewR613/Cybersec-Repo/tree/main/Ansible)

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will have a high degree of reliablility as well as redundancy. In addition, having the traffic flow through the load balancer restricts access to the network. Having the web servers behind the load balancer assists in protecting the availability of the web application in the event of a denial of service attack or technical failure. The jump box gives the advantage of limiting the attack surface of the network, acting as a bastion. All interaction with the machines OS must be done through the jump box. 


Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the log files (or any other files specified) and system resources.

The configuration details of each machine may be found below.

| Name     | Function               | Private IP Address | Public IP Address | Operating System |
|----------|------------------------|--------------------|-------------------|------------------|
| Jump Box | Gateway                | 10.0.0.4           | 52.188.162.69     | Ubuntu 18.04-LTS |
| Web-1    | DVWA Web Server        | 10.0.0.5           | 137.135.118.31    | Ubuntu 18.04-LTS |
| Web-2    | DVWA Web Server        | 10.0.0.6           | 137.135.118.31    | Ubuntu 18.04-LTS |
| Web-3    | DVWA Web Server        | 10.0.0.7           | 137.135.118.31    | Ubuntu 18.04-LTS |
| ELK-1    | Logging and Monitoring | 10.1.0.4           | 40.75.87.24       | Ubuntu 18.04-LTS |
### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- Andrew's Home IP

Machines within the network can only be accessed by SSH through the Jump Box at 10.0.0.4.

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses        | Published Ports |
|----------|---------------------|-----------------------------|-----------------|
| Jump Box | No                  | Andrew Home IP, 10.0.0.0/24 | TCP 22          |
| Web-1    | No                  | Andrew Home IP, 10.0.0.0/24 | TCP 80          |
| Web-2    | No                  | Andrew Home IP, 10.0.0.0/24 | TCP 80          |
| Web-3    | No                  | Andrew Home IP, 10.0.0.0/24 | TCP 80          |
| ELK-1    | No                  | Andrew Home IP, 10.0.0.0/24 | TCP 5601        |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because in the event that the ELK stack needs to be rebuilt, it is as simple as running the Ansible playbook. This also is advantageous in regards to scalability. Should the cloud environment require a second server to monitor the web servers, it can be easily accomplished by adding another machine to the hosts file and re-running the script. Hours of work may be reduced to mere minutes through the convenience of Ansible.

The playbook implements the following tasks:

- Installs docker
- Installs python3-pip and pip packages needed for docker
- Configures system to use maximum RAM, eliminating performance hiccups.
- Downloads and configures docker container for elk
- Enables persistence with docker and its containers in the event of system reboot.

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![TODO: Update the path with the name of your screenshot of docker ps output](https://github.com/AndrewR613/Cybersec-Repo/blob/main/Images/docker_screenshot.PNG)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1 10.0.0.5
- Web-2 10.0.0.6
- Web-3 10.0.0.7

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:

- Filebeat is used to collect log data from each machine. It then passes the log data to logstash and makes the data uniform so it can easily be parsed. For example, filebeat will monitor /var/log/auth.log and record any use of privilege escalation. Since only DVWA should be running using system users, privilege escalation may be an indicator that the machine has been compromised.

- Metricbeat is used to monitor system resources on each machine. For example, if CPU usage suddenly increases to 100% it may be an indicator that malware has been installed and is abusing system resources, or that there is an issue with the application.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the install-elk.yml file to /etc/ansible/roles
- Update the hosts file to include your targets. You must specify the IP address of the machine which will be configured to run the elk stack as one group and any webservers that will be installed with beats as a seperate group.
- Run the playbook, and navigate to http://<your ELK machine's ip>:5601/app/kibana#/home in your browser to check that the installation worked as expected.

The following screenshot is an example of what the Kibana dashboard looks like when navigated to through the browser.

![Kibana Screenshot](https://github.com/AndrewR613/Cybersec-Repo/blob/main/Images/kibana_screenshot.PNG)


