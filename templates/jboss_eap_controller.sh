export JAVA_HOME={{jdk_home}}
export JBOSS_HOME={{jboss_home}}/jboss-eap
export PATH=$JAVA_HOME/bin:$PATH


start() {
nohup /data/jboss/scripts/jboss-eap-init-{{ansible_hostname}}.sh start&>/data/jboss/scripts/stdout_{{ansible_hostname}}_jboss_start.out&

}

stop() {
/data/jboss/scripts/jboss-eap-init-{{ansible_hostname}}.sh stop

}

restart() {
/data/jboss/scripts/jboss-eap-init-{{ansible_hostname}}.sh restart
}




case "$1" in
  start)
      start
      ;;
  stop)
      stop
      ;;
  restart)
      restart
      ;;
  *)
      ## If no parameters are given, print which are avaiable.
      echo "Usage: $0 {start|stop}"
      exit 1
      ;;
esac
