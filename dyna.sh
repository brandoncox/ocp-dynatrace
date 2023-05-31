#!/bin/bash

oc adm new-project --node-selector="" dynatrace
oc apply -f https://github.com/Dynatrace/dynatrace-operator/releases/download/v0.11.1/openshift.yaml
oc -n dynatrace wait pod --for=condition=ready --selector=app.kubernetes.io/name=dynatrace-operator,app.kubernetes.io/component=webhook --timeout=300s
oc apply -f bootstrap/dynakube.yaml