extends Node

const IP_ADDRESS: String = "localhost"
const PORT: int = 1337

var peer: ENetMultiplayerPeer

func _ready():
	peer = ENetMultiplayerPeer.new()

func host():
	peer.create_server(PORT)
	multiplayer.multiplayer_peer = peer
	
	multiplayer.peer_connected.connect(peer_connecting)

func join():
	peer.create_client(IP_ADDRESS, PORT)
	multiplayer.multiplayer_peer = peer

func peer_connecting(pid):
	print("Peer " + str(pid) + " has joined the game!")
	#add_player(pid)
	
