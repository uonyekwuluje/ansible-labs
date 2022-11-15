# Wazuh Setup
Check Node Availability & Status
```
make status
```

Deploy/Build Cluster
```
ansible-playbook main.yaml
```

Change Password
```
sudo /usr/share/wazuh-indexer/plugins/opensearch-security/tools/wazuh-passwords-tool.sh
sudo /usr/share/wazuh-indexer/plugins/opensearch-security/tools/wazuh-passwords-tool.sh -u admin -p Waz3Pas#oR+d9
bash wazuh-passwords-tool.sh -u admin -p mypassword
```
