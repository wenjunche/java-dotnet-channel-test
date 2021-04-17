@ECHO OFF
REM This program is an example of channel API.   It can be run as channel provider or client
REM Channel name: ChannelExample
REM usage:  channel.bat [ provider | client ]
set mode=%1
IF "%~1" == "" set mode=provider
echo Channel type set to: %mode%
java -cp lib/hamcrest-core-1.3.jar;lib/hamcrest-library-1.1.jar;lib/jetty-client-9.4.18.v20190429.jar;lib/jetty-http-9.4.18.v20190429.jar;lib/jetty-io-9.4.18.v20190429.jar;lib/jetty-util-9.4.18.v20190429.jar;lib/jetty-xml-9.4.18.v20190429.jar;lib/jna-4.5.1.jar;lib/jna-platform-4.5.1.jar;lib/json-20160810.jar;lib/junit-4.11.jar;lib/mockito-core-1.9.5.jar;lib/objenesis-1.0.jar;lib/openfin-desktop-java-adapter-8.0.11-SNAPSHOT.jar;lib/openfin-desktop-java-example-7.1.1-tests.jar;lib/openfin-desktop-java-example-7.1.1.jar;lib/openfin-snap-dock-1.0.0.1.jar;lib/slf4j-api-1.7.21.jar;lib/slf4j-jdk14-1.6.1.jar;lib/slf4j-log4j12-1.7.18.jar;lib/TableLayout-20050920.jar;lib/websocket-api-9.4.18.v20190429.jar;lib/websocket-client-9.4.18.v20190429.jar;lib/websocket-common-9.4.18.v20190429.jar -Djava.util.logging.config.file=logging.properties -Dcom.openfin.demo.runtime.version=%com.openfin.demo.runtime.version% com.openfin.desktop.demo.ChannelExample %mode%

