# java-dotnet-channel-test

## To test Java channel Provider and donet channel client

1. go to donet directory
1. set environment variable com.openfin.demo.runtime.version to a version of Runtime that has the fix for RUN-7240
1. console window should show
~~~
Targetting Runtime x.x.x.x
Connected to Runtime
~~~
4. run start.bat and click on "Connect to channel"
1. go to java directory
1. set environment variable com.openfin.demo.runtime.version to a version of Runtime that has the fix for RUN-7240
1. run channel.bat
1. dotnet console window should show
~~~
channel opened
getValue returns:
{
  "value": 0
}
~~~
9. shut down Java process with CTRL+C
1. donet console window should show
~~~
channel disconnected
~~~
11. start Java process again with channel.bat
1. donet console window should show
~~~
channel opened
getValue returns:
{
  "value": 0
}
~~~
13. shut down dotnet process
1. Java console window should show
~~~
INFO: provider receives channel disconnect event from donet channel client test
~~~

## Add an OpenFin app in the mix
1. start an OpenFin app with a version of Runtime that has the fix for RUN-7240
1. open devtools->console and add the following code
~~~
async function connect() {
	const client = await fin.InterApplicationBus.Channel.connect('ChannelExample')
	await client.onDisconnection(evt => {
		console.log('Provider disconnected', `uuid: ${evt.uuid}`);
		connect()
	});
	const value = await client.dispatch('getValue');
	console.log(value);
	return client;
}
connect();
~~~
3. If Java provider is up, devtools->console should show
~~~
{value: 0}
~~~
4. When Java provider shuts down, devtools->console should show
~~~
Provider disconnected uuid: ChannelExampleprovider
~~~

## Source code

1. [Java example](https://github.com/openfin/java-example/blob/master/src/main/java/com/openfin/desktop/demo/ChannelExample.java)

2. [Dotnet example](https://github.com/wenjunche/dotnet-channel-test/blob/master/Stub/MainWindow.xaml.cs)