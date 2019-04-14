#****************************************************
#                                                   *
#               HTTP PROXY                          *
#               Version: 1.0                        *
#               Author: Luu Gia Thuy                *
#                                                   *
#****************************************************

import os,sys,thread,socket,io, pickle

#********* CONSTANT VARIABLES *********
BACKLOG = 50            # how many pending connections queue will hold
MAX_DATA_RECV = 999999  # max number of bytes we receive at once
DEBUG = True            # set to True to see the debug msgs
BLOCKED = []            # just an example. Remove with [""] for no blocking at all.
IDXX=0
#**************************************
#********* MAIN PROGRAM ***************
#**************************************
def main():

    global IDXX
    # check the length of command running
    if (len(sys.argv)<2):
        print "No port given, using :8080 (http-alt)" 
        port = 8080
    else:
        port = int(sys.argv[1]) # port from argument

    # host and port info.
    host = ''               # blank for localhost
    
    print "Proxy Server Running on ",host,":",port

    try:
        # create a socket
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

        # associate the socket to host and port
        s.bind((host, port))

        # listenning
        #s.listen(BACKLOG)
    
    except socket.error, (value, message):
        if s:
            s.close()
        print "Could not open socket:", message
        sys.exit(1)

    # get the connection from client
    while 1:
        #conn, client_addr = s.accept()

        # create a thread to handle request
        #thread.start_new_thread(proxy_thread, (conn, client_addr))
  
    	ppp="data_out/receiver-out" + str(IDXX) +".bin"

	aaa=os.path.isfile(ppp)
        if aaa:
            f = open(ppp, "rb")
            sssx = pickle.load(f) #.ljust(1400)
	    print(sssx)
	    f.close()
    	    IDXX=IDXX+1
        #conn.send(sss)
    s.close()
#************** END MAIN PROGRAM ***************

def printout(type,request,address):
    if "Block" in type or "Blacklist" in type:
        colornum = 91
    elif "Request" in type:
        colornum = 92
    elif "Reset" in type:
        colornum = 93

    print "\033[",colornum,"m",address[0],"\t",type,"\t",request,"\033[0m"

#*******************************************
#********* PROXY_THREAD FUNC ***************
# A thread to handle request from browser
#*******************************************
IDXX = 0
def proxy_thread(conn, client_addr):
    global IDXX 
    # get the request from browser
    request = conn.recv(MAX_DATA_RECV)

    # parse the first line
    first_line = request.split('\n')[0]

    # get url
    url = first_line.split(' ')[1]

    for i in range(0,len(BLOCKED)):
        if BLOCKED[i] in url:
            printout("Blacklisted",first_line,client_addr)
            conn.close()
            sys.exit(1)

    print("*******************************************************")
    printout("Request",first_line,client_addr)
    print("Full Request: ", request)
    print("*******************************************************")
    # print "URL:",url
    # print
    
    # find the webserver and port
    http_pos = url.find("://")          # find pos of ://
    if (http_pos==-1):
        temp = url
    else:
        temp = url[(http_pos+3):]       # get the rest of url
    
    port_pos = temp.find(":")           # find the port pos (if any)

    # find end of web server
    webserver_pos = temp.find("/")
    if webserver_pos == -1:
        webserver_pos = len(temp)

    webserver = ""
    port = -1
    if (port_pos==-1 or webserver_pos < port_pos):      # default port
        port = 80
        webserver = temp[:webserver_pos]
    else:       # specific port
        port = int((temp[(port_pos+1):])[:webserver_pos-port_pos-1])
        webserver = temp[:port_pos]

    try:
        # create a socket to connect to the web server
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)  
        s.connect((webserver, port))
        s.send(request)         # send request to webserver
        print('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$')
        print('create new socket: ', s)
        print('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$')
        
        while 1:
            # receive data from web server
            data = s.recv(MAX_DATA_RECV)
            
            if (len(data) > 0):
                # send to browser
                print('___________________________________________')
                print('Response Data:\n')
                print('___________________________________________')
                aaa="data_out/" + str(IDXX) +".bin"
                f = open(aaa , "wb")
                IDXX = IDXX + 1
		# print (IDXX)
		# print (data)

                pickle.dump(data, f)
                f.close()

		'''f = open(aaa, "rb")
        	sss = pickle.load(f) #.ljust(1400)
		f.close()
                conn.send(sss)'''
                #conn.send(data)
            else:
                break
        s.close()
        conn.close()
    except socket.error, (value, message):
        if s:
            s.close()
        if conn:
            conn.close()
        printout("Peer Reset",first_line,client_addr)
        sys.exit(1)
#********** END PROXY_THREAD ***********
    
if __name__ == '__main__':
    main()
