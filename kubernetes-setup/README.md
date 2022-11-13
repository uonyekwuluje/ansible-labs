# Install and Configure Cluster
Check Node Availability & Status
```
# Check All Nodes
make status

# Check Select Nodes
PNODES=kube-node-03 make select_status
```

Install Base Components
```
make baseconfig
```

Install Configure Master
```
make master
```

Install/Configure Worker
```
# Install Configure All workers
make workers

# Install Configure Select Worker
PNODES=kube-node-03 make add_worker
```
