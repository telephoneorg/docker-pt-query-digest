# pt-query-digest dockerized
# by joe black

# To Build:
#
# 1. Clone Repo
# 2. run docker build -t pt-query-digest .
# 
# To Use:
# 
# Analyze mysql log:
#   docker run -it pt-query-digest LOGFILE
#
# Analyze tcpdump:
#   docker run -it pt-query-digest --type tcpdump TCPDUMPFILE
#
# Reccomended tcpdump invocation:
#   tcpdump -s 65535 -x -nn -q -tttt -i any -c 1000 port 3306 > mysql.tcp.txt

FROM centos:7

MAINTAINER joe <joe@unorthodox.io>

RUN yum install -y http://www.percona.com/downloads/percona-release/redhat/0.1-3/percona-release-0.1-3.noarch.rpm

RUN yum update -y && yum install -y percona-toolkit

ENTRYPOINT ["pt-query-digest"]