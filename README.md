# origin-trail

## Task
Create a script that will automatically deploy, setup and run 5 OriginTrail nodes on 5 servers.<br/>

## Deployment
* Using DigitalOcean API create 5 servers (droplets)<br/>
* Servers should be created in different regions<br/>
* SSH access should be secured using ssh key<br/>

## Setup
* On each server generate ssl certificate using Open SSL<br/>
* After generating certificate place them in ~/certs folder<br/>
* On each server create default configuration for ot-node and place it in path ~/.origintrail_noderc<br/>
* Default configuration is provided, update necessary fields for each node<br/>

## Run
* On each server create and run ot-node docker container.<br/>
* For running docker container you can use this command:<br/>
<pre>
docker run -i --log-driver json-file --log-opt max-size=1g --name=otnode -p 8900:8900 -p 5278:5278 -p 3000:3000 -v ~/certs:/ot-node/certs -v ~/.origintrail_noderc:/ot-node/.origintrail_noderc origintrail/ot-node:release_testnet
</pre>
<br/>

## Default Configuration
<pre>
{ 
     “node_hostname”: “https://node1.origintrail.com” 
}
</pre>

## Results on Default Configuration
<pre>
022-08-02 18:15:36,627 INFO success: otnodelistener entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2022-08-02 18:15:36,627 INFO success: remote_syslog entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2022-08-02 18:15:36,627 INFO success: otnode entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2022-08-02 18:15:36,627 INFO success: arango entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2022-08-02T18:15:36.630Z - trace - No update found.
(node:15) Warning: N-API is an experimental feature and could change at any time.
2022-08-02T18:15:36.633Z - info - Configuration:
(node:15) UnhandledPromiseRejectionWarning: TypeError: Cannot read property 'implementations' of undefined
    at RegisterNode.main (/ot-node/init/testnet/register-node.js:274:40)
    at RegisterNode.start (/ot-node/init/testnet/register-node.js:48:14)
    at <anonymous>
    at process._tickCallback (internal/process/next_tick.js:182:7)
    at Function.Module.runMain (internal/modules/cjs/loader.js:697:11)
    at startup (internal/bootstrap/node.js:201:19)
    at bootstrapNodeJSCore (internal/bootstrap/node.js:516:3)
(node:15) UnhandledPromiseRejectionWarning: Unhandled promise rejection. This error originated either by throwing inside of an async function without a catch block, or by rejecting a promise which was not handled with .catch(). (rejection id: 1)
(node:15) [DEP0018] DeprecationWarning: Unhandled promise rejections are deprecated. In the future, promise rejections that are not handled will terminate the Node.js process with a non-zero exit code.
2022-08-02 18:15:36,658 INFO exited: otnode (exit status 0; expected)
2022-08-02 18:15:37,660 WARN received SIGTERM indicating exit request
2022-08-02 18:15:37,661 INFO waiting for remote_syslog, arango, otnodelistener to die
2022-08-02 18:15:38,570 INFO stopped: arango (exit status 0)
2022-08-02 18:15:39,573 INFO stopped: remote_syslog (terminated by SIGTERM)
2022-08-02 18:15:39,574 INFO stopped: otnodelistener (terminated by SIGTERM)
2022-08-02 18:16:40,231 CRIT Supervisor running as root (no user in config file)
2022-08-02 18:16:40,242 INFO RPC interface 'supervisor' initialized
2022-08-02 18:16:40,242 CRIT Server 'unix_http_server' running without any HTTP authentication checking
2022-08-02 18:16:40,243 INFO supervisord started with pid 1
2022-08-02 18:16:41,246 INFO spawned: 'otnodelistener' with pid 9
2022-08-02 18:16:41,249 INFO spawned: 'remote_syslog' with pid 10
2022-08-02 18:16:41,252 INFO spawned: 'otnode' with pid 11
2022-08-02 18:16:41,256 INFO spawned: 'arango' with pid 12
2022-08-02T18:16:42.708Z - trace - configDir given as param '/ot-node/data/'.
2022-08-02 18:16:42,710 INFO success: otnodelistener entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2022-08-02 18:16:42,710 INFO success: remote_syslog entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2022-08-02 18:16:42,710 INFO success: otnode entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2022-08-02 18:16:42,710 INFO success: arango entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2022-08-02T18:16:42.714Z - trace - No update found.
(node:19) Warning: N-API is an experimental feature and could change at any time.
2022-08-02T18:16:42.717Z - info - Configuration:
(node:19) UnhandledPromiseRejectionWarning: TypeError: Cannot read property 'implementations' of undefined
    at RegisterNode.main (/ot-node/init/testnet/register-node.js:274:40)
    at RegisterNode.start (/ot-node/init/testnet/register-node.js:48:14)
    at <anonymous>
    at process._tickCallback (internal/process/next_tick.js:182:7)
    at Function.Module.runMain (internal/modules/cjs/loader.js:697:11)
    at startup (internal/bootstrap/node.js:201:19)
    at bootstrapNodeJSCore (internal/bootstrap/node.js:516:3)
(node:19) UnhandledPromiseRejectionWarning: Unhandled promise rejection. This error originated either by throwing inside of an async function without a catch block, or by rejecting a promise which was not handled with .catch(). (rejection id: 1)
(node:19) [DEP0018] DeprecationWarning: Unhandled promise rejections are deprecated. In the future, promise rejections that are not handled will terminate the Node.js process with a non-zero exit code.
2022-08-02 18:16:42,741 INFO exited: otnode (exit status 0; expected)
2022-08-02 18:16:43,743 WARN received SIGTERM indicating exit request
2022-08-02 18:16:43,743 INFO waiting for remote_syslog, arango, otnodelistener to die
2022-08-02 18:16:44,676 INFO stopped: arango (exit status 0)
2022-08-02 18:16:45,679 INFO stopped: remote_syslog (terminated by SIGTERM)
2022-08-02 18:16:45,680 INFO stopped: otnodelistener (terminated by SIGTERM)
</pre>

## Origin-Trail Testnet Configuration file
Configuration file as documented in the official documentation<br/>
https://docs.origintrail.io/developers/node-setup/testnet-installation<br/>
<pre>
{
   "blockchain": {
     "implementations": [
       {
         "blockchain_title": "xDai",
         "network_id": "xdai:testnet",
         "identity_filepath": "xdai_erc725_identity.json",
         "dh_price_factor" : "1",
         "node_wallet": "xxxxxxxx",
         "node_private_key": "xxxxxxxx",
         "management_wallet": "xxxxxxxx"
       } 
     ]
   },
   "network": {
     "hostname": "https://node1.origintrail.com"
     },
   "initial_deposit_amount": "5000000000000000000000",
   "dh_max_holding_time_in_minutes": 530000,
   "dh_maximum_dataset_filesize_in_mb": 10
}
</pre>

## Results on Default Configuration
Out of Scope not required in the task description<br/>