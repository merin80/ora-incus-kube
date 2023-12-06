#!/bin/bash
incus create -p k8sprofile images:debian/12/cloud kube-master1
incus create -p k8sprofile images:debian/12/cloud kube-worker1
incus create -p k8sprofile images:debian/12/cloud kube-worker2

incus config device add kube-master1 eth1 nic name=eth1 network=k8s-internal ipv4.address=10.152.168.11
incus config device add kube-worker1 eth1 nic name=eth1 network=k8s-internal ipv4.address=10.152.168.21
incus config device add kube-worker2 eth1 nic name=eth1 network=k8s-internal ipv4.address=10.152.168.22

incus config device override kube-master1 eth0 ipv4.address=10.82.151.214
incus config device override kube-worker1 eth0 ipv4.address=10.82.151.146
incus config device override kube-worker2 eth0 ipv4.address=10.82.151.186

incus config device add kube-master1 kubelet disk pool=default source=kube-master1 path=/var/lib/kubelet
incus config device add kube-worker1 kubelet disk pool=default source=kube-worker1 path=/var/lib/kubelet
incus config device add kube-worker2 kubelet disk pool=default source=kube-worker2 path=/var/lib/kubelet

incus start kube-master1
incus start kube-worker1
incus start kube-worker2
