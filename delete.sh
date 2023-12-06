#!/bin/bash
incus delete kube-worker2 --force
incus delete kube-worker1 --force
incus delete kube-master1 --force
