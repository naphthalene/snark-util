## SNARK experiment script suite

TORRENTURL=`cat url.var`
SHAREKB=`cat sharesize.var`
NUMCLI=`cat numcli.var`
DURATION=`cat duration.var`
TESTD=logs/test/run
RUNLOG=$(TESTD)/run.log

all: mklog run timer stat

mklog:
	@if [ ! -d $(TESTD) ]; then mkdir -p $(TESTD); fi; echo > $(RUNLOG)

gist:
	@gist -p $(RUNLOG)

hack:
	@./hack.sh $(TORRENTURL)

multiple:
	@echo "Connecting clients"
	@./multiple_clients.sh $(TORRENTURL) $(NUMCLI)

stat:
	@-./statcli.sh $(TORRENTURL) | tee -a $(RUNLOG)

timer:
	@./killtimer.sh $(DURATION) | tee -a $(RUNLOG) &

serve:
	@echo "Starting seeder" | tee -a $(RUNLOG)
	@./serve.sh

md5jar:
	@md5sum snark-server.jar | tee -a $(RUNLOG)
	@md5sum snark-peer.jar | tee -a $(RUNLOG)
	@md5sum snark-hack.jar | tee -a $(RUNLOG)


sharefile:
	@dd bs=1024 count=$(SHAREKB) if=/dev/urandom of=sharefile

stop: stopcli stopserv stopstat

stopcli:
	@-kill -9 `pgrep -f "snark-(peer|hack)\.jar"` > /dev/null 2>&1 ; if [ $$? -eq 0 ] ; then echo "[CLIE] [STOPPED]" | tee -a $(RUNLOG); else echo "[CLIE] [FAILED]" | tee -a $(RUNLOG); fi

stopserv:
	@-kill -9 `pgrep -f 'snark-server\.jar.*share 0.0.0.0'` > /dev/null 2>&1 ; if [ $$? -eq 0 ] ; then echo "[SERV] [STOPPED]" | tee -a $(RUNLOG); else echo "[SERV] [FAILED]" | tee -a $(RUNLOG); fi

stopstat: 
	@-kill -9 `pgrep -f 'statcli.sh'` > /dev/null 2>&1 ; if [ "$$?" -eq 0 ] ; then echo "[STAT] [STOPPED]" | tee -a $(RUNLOG); else echo "[STAT] [FAILED]" | tee -a $(RUNLOG); fi

clean:
	@rm -rf test/*

cleanlogs:
	@rm -rf logs/test/*

run: md5jar serve multiple hack 

