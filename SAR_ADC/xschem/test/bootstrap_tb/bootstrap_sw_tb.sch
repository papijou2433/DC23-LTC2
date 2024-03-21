v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 1080 -70 1170 -70 {
lab=vclose}
N 910 110 910 200 {
lab=vi}
N 910 200 990 200 {
lab=vi}
N 790 -70 1020 -70 {
lab=vgate}
N 570 -70 730 -70 {
lab=vcp}
N 570 100 840 100 {
lab=vcm}
N 840 100 840 110 {
lab=vcm}
N 840 110 850 110 {
lab=vcm}
N 650 40 650 100 {
lab=vcm}
N 650 -70 650 -30 {
lab=vcp}
N 650 30 650 40 {
lab=vcm}
N 540 -250 540 -110 {
lab=vgate}
N 540 -250 930 -250 {
lab=vgate}
N 930 -250 930 -70 {
lab=vgate}
N 880 70 1020 70 {
lab=vgate}
N 1020 70 1020 160 {
lab=vgate}
N 930 -70 930 70 {
lab=vgate}
N 850 240 920 240 {
lab=vi}
N 920 200 920 240 {
lab=vi}
N 1050 200 1110 200 {
lab=vo}
N 1110 200 1110 250 {
lab=vo}
N 1140 -140 1140 -70 {
lab=vclose}
N 280 -240 280 -140 {
lab=#net1}
N 280 -270 300 -270 {
lab=v}
N 300 -300 300 -270 {
lab=v}
N 280 -300 300 -300 {
lab=v}
N 280 -110 290 -110 {
lab=vcm}
N 290 -110 290 -80 {
lab=vcm}
N 280 -80 290 -80 {
lab=vcm}
N 240 -270 240 -110 {
lab=#net2}
N 770 80 770 100 {
lab=vcm}
N 770 70 770 80 {
lab=vcm}
N 720 40 770 40 {
lab=GND}
N 810 40 930 40 {
lab=vgate}
N 760 -110 850 -110 {
lab=#net1}
N 850 -110 850 10 {
lab=#net1}
N 770 10 850 10 {
lab=#net1}
N 280 -190 770 -190 {
lab=#net1}
N 770 -190 770 -110 {
lab=#net1}
N 760 -70 760 -50 {
lab=vcp}
N 150 -250 150 -150 {
lab=#net2}
N 150 -280 170 -280 {
lab=v}
N 170 -310 170 -280 {
lab=v}
N 150 -310 170 -310 {
lab=v}
N 150 -120 160 -120 {
lab=GND}
N 160 -120 160 -90 {
lab=GND}
N 150 -90 160 -90 {
lab=GND}
N 110 -280 110 -120 {
lab=clk}
N 150 -190 240 -190 {
lab=#net2}
N 280 -80 280 40 {
lab=vcm}
N 280 40 650 40 {
lab=vcm}
N 880 110 880 130 {
lab=GND}
N 1020 200 1020 220 {
lab=GND}
N 540 -70 540 -50 {
lab=vcp}
N 720 -50 760 -50 {
lab=vcp}
N 720 -70 720 -50 {
lab=vcp}
N 540 -50 590 -50 {
lab=vcp}
N 590 -70 590 -50 {
lab=vcp}
N 1110 250 1110 280 {
lab=vo}
N 1110 340 1110 410 {
lab=GND}
C {symbols/nfet_03v3.sym} 1020 180 1 0 {name=M1
L=0.28u
W=6u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} 760 -90 3 1 {name=M2
L=0.28u
W=1u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 880 90 1 0 {name=M3
L=0.28u
W=1u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 1050 -90 1 0 {name=M4
L=0.28u
W=5u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 540 80 1 0 {name=M5
L=0.28u
W=3u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 1200 -90 1 0 {name=M6
L=0.28u
W=5u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} 540 -90 3 1 {name=M7
L=0.28u
W=3u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {devices/gnd.sym} 1230 -70 0 0 {name=l1 lab=GND}
C {devices/lab_pin.sym} 1200 -110 0 0 {name=p1 sig_type=std_logic lab=clk}
C {devices/gnd.sym} 1200 -70 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 1050 -70 0 0 {name=l4 lab=GND}
C {devices/gnd.sym} 540 100 0 0 {name=l7 lab=GND}
C {devices/lab_pin.sym} 540 60 0 0 {name=p6 sig_type=std_logic lab=clk}
C {devices/gnd.sym} 510 100 0 0 {name=l8 lab=GND}
C {devices/lab_pin.sym} 1050 -110 0 0 {name=p7 sig_type=std_logic lab=v}
C {devices/lab_pin.sym} 1110 200 0 0 {name=p9 sig_type=std_logic lab=vo}
C {devices/code.sym} 1370 120 0 0 {name=TT_MODELS 
only_toplevel=true 
format="tcleval(  @value  )"
value="
.include /foss/pdks/gf180mcuC/libs.tech/ngspice/design.ngspice
.lib /foss/pdks/gf180mcuC/libs.tech/ngspice/sm141064.ngspice typical
.lib /foss/pdks/gf180mcuC/libs.tech/ngspice/sm141064.ngspice mimcap_statistical
.lib /foss/pdks/gf180mcuC/libs.tech/ngspice/sm141064.ngspice cap_mim
"
spice_ignore=false}
C {devices/lab_pin.sym} 930 -190 0 0 {name=p11 sig_type=std_logic lab=vgate}
C {devices/lab_pin.sym} 1140 -140 0 0 {name=p12 sig_type=std_logic lab=vclose}
C {devices/lab_pin.sym} 650 -40 0 0 {name=p13 sig_type=std_logic lab=vcp}
C {devices/lab_pin.sym} 650 70 0 0 {name=p14 sig_type=std_logic lab=vcm}
C {devices/lab_pin.sym} 510 -70 0 0 {name=p15 sig_type=std_logic lab=v}
C {symbols/pfet_03v3.sym} 260 -270 0 0 {name=M8
L=0.28u
W=1u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 260 -110 0 0 {name=M9
L=0.28u
W=.25u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {devices/lab_pin.sym} 280 -300 0 0 {name=p16 sig_type=std_logic lab=v}
C {devices/lab_pin.sym} 110 -230 0 0 {name=p17 sig_type=std_logic lab=clk}
C {devices/gnd.sym} 720 40 0 0 {name=l13 lab=GND}
C {symbols/pfet_03v3.sym} 130 -280 0 0 {name=M11
L=0.28u
W=4u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 130 -120 0 0 {name=M12
L=0.28u
W=4u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {devices/lab_pin.sym} 150 -310 0 0 {name=p3 sig_type=std_logic lab=v}
C {devices/gnd.sym} 150 -90 0 0 {name=l14 lab=GND}
C {devices/gnd.sym} 880 130 0 0 {name=l5 lab=GND}
C {devices/gnd.sym} 1020 220 0 0 {name=l6 lab=GND}
C {devices/gnd.sym} 1110 410 0 0 {name=l10 lab=GND}
C {devices/capa.sym} 1110 310 0 0 {name=C1
m=1
value=4.5p
footprint=1206
device="ceramic capacitor"}
C {devices/capa.sym} 650 0 0 0 {name=C2
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {devices/code_shown.sym} 1360 -130 0 0 {name=SPICE only_toplevel=false value="
.control
save all
tran 50p 5u 3000n  

plot \{(vi-vo)*1000\} 
plot vi vo 
plot vclose
plot vgate vi
.endc"
}
C {devices/lab_pin.sym} 780 240 0 0 {name=p2 sig_type=std_logic lab=clk}
C {devices/gnd.sym} 780 300 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} 850 270 0 0 {name=V2 value="sin(1.8 1.4 2Meg)"}
C {devices/lab_pin.sym} 850 240 0 0 {name=p8 sig_type=std_logic lab=vi}
C {devices/gnd.sym} 850 300 0 0 {name=l9 lab=GND}
C {devices/vsource.sym} 710 270 0 0 {name=V3 value=3.3}
C {devices/lab_pin.sym} 710 240 0 0 {name=p10 sig_type=std_logic lab=v}
C {devices/gnd.sym} 710 300 0 0 {name=l11 lab=GND}
C {devices/vsource.sym} 780 270 0 0 {name=V1 value="PULSE(3 0 0 100p 100p 7.81n 187.5n)"}
C {symbols/nfet_03v3.sym} 790 40 0 1 {name=M10
L=0.28u
W=.28u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
