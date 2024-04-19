VERSION := 1.33
TARGET_DIR := $(HOME)/.local/bin

hledger-linux-x64.zip:
	wget https://github.com/simonmichael/hledger/releases/download/$(VERSION)/hledger-linux-x64.zip

hledger-linux-x64.tar: hledger-linux-x64.zip
	unzip hledger-linux-x64.zip

bin/hledger: hledger-linux-x64.tar
	mkdir bin
	tar -C bin/ -xf hledger-linux-x64.tar

install: bin/hledger
	cp -f bin/hledger "$(TARGET_DIR)/"
	cp -f bin/hledger-ui "$(TARGET_DIR)/"
	cp -f bin/hledger-web "$(TARGET_DIR)/"

clean:
	rm -rf bin/
	rm -f hledger-linux-x64.zip
	rm -f hledger-linux-x64.tar

version:
	hledger --version
