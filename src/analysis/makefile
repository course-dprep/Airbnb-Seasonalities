ANALYSIS = ../../gen/analysis/output

all: $(Analysis)/plot.pdf \
$(Analysis)/Homoscedasticity.csv \
$(Analysis)/ANOVA.csv \
$(Analysis)/Multiple comparions.csv \
$(Analysis)/Partial eta squared.csv

$(Analysis)/plot.pdf \
$(Analysis)/Homoscedasticity.csv \
$(Analysis)/ANOVA.csv \
$(Analysis)/Multiple comparions.csv \
$(Analysis)/Partial eta squared.csv: analyze.R
	Rscript analyze.R

clean:
	R -e "unlink('../../gen/analysis/output/*.csv')"
	R -e "unlink('../../gen/analysis/output/*.pdf')"