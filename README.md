# Elk test environment
This is a test enviroment to try ELK architecture.
In this enviroment we have 3 server configured with vagrant + hyper-v.

* es01
  * Node of Elasticsearch (configured as Master, Client and Data Node)
* es02
  * Node of Elasticsearch (configured as Master, Client and Data Node)
* es03
  * Docker host with:
    * Logstash container
    * Elasticsearch-head container + nginx container
    * Kibana container + nginx container

The two nginx container as for use LDAP authentication.

### Software Used
* Docker
* Ansible 2.2
* Hyper-v 10.0.15063.0
* Vagrant 1.9.3
* Bash on windows
* An existant active directory

### Usage
Go in root folder and execute

> vagran up

Unfortunately ath the moment I am not able to assign private static IP with
hyper-v then you have to use a virtual switch bridged on a network with DHCP
and substitute IP in variables.yml after you have obtained them.

Now you can launch:

> ansible-playbooks -i hosts.ini elasticsearch.yml

Test if your node are up and running browsing:

> http://(es01_ip):9200/
> http://(es02_ip):9200/

and you interface management are up (only users belong to a specific group can access, see variable.yml):

> http://(es03_ip):9100/

now we can setup Kibana:

> ansible-playbooks -i hosts.ini kibana.yml

Test if kibana is are up and running browsing (please wait also ten minutes that kibana loading, it depend by resorces on your pc):

> http://(es03_ip)

Last but no least setup Logstash:

> ansible-playbooks -i hosts.ini logstash.yml

Lostash has been configured with the following input:
* gelp for docker (port 5001)
* log4j (port 5002)
* syslog (port 5000)

Verify that ports are opened:
>netstat -ano | grep 500

output:

>tcp6       0      0 :::5000                 :::*                    LISTEN      off (0.00/0/0)

>tcp6       0      0 :::5002                 :::*                    LISTEN      off (0.00/0/0)

>udp6       0      0 :::5001                 :::*                                off (0.00/0/0)
