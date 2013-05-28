#! /usr/bin/make -f
instalador: clean
	mkdir 7508-20131-g5
	chmod +x bin/*
	cp -r bin/* mae/*.mae conf/*.tab LibX.sh README Corpus 7508-20131-g5
	tar czf 7508-20131-g5.tar.gz 7508-20131-g5/*
	rm -rf 7508-20131-g5

clean:
	rm -rf 7508-20131-g5 7508-20131-g5.tar.gz

.PHONY: instalador clean
