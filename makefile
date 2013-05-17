instalador:
	rm -rf 7508-20131-g5 7508-20131-g5.tar.gz
	mkdir 7508-20131-g5
	cp bin/* LibX.sh README 7508-20131-g5
	chmod +x 7508-20131-g5/*
	tar czf 7508-20131-g5.tar.gz 7508-20131-g5/*
	rm -rf 7508-20131-g5

.PHONY: instalador
