
SSH_HOST    := vps
MODULE_NAME := gatling-charts-highcharts-bundle-2.3.1

publish: build_gatling build_gatling-highcharts
	mv $(CURDIR)/gatling-highcharts/gatling-charts-highcharts-bundle/target/universal/*.zip $(CURDIR)/

deploy:
	scp ./$(MODULE_NAME).zip $(SSH_HOST):~/
	ssh $(SSH_HOST) 'unzip ~/$(MODULE_NAME).zip -d ~/'

build_gatling:
	cd $(CURDIR)/gatling; \
	sbt package publishLocal

build_gatling-highcharts:
	cd $(CURDIR)/gatling-highcharts; \
	sbt package publishLocal
