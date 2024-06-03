VERSION := 1.34
TARGET_DIR := $(HOME)/.local/bin

hledger-linux-x64.tar.gz:
	wget https://github.com/simonmichael/hledger/releases/download/$(VERSION)/hledger-linux-x64.tar.gz

bin/hledger: hledger-linux-x64.tar.gz
	mkdir bin
	tar -C bin/ -xzf hledger-linux-x64.tar.gz

install: bin/hledger
	cp -f bin/hledger "$(TARGET_DIR)/"
	cp -f bin/hledger-ui "$(TARGET_DIR)/"
	cp -f bin/hledger-web "$(TARGET_DIR)/"

clean:
	rm -rf bin/
	rm -f hledger-linux-x64.tar.gz

version:
	hledger --version
