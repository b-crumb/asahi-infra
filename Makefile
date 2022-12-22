all: all-PKGBUILD

all-PKGBUILD: PKGBUILDs.asahi-scripts

PKGBUILDs.asahi-scripts: base
	bash build/PKGBUILDs.asahi-scripts

base:
	# update repositories
	git submodule update --recursive --init --remote

install:
	git -C PKGBUILDs.asahi-scripts add .
	git -C PKGBUILDs.asahi-scripts commit -sm "PKGBUILD: bump to latest"

reject:
	# send it all back home
	git -C PKGBUILDs.asahi-scripts reset --hard HEAD
	git -C PKGBUILDs.asahi-scripts clean -fdx
	

.PHONY: all all-PKGBUILD PKGBUILDs.asahi-scripts base reject
