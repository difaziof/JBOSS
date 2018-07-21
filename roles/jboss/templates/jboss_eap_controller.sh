export JAVA_HOME={{jdk_home}}
export JBOSS_HOME={{jboss_home}}/jboss-eap
export PATH=$JAVA_HOME/bin:$PATH


start() {
nohup {{jboss_home}}/scripts/jboss-eap-init-{{ansible_hostname}}.sh start&>{{jboss_home}}/scripts/stdout_{{ansible_hostname}}_jboss_start.out&

}

stop() {
{{jboss_home}}/scripts/jboss-eap-init-{{ansible_hostname}}.sh stop

}

restart() {
{{jboss_home}}/scripts/jboss-eap-init-{{ansible_hostname}}.sh restart
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
