SRC=																					\
	../rtl/system.v						

.PHONY: clean system.svf

system.svf: build/system.jed
	impact -batch impactcmd.txt

build/system.jed: build/system.vm6
	cd build && hprep6 -s IEEE1149 -i system.vm6

build/system.vm6: build/system.ngd
	cd build && cpldfit -ofmt vhdl -optimize speed -htmlrpt -loc on -slew fast -init low -pterms 25 -unused float -terminate keeper -p xc2c32a-4-vq44 system.ngd

build/system.ngd: build/system.ngc system.ucf
	cd build && ngdbuild -uc ../system.ucf system.ngc

build/system.ngc: build/system.prj
	cd build && xst -ifn ../system.xst

build/system.prj: $(SRC)
	mkdir -p build
	rm -f build/system.prj
	for i in `echo $^`; do \
		if [ "$${i##*.}" = "vhd" ]; \
		then \
			echo "vhdl work ../$$i" >> build/system.prj; \
		else \
	  	echo "verilog work ../$$i" >> build/system.prj; \
	  fi \
	done

load: build/system.bit
	jtag -n load.batch

clean:
	rm -rf build

cver: $(SRC)
	cver $(SRC)
