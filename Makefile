## SNARK experiment script suite

TORRENTURL=`cat url.var`
SHAREKB=`cat sharesize.var`

hack:
	@./hack.sh $(TORRENTURL)

multiple:
	@echo "Connecting clients"
	@./multiple_clients.sh $(TORRENTURL)

stat:
	@./statcli.sh $(TORRENTURL)

serve:
	@echo "Starting seeder"
	@./serve.sh

sharefile:
	@dd bs=1024 count=$(SHAREKB) if=/dev/urandom of=sharefile

stop: stopcli stopserv

stopcli:
	@-kill -9 `pgrep -f '^.*snark.jar.*http.*'` > /dev/null
	@pgrep -f '^.*snark.jar.*http.*'; if [ $$? -eq 0 ] ; 
	@ps aux | grep snark

stopserv:
	@-kill -9 `pgrep -f 'snark-server\.jar.*share 0.0.0.0'`> /dev/null
	@sleep 1
	@ps aux | grep snark

clean:
	@rm -rf test/*

cleanlogs:
	@rm -rf logs/test/*

all: serve multiple hack stat
