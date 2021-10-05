[global]
strategy = 'packets'
log_level = 'debug'
filter = true
clear_packets_interval = 20
tx_confirmation = false

[rest]
enabled = true
host = '0.0.0.0'
port = 3000


[[chains]]
id='cosmoshub-4'
rpc_addr='http://10.10.51.86:26657' # cosmoshub0
grpc_addr='http://10.10.51.86:9090'
websocket_addr='ws://10.10.51.86:26657/websocket'
rpc_timeout='8s'
account_prefix='cosmos'
key_name='aw3'
store_prefix='ibc'
gas_price = { price = 0.0001, denom = 'uatom' }
max_gas=1000000
max_msg_num=15
max_tx_size=180000
clock_drift='7200s'
trusting_period='14days'

[chains.packet_filter]
policy = 'allow'
# akash, crypto-org, iris, persistence, regen, sentinel, starname
list = [['transfer', 'channel-184'], ['transfer', 'channel-187'], ['transfer', 'channel-182'], ['transfer', 'channel-190'], ['transfer', 'channel-185'], ['transfer', 'channel-186'], ['transfer', 'channel-158']]

[chains.trust_threshold]
numerator='1'
denominator='3'


[[chains]]
id='akashnet-2'
rpc_addr='http://10.10.51.201:26657' # akashnet1
grpc_addr='http://10.10.51.201:9090'
websocket_addr='ws://10.10.51.201:26657/websocket'
rpc_timeout='8s'
account_prefix='akash'
key_name='aw3'
store_prefix='ibc'
gas_price = { price = 0.001, denom = 'uakt' }
max_gas=1000000
clock_drift='7200s'
trusting_period='14days'

[chains.packet_filter]
policy = 'allow'
# cosmos-hub, crypto-org, iris, persistence, regen, sentinel, starname
list = [['transfer', 'channel-17'], ['transfer', 'channel-18'], ['transfer', 'channel-16'], ['transfer', 'channel-20'], ['transfer', 'channel-21'], ['transfer', 'channel-22'], ['transfer', 'channel-27']]

[chains.trust_threshold]
numerator='1'
denominator='3'


[[chains]]
id='sentinelhub-2'
rpc_addr='http://10.10.51.199:26657' # sentinelhub1
grpc_addr='http://10.10.51.199:9090'
websocket_addr='ws://10.10.51.199:26657/websocket'
rpc_timeout='8s'
account_prefix='sent'
key_name='aw3'
store_prefix='ibc'
gas_price = { price = 0.05, denom = 'udvpn' }
max_gas=1000000
max_msg_num=15
clock_drift='7200s'
trusting_period='14days'

[chains.packet_filter]
policy = 'allow'
# akash, cosmos-hub, crypto-org, iris, persistence, regen, starname
list = [['transfer', 'channel-10'], ['transfer', 'channel-12'], ['transfer', 'channel-13'], ['transfer', 'channel-9'], ['transfer', 'channel-15'], ['transfer', 'channel-11'], ['transfer', 'channel-40']]

[chains.trust_threshold]
numerator='1'
denominator='3'


[[chains]]
id='crypto-org-chain-mainnet-1'
rpc_addr='http://10.10.51.174:26657' # crypto1
grpc_addr='http://10.10.51.174:9090'
websocket_addr='ws://10.10.51.174:26657/websocket'
rpc_timeout='8s'
account_prefix='cro'
key_name='aw3'
store_prefix='ibc'
gas_price = { price = 0.03, denom = 'basecro' }
max_gas=1200000
max_msg_num=15
max_tx_size=450000
clock_drift='7200s'
trusting_period='14days'

[chains.packet_filter]
policy = 'allow'
# akash, cosmos-hub, iris, persistence, regen, sentinel, starname
list = [['transfer', 'channel-24'], ['transfer', 'channel-27'], ['transfer', 'channel-23'], ['transfer', 'channel-29'], ['transfer', 'channel-25'], ['transfer', 'channel-26'], ['transfer', 'channel-39']]

[chains.trust_threshold]
numerator='1'
denominator='3'


[[chains]]
id='regen-1'
rpc_addr='http://10.10.51.245:26657'
grpc_addr='http://10.10.51.245:9090'
websocket_addr='ws://10.10.51.245:26657/websocket'
rpc_timeout='8s'
account_prefix='regen'
key_name='aw3'
store_prefix='ibc'
gas_price = { price = 0.02, denom = 'uregen' }
max_gas=800000
max_msg_num=15
max_tx_size=180000
clock_drift='7200s'
trusting_period='14days'

[chains.packet_filter]
policy = 'allow'
# akash, cosmos-hub, crypto-org, iris, persistence, sentinel, starname
list = [['transfer', 'channel-10'], ['transfer', 'channel-11'], ['transfer', 'channel-12'], ['transfer', 'channel-9'], ['transfer', 'channel-14'], ['transfer', 'channel-15'], ['transfer', 'channel-29']]

[chains.trust_threshold]
numerator='1'
denominator='3'


[[chains]]
id='irishub-1'
rpc_addr='http://10.10.51.215:26657' # irishub1
grpc_addr='http://10.10.51.215:9090'
websocket_addr='ws://10.10.51.215:26657/websocket'
rpc_timeout='8s'
account_prefix='iaa'
key_name='aw3'
store_prefix='ibc'
gas_price = { price = 0.005, denom = 'uiris' }
max_gas=800000
max_tx_size=1800000
clock_drift='7200s'
trusting_period='14days'

[chains.packet_filter]
policy = 'allow'
# akash, cosmos-hub, crypto-org, persistence, regen, sentinel, starname
list = [['transfer', 'channel-11'], ['transfer', 'channel-12'], ['transfer', 'channel-13'], ['transfer', 'channel-15'], ['transfer', 'channel-16'], ['transfer', 'channel-17'], ['transfer', 'channel-21']]

[chains.trust_threshold]
numerator='1'
denominator='3'


[[chains]]
id='core-1'
rpc_addr='http://10.10.51.189:26657' # core1
grpc_addr='http://10.10.51.189:9090'
websocket_addr='ws://10.10.51.189:26657/websocket'
rpc_timeout='8s'
account_prefix='persistence'
key_name='aw3'
store_prefix='ibc'
gas_price = { price = 0.001, denom = 'uxprt' }
max_gas=1000000
max_tx_size=180000
clock_drift='7200s'
trusting_period='14days'

[chains.packet_filter]
policy = 'allow'
# akash, cosmos-hub, crypto-org, iris, regen, sentinel, starname
list = [['transfer', 'channel-20'], ['transfer', 'channel-24'], ['transfer', 'channel-23'], ['transfer', 'channel-19'], ['transfer', 'channel-21'], ['transfer', 'channel-22'], ['transfer', 'channel-27']]

[chains.trust_threshold]
numerator='1'
denominator='3'


[[chains]]
id='iov-mainnet-ibc'
rpc_addr='http://10.10.51.23:26657'
grpc_addr='http://10.10.51.23:9090'
websocket_addr='ws://10.10.51.23:26657/websocket'
rpc_timeout='8s'
account_prefix='star'
key_name='aw3'
store_prefix='ibc'
gas_price = { price = 0.02, denom = 'uiov' }
max_gas=1100000
max_msg_num=15
max_tx_size=450000
clock_drift='7200s'
trusting_period='14days'

[chains.packet_filter]
policy = 'allow'
# akash, cosmos-hub, crypto-org, iris, persistence, regen, sentinel
list = [['transfer', 'channel-7'], ['transfer', 'channel-0'], ['transfer', 'channel-9'], ['transfer', 'channel-11'], ['transfer', 'channel-13'], ['transfer', 'channel-14'], ['transfer', 'channel-15']]

[chains.trust_threshold]
numerator='1'
denominator='3'

