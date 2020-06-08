SOURCE="https://www.thebloomapp.com/dn/installBloom.sh"
DESTINATION="installer.sh"
OUTPUT="Bloom.AppImage"
PWD=$(shell pwd)

all:
	echo "Building: $(OUTPUT)"
	wget --output-document=$(DESTINATION) --continue $(SOURCE)
	chmod +x $(DESTINATION)
	export BLOOM_SHARED_PATH=$(PWD)/AppDir/lib/bloom && $(PWD)/$(DESTINATION) $(PWD)/AppDir/bloom
	chmod +x AppDir/AppRun
	export ARCH=x86_64 && bin/appimagetool.AppImage AppDir $(OUTPUT)
	chmod +x $(OUTPUT)
