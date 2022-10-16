DATA = ../../DATA
TEMP = ../../gen/DATA-preparation/temp
OUTPUT = ../../gen/DATA-preparation/output

all: $(DATA)/thenetherlandsnorthhollandamsterdam.csv \
$(DATA)/portugallisbonlisbon.csv \
$(DATA)/belgiumvlgghent.csv \
$(DATA)/austriaviennavienna.csv \
$(DATA)/australiavicmelbourne.csv \
$(DATA)/australianswnorthernrivers.csv \
$(DATA)/australianswsydney.csv \
$(DATA)/australiawawesternaustralia.csv \
$(TEMP)/merged_cities_north.csv \
$(TEMP)/merged_cities_south.csv \
$(OUTPUT)/all_cities_merged.csv 

$(DATA)/thenetherlandsnorthhollandamsterdam.csv \
$(DATA)/portugallisbonlisbon.csv \
$(DATA)/belgiumvlgghent.csv \
$(DATA)/austriaviennavienna.csv \
$(DATA)/australiavicmelbourne.csv \
$(DATA)/australianswnorthernrivers.csv \
$(DATA)/australianswsydney.csv \
$(DATA)/australiawawesternaustralia.csv: download_DATA.R
	Rscript download_DATA.R

$(TEMP)/merged_cities_north.csv \
$(TEMP)/merged_cities_south.csv: \
clean_DATA.R \
$(DATA)/thenetherlandsnorthhollandamsterdam.csv \
$(DATA)/portugallisbonlisbon.csv \
$(DATA)/belgiumvlgghent.csv \
$(DATA)/austriaviennavienna.csv \
$(DATA)/australiavicmelbourne.csv \
$(DATA)/australianswnorthernrivers.csv \
$(DATA)/australianswsydney.csv \
$(DATA)/australiawawesternaustralia.csv
	Rscript clean_DATA.R

$(OUTPUT)/all_cities_merged.csv: \
merge_data.R \
$(TEMP)/merged_cities_north.csv \
$(TEMP)/merged_cities_south.csv
	Rscript merge_data.R

clean:
	R -e "unlink('../../data/*.csv')"
	R -e "unlink('../../gen/data-preparation/temp/*.csv')"
	R -e "unlink('../../gen/data-preparation/output/*.csv')"
