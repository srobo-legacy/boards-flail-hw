GSCH2PCB=gsch2pcb
PCB=pcb
GEDA_HIERPCB=sr geda-hierpcb
PROJECTRC=projectrc

.PHONY: pcb photo clean

pcb:
	${GSCH2PCB} ${PROJECTRC}
	${GEDA_HIERPCB} ${PROJECTRC}

photo: flail-top.png flail-bottom.png

flail-top.png: flail.pcb
	${PCB} -x png --dpi 600 --photo-mode --outfile flail-top.png flail.pcb

flail-bottom.png: flail.pcb
	${PCB} -x png --dpi 600 --photo-mode --photo-flip-y --outfile flail-bottom.png flail.pcb

clean:
	-rm -f flail-{top,bottom}.png flail.{net,cmd,new.pcb}
