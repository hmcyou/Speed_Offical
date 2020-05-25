yum install wget
wget https://bintray.com/ookla/rhel/rpm -O bintray-ookla-rhel.repo
mv bintray-ookla-rhel.repo /etc/yum.repos.d/
# Other non-official binaries will conflict with Speedtest CLI
# Example how to remove using yum
# rpm -qa | grep speedtest | xargs -I {} sudo yum -y remove {}
yum install speedtest
