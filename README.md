## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![](https://github.com/ambitionz722/Project1-Elk-Stack-Project/blob/main/Diagrams/network_diagram__1_.jpg)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the _____ file may be used to install only certain pieces of it, such as Filebeat.

  - [DVWA Webserver Playbook](https://github.com/ambitionz722/Project1-Elk-Stack-Project/blob/main/Ansible/DVWA-playbook.yml.txt)
  - [ELK Playbook](https://github.com/ambitionz722/Project1-Elk-Stack-Project/blob/main/Ansible/DVWA-playbook.yml.txt)
  - [Filebeat Playbook](https://github.com/ambitionz722/Project1-Elk-Stack-Project/blob/main/Ansible/filebeat-playbook.yml.txt)
  - [Metricbeat Playbook](https://github.com/ambitionz722/Project1-Elk-Stack-Project/blob/main/Ansible/metricbeat-playbook.yml.txt)

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.

Load Balancers are put into place to help protect systems from DDoS attacks
A Jump-Box that all admins have to connect to previous to launching any administrative task. All tools are maintained on a centralized server making it easy to diagnose any issues on a network. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the log files and system metrics.

Filebeat is a system that is installed on your data servers to centralize and forward log data.

Metricbeat is a system that is installed onto target servers to collect metric data periodically.


The configuration details of each machine may be found below.


| Name                 | Function           | Public IP Address | Private IP Address | OS           |
|----------------------|--------------------|-------------------|--------------------|--------------|
| Jump Box Provisioner | Gateway            | 13.72.64.145      | 10.0.1.4           | Ubuntu 18.04 |
| Web1                 | Application Server | 168.62.162.99     | 10.0.1.6           | Ubuntu 18.04 |
| Web2                 | Application Server | 168.62.162.99     | 10.0.1.7           | Ubuntu 18.04 |
| ELK-VM               | ELK Stack Server   | 23.99.66.214      | 10.1.0.4           | Ubuntu 18.04 |



Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump-Box-Provisioner and ELK Stack (Kibana) machines can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:

My Home IP Address: 24.192.74.174

Machines within the network can only be accessed by the Jump-Box-Provisioner.

The only machine that was allowed access to the ELK-VM was my Jump-Box-Provisioner machine. The machine’s IP address is 13.72.64.145.


A summary of the access policies in place can be found in the table below.

| Name                 | Publicly Accessible | Allowed IP Addesses |
|----------------------|---------------------|---------------------|
| Jump Box Provisioner | Yes                 | My Home IP Address  |
| Elk Stack            | Yes                 | My Home IP Address  |
| Web1                 | No                  | 10.0.0.4            |
| Web2                 | No                  | 10.0.0.4            |

Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because it allows a consistent and predictable configuration.  In addition to the consistency of everything, when you get the setup automated the ELK stack can be created and configured very quickly.

- The playbook implements the following tasks:
- Configure the mapped memory with the sysctl module
- Install docker.io and python3-pip packages with apt module
- Install docker python package using pip
- Enable systemd docker service
- Run the ELK docker container

The following screenshot displays the result of running of the docker ps command after successfully configuring the ELK instance.

![](https://github.com/ambitionz722/Project1-Elk-Stack-Project/blob/main/Diagrams/o.png)

Target Machines & Beats
This ELK server is configured to monitor the following machines:

  - Web-1: 10.0.1.6
  - Web-2: 10.0.1.7

We have installed the following Beats on these machines:

  - Filebeat
  - Metricbeat

These Beats allow us to collect the following information from each machine:

  - Filebeat - parses and forwards system logs from the Web VMs to the ELK stack VM in a format that’s easily readable.
  - Metricbeat - reports system and service statistics from the Web VMs to the ELK stack VM.


Using the Playbook
                                                          
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the ELK-playbook.yml file to /etc/ansible directory inside of the ansible container.

- Update the /etc/ansible/hosts file to include the ELK stack VM IP address.
      - Append the ansible_python_interpreter=/usr/bin/python3 to ensure that the correct version of python is being used
 
Example configuration of /etc/ansible/hosts:

![](https://github.com/ambitionz722/Project1-Elk-Stack-Project/blob/main/Diagrams/docker.png)

- Run the playbook, and navigate to http://http://23.99.66.214:5601/app/kibana#/home to check that the installation worked as expected.
      - The command to execute your playbook is: ansible-playbook /etc/ansible/ELK-playbook.yml

![](https://github.com/ambitionz722/Project1-Elk-Stack-Project/blob/main/Diagrams/kibana.png)


