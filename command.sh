ssh maria_dev@127.0.0.1 -p 2222
sudo kill -9 -l `sudo lsof -t -i:8080`


yum-config-manager --save --setopt=HDP-SOLR-2.6-100.skip_if_unavailable=true
yum install https://repo.ius.io/ius-release-el7.rpm https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install python-pip
pip install pathlib
pip install mrjob==0.7.4
pip install PyYAML==5.4.1
yum install nano
wget http://media.sundog-soft.com/hadoop/RatingsBreakdown.py
wget http://media.sundog-soft.com/hadoop/ml-100k/u.data
wget http://media.sundog-soft.com/hadoop/presto-hdp-config.tgz

python RatingsBreakdown.py u.data
python RatingsBreakdown.py -r hadoop --hadoop-streaming-jar /usr/hdp/current/hadoop-mapreduce-client/hadoop-streaming.jar u.data

./kafka-topics.sh --create --zookeeper sandbox-hdp.hortonworks.com:2181 --replication-factor 1 --partitions 1 --topic fred
./kafka-topics.sh --list --zookeeper sandbox-hdp.hortonworks.com:2181 
./kafka-console-producer.sh --broker-list sandbox-hdp.hortonworks.com:6667 --topic fred