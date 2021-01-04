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
- _TODO: What aspect of security do load balancers protect? What is the advantage of a jump box?_

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the _____ and system _____.
- _TODO: What does Filebeat watch for?_
- _TODO: What does Metricbeat record?_

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

Only the _____ machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- _TODO: Add whitelisted IP addresses_

Machines within the network can only be accessed by _____.
- _TODO: Which machine did you allow to access your ELK VM? What was its IP address?_

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes/No              | 10.0.0.1 10.0.0.2    |
|          |                     |                      |
|          |                     |                      |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because in the event that the ELK stack needs to be rebuilt, it is as simple as running the Ansible playbook. This also is advantageous in regards to scalability. Should the cloud environment require a second server to monitor the web servers, it can be easily accomplished by adding another machine to the hosts file and re-running the script. Hours of work may be reduced to mere minutes through the convenience of Ansible.
- _TODO: What is the main advantage of automating configuration with Ansible?_

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
- _TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the install-elk.yml file to /etc/ansible/roles
- Update the hosts file to include your targets. You must specify the IP address of the machine which will be configured to run the elk stack as one group and any webservers that will be installed with beats as a seperate group.
- Run the playbook, and navigate to http://<your ELK machine's ip>:5601/app/kibana#/home to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
- _Which URL do you navigate to in order to check that the ELK server is running?

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
