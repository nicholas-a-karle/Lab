from socket import *
serverName = "54.90.99.53"
serverPort = 12000
clientSocket = socket(AF_INET, SOCK_DGRAM)
message = input("this message is being sent")
clientSocket.sendto(message.encode(),(serverName, serverPort))
modifiedMessage, serverAddress = clientSocket.recvfrom(2048)
print(modifiedMessage.decode())
clientSocket.close()