v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 320 -530 360 -530 {
lab=Vindiff}
N 230 -530 260 -530 {
lab=Vin1}
N 230 -490 260 -490 {
lab=Vin2}
N 540 -480 560 -480 {
lab=Vin1}
N 540 -450 560 -450 {
lab=clk}
N 540 -410 560 -410 {
lab=Vin2}
N 390 -340 390 -330 {
lab=V}
N 310 -340 310 -330 {
lab=clk}
N 240 -340 240 -330 {
lab=Vin2}
N 160 -340 160 -330 {
lab=Vin1}
N 360 -550 360 -530 {
lab=Vindiff}
C {jesusu/Simbolos/Preamp-Strong-Latch.sym} -3780 3200 0 0 {name=X1}
C {devices/vsource.sym} 160 -300 0 0 {name=V1 value="SIN(2 2 1meg)"}
C {devices/vsource.sym} 240 -300 0 0 {name=V2 value="SIN(3 3 2meg)"}
C {devices/vsource.sym} 310 -300 0 0 {name=V3 value="PULSE(0 3 0 100p 100p 5n 10n)"}
C {devices/gnd.sym} 640 -380 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 160 -270 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} 240 -270 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 310 -270 0 0 {name=l4 lab=GND}
C {devices/lab_wire.sym} 160 -340 0 0 {name=p1 sig_type=std_logic lab=Vin1}
C {devices/lab_wire.sym} 240 -340 0 0 {name=p2 sig_type=std_logic lab=Vin2}
C {devices/lab_wire.sym} 310 -340 0 0 {name=p3 sig_type=std_logic lab=clk
}
C {devices/lab_wire.sym} 540 -480 0 0 {name=p4 sig_type=std_logic lab=Vin1}
C {devices/lab_wire.sym} 540 -410 0 0 {name=p5 sig_type=std_logic lab=Vin2}
C {devices/lab_wire.sym} 540 -450 0 0 {name=p6 sig_type=std_logic lab=clk
}
C {devices/vsource.sym} 390 -300 0 0 {name=V4 value=3.3}
C {devices/gnd.sym} 390 -270 0 0 {name=l5 lab=GND}
C {devices/lab_wire.sym} 390 -340 0 0 {name=p7 sig_type=std_logic lab=V
}
C {devices/lab_wire.sym} 640 -520 0 0 {name=p8 sig_type=std_logic lab=V
}
C {jesusu/Simbolos/Vdiffmeter.sym} 160 -370 0 0 {name=X2}
C {devices/lab_wire.sym} 230 -530 0 0 {name=p9 sig_type=std_logic lab=Vin1}
C {devices/lab_wire.sym} 230 -490 0 0 {name=p10 sig_type=std_logic lab=Vin2}
C {devices/gnd.sym} 290 -470 0 0 {name=l6 lab=GND}
C {devices/lab_wire.sym} 360 -550 0 0 {name=p11 sig_type=std_logic lab=Vindiff
}
C {devices/lab_wire.sym} 720 -450 0 0 {name=p12 sig_type=std_logic lab=outcomp
}
C {devices/res.sym} 360 -500 0 0 {name=R1
value=100k
footprint=1206
device=resistor
m=2}
C {devices/res.sym} 720 -420 0 0 {name=R2
value=100k
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 720 -390 0 0 {name=l7 lab=GND}
C {devices/gnd.sym} 360 -470 0 0 {name=l8 lab=GND}
C {devices/code_shown.sym} 80 -670 0 0 {name=SPICE1 only_toplevel=false value="
.control
save all
tran 500p 10u  
plot vindiff outcomp
plot vin1
.endc"}
C {devices/code.sym} 60 -560 0 0 {name=TT_MODELS 
only_toplevel=true 
format="tcleval(  @value  )"
value="
.include /foss/pdks/gf180mcuC/libs.tech/ngspice/design.ngspice
.lib /foss/pdks/gf180mcuC/libs.tech/ngspice/sm141064.ngspice typical
"
spice_ignore=false}
