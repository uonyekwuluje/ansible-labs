status:
	ansible -m ping k8sstack -o

select_status:
	ansible -m ping $(PNODES) -o

baseconfig:
	ansible-playbook main.yaml --tags "common" --skip-tags "reboot"
	#ansible-playbook main.yaml --skip-tags "sdelay" --tags "join, worker"
master:
	ansible-playbook main.yaml --tags "master" --skip-tags "reboot"

workers:
	ansible-playbook main.yaml --tags "join, worker" --skip-tags "reboot"

add_worker:
	ansible-playbook main.yaml --tags "common" --skip-tags "reboot" --limit $(PNODES)
	ansible-playbook main.yaml --tags "join, worker" --skip-tags "reboot" --limit $(PNODES)
