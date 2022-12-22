all: all-PKGBUILD

all-PKGBUILD: PKGBUILDs.asahi-scripts

PKGBUILDs.asahi-scripts: base
	# a temporary thing until i dont merge to main
	bash build/PKGBUILDs.asahi-scripts.temp
	bash build/PKGBUILDs.asahi-scripts

base:
	# update repositories
	find . -maxdepth 1 ! -path '*/.*' ! -name tmp ! -name build -type d -execdir git -C '{}' pull ';'

install:
	# this functions like a confirm script
	# it should prompt gpg if you are using it
	git -C PKGBUILDs.asahi-scripts add .
	git -C PKGBUILDs.asahi-scripts commit -sm "PKGBUILD: rebuilt package"

reject:
	# send it all back home
	git -C PKGBUILDs.asahi-scripts reset --hard HEAD
	

.PHONY: all all-PKGBUILD PKGBUILDs.asahi-scripts base install reject
