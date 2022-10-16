all: analysis data-preparation

data-preparation:
	make -C src/data-preparation

analysis: data-preparation
	make -C src/analysis

clean:
	R -e "unlink('data/*.csv')"
	R -e "unlink('gen/data-preparation/temp/*.csv')"
	R -e "unlink('gen/data-preparation/output/*.csv')"
	R -e "unlink('gen/analysis/output/*.csv')"
	R -e "unlink('gen/analysis/output/*.pdf')"