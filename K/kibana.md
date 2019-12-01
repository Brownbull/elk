# Kibana
Web UI that puts in tops on Elastic to create dashboards and visualizations.
![whatitis](images/whatr.png)
- [Kibana](#kibana)
  - [Install](#install)
    - [Ubuntu Server](#ubuntu-server)
***
## Install
### Ubuntu Server
```shell
sudo apt-get install Kibana
sudo nano /etc/Kibana/Kibana.yml
# change server.host to 0.0.0.0
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable Kibana.service
sudo /bin/systemctl start Kibana.service
# Kibana is now available on port 5601
```