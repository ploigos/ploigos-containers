# ploigos-jenkins-plugins

This container image contains the set of Jenkins plugins and dependencies that Ploigos workflows require.

This container image can be installed as an initContainer that copies plugins into `$JENKINS_HOME/plugins` on
startup. For persistent Jenkins deployments, mount the Jenkins PV into the init container so the copying can
occur.

Example:
```
      initContainers:
        - name: ploigos-plugins
          command:
            - /bin/bash
          imagePullPolicy: Always
          volumeMounts:
            - name: jenkins-data
              mountPath: /var/lib/jenkins
          image: >-
            registry.gpslab.cbr.redhat.com/redhatgov/ploigos-jenkins-plugins:latest
          args:
            - '-c'
            - >-
              mkdir -p /var/lib/jenkins/plugins ; cp --remove-destination -v
              /ploigos-jenkins-plugins/* /var/lib/jenkins/plugins
```
