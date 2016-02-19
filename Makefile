
#g++ -g -Wall -o bin/main src/main.cpp

# the compiler: gcc for C program, define as g++ for C++
CC = gcc

# compiler flags:
#  -g    adds debugging information to the executable file
#  -Wall turns on most, but not all, compiler warnings
CFLAGS  = -Wall
CLIBDIR = -L /usr/local/ssl/lib 
#-L ~/Documents/github/ctattack/openssl1_0_1f/ -L /usr/local/Cellar/cryptopp/5.6.3_1/lib/
CHEADER_DIR = -I src/include/  -I /usr/local/ssl/include/
# -I ~/Documents/github/ctattack/openssl1_0_1f/crypto -I ~/Documents/github/ctattack/openssl1_0_1f/include/
CLIBS   = -lcrypto
#-lcryptopp

# the build target executable:
TARGET = main



aes_client: src/aes_client.c src/ctattack.c
	$(CC) $(CFLAGS) -o bin/aes_client src/aes_client.c src/ctattack.c -O0 $(CHEADER_DIR) $(CLIBDIR) $(CLIBS)

aes_server: src/aes_server.c src/ctattack.c
	$(CC) $(CFLAGS) -o bin/aes_server src/aes_server.c src/ctattack.c -O0 $(CHEADER_DIR) $(CLIBDIR) $(CLIBS)

aes_random_server: src/aes_random_server.c src/ctattack.c
	$(CC) $(CFLAGS) -o bin/aes_random_server src/aes_random_server.c src/ctattack.c -O0 $(CHEADER_DIR) $(CLIBDIR) $(CLIBS)

aes_verbose_server: src/aes_verbose_server.c src/ctattack.c
	$(CC) $(CFLAGS) -o bin/aes_verbose_server src/aes_verbose_server.c src/ctattack.c -O0 $(CHEADER_DIR) $(CLIBDIR) $(CLIBS)

aes_example: src/aes_example.c src/ctattack.c
	$(CC) $(CFLAGS) -o bin/aes_example src/aes_example.c src/ctattack.c -O0 $(CHEADER_DIR) $(CLIBDIR) $(CLIBS)

sender: src/sender.c src/ctattack.c
	$(CC) $(CFLAGS) -o bin/sender src/sender.c src/ctattack.c -O0 $(CHEADER_DIR)

receiver: src/receiver.c src/ctattack.c
	$(CC) $(CFLAGS) -o bin/receiver src/receiver.c src/ctattack.c -O0 $(CHEADER_DIR)	

sender_v2: src/sender_v2.c src/ctattack.c
	$(CC) $(CFLAGS) -o bin/sender_v2 src/sender_v2.c src/ctattack.c -O0 $(CHEADER_DIR)	

receiver_v2: src/receiver_v2.c src/ctattack.c
	$(CC) $(CFLAGS) -o bin/receiver_v2 src/receiver_v2.c src/ctattack.c -O0 $(CHEADER_DIR)	






# STUF THAT NEED TO BE REVISED

all: $(TARGET)

$(TARGET): src/$(TARGET).c src/ctattack.c
	$(CC) $(CFLAGS) -o bin/$(TARGET) src/$(TARGET).c src/ctattack.c -O0 $(CHEADER_DIR)

#bin/main: src/$(TARGET).cpp 	# this is not working, how to make bin/main depend on src/$(TARGET)




debug: src/$(TARGET).c src/ctattack.c
	$(CC) $(CFLAGS) -o bin/$(TARGET) $(TARGET).c src/ctattack.c -O0 -g $(CHEADER_DIR)

masm_intel: src/$(TARGET).c src/ctattack.c
	$(CC) $(CFLAGS) -o bin/$(TARGET) $(TARGET).c src/ctattack.c -O0 -masm=intel $(CHEADER_DIR)

run: bin/$(TARGET)
	./bin/$(TARGET) $(ARGS)

clean:
	$(RM) $(TARGET)

