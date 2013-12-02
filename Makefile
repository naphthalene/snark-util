## SNARK experiment script suite

TORRENTURL=`cat url.var`
SHAREKB=`cat sharesize.var`

hack:
	@./hack.sh 

multiple:
	@echo "Spawning clients"
	@./multiple_clients.sh $(TORRENTURL)

stat:
	@./statcli.sh $(TORRENTURL)

serve:
	@echo "Starting seeder"
	@./serve.sh

sharefile:
	@dd bs=1024 count=$(SHAREKB) if=/dev/urandom of=sharefile

stopcli:
	@-kill -9 `pgrep -f '^.*snark.jar.*http.*'` > /dev/null
	@sleep 1
	@ps aux | grep snark

stopserv:
	@-kill -9 `pgrep -f 'snark-server\.jar.*share 0.0.0.0'`> /dev/null
	@sleep 1
	@ps aux | grep snark

clean:
	@rm -rf test/*

all: serve multiple hack stat