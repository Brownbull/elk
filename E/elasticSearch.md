# ElasticSearch

***
## Install
```shell
# Ubuntu Server
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" |
sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
sudo apt-get update && sudo apt-get install elasticsearch

sudo nano /etc/elasticsearch/elasticsearch.yml
#Uncomment the node.name line (in vi, use the arrow keys to where you want to edit, then hit “i” to enter “insert mode” and make your edits.)
#Change network.host to 0.0.0.0, discovery.seed.hosts to [“127.0.0.1”], and cluster.initial_master_nodes to [“node-1”]
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable elasticsearch.service
sudo /bin/systemctl start elasticsearch.service
```


## Check
```shell
# ubuntu
service elasticsearch status
```

## Restart
```shell
sudo /etc/init.d/elasticsearch restart
service elasticsearch restart

```