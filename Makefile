## SNARK experiment script suite

TORRENTURL=`cat url.var`
SHAREKB=`cat sharesize.var`
NUMCLI=`cat numcli.var`

hack:
	@./hack.sh $(TORRENTURL)

multiple:
	@echo "Connecting clients"
	@./multiple_clients.sh $(TORRENTURL) $(NUMCLI)

stat:
	@./statcli.sh $(TORRENTURL) 

statfull:
	@./statfull.sh $(TORRENTURL)

serve:
	@echo "Starting seeder"
	@./serve.sh

sharefile:
	@dd bs=1024 count=$(SHAREKB) if=/dev/urandom of=sharefile

stop: stopcli stopserv

stopcli:
	@-kill -9 `pgrep -f "snark-(peer|hack)\.jar"` > /dev/null 2>&1 ; if [ $$? -eq 0 ] ; then echo "[CLIE] [STOPPED]"; else echo "[CLIE] [FAILED]"; fi

stopserv:
	@-kill -9 `pgrep -f 'snark-server\.jar.*share 0.0.0.0'` > /dev/null 2>&1 ; if [ $$? -eq 0 ] ; then echo "[SERV] [STOPPED]" ; else echo "[SERV] [FAILED]"; fi

running:
	@-pgrep -lf "snark-(peer|hack)\.jar" ; if [ $$? -eq 0 ] ; then echo "[CLIE] [RUNNING]"; else echo "[CLIE] [STOPPED]"; fi
	@-pgrep -lf 'snark-server\.jar.*share 0.0.0.0' ; if [ $$? -eq 0 ] ; then echo "[SERV] [RUNNING]" ; else echo "[SERV] [STOPPED]"; fi

clean:
	@rm -rf test/*

cleanlogs:
	@rm -rf logs/test/*

all: serve multiple hack stat
.PHONY: hack multiple stat statfull serve sharefile stop stopcli stopserv running clean cleanlogs
