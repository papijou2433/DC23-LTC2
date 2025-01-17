v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 380 -180 380 -170 {
lab=V}
N 230 -180 230 -170 {
lab=reset}
N 150 -180 150 -170 {
lab=set}
N 1000 -140 1040 -140 {
lab=Vout}
N 1040 -160 1040 -140 {
lab=Vout}
N 850 -140 940 -140 {
lab=Vq}
N 850 -150 850 -140 {
lab=Vq}
N 850 -100 850 -90 {
lab=#net1}
N 850 -100 940 -100 {
lab=#net1}
C {devices/vsource.sym} 150 -140 0 0 {name=V1 value="PULSE(0 3 0 100p 100p 1000n 2000n)"}
C {devices/vsource.sym} 230 -140 0 0 {name=V2 value="PULSE(0 3 0 100p 100p 500n 1000n)"}
C {devices/gnd.sym} 770 -50 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 150 -110 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} 230 -110 0 0 {name=l3 lab=GND}
C {devices/lab_wire.sym} 150 -180 0 0 {name=p1 sig_type=std_logic lab=set}
C {devices/lab_wire.sym} 230 -180 0 0 {name=p2 sig_type=std_logic lab=reset}
C {devices/lab_wire.sym} 690 -150 0 0 {name=p4 sig_type=std_logic lab=set}
C {devices/lab_wire.sym} 690 -90 0 0 {name=p5 sig_type=std_logic lab=reset}
C {devices/vsource.sym} 380 -140 0 0 {name=V4 value=3.3}
C {devices/gnd.sym} 380 -110 0 0 {name=l5 lab=GND}
C {devices/lab_wire.sym} 380 -180 0 0 {name=p7 sig_type=std_logic lab=V
}
C {devices/lab_wire.sym} 770 -190 0 0 {name=p8 sig_type=std_logic lab=V
}
C {devices/code_shown.sym} 740 -540 0 0 {name=SPICE1 only_toplevel=false value="
.control
save all
tran 500p 10u  
plot set reset vout
plot vq
.endc"}
C {devices/code.sym} 50 -400 0 0 {name=TT_MODELS 
only_toplevel=true 
format="tcleval(  @value  )"
value="
.include /foss/pdks/gf180mcuC/libs.tech/ngspice/design.ngspice
.lib /foss/pdks/gf180mcuC/libs.tech/ngspice/sm141064.ngspice typical
"
spice_ignore=false}
C {jesusu/Simbolos/Vdiffmeter.sym} 840 20 0 0 {name=X3}
C {devices/gnd.sym} 970 -80 0 0 {name=l7 lab=GND}
C {devices/lab_wire.sym} 1040 -160 0 0 {name=p15 sig_type=std_logic lab=Vout
}
C {devices/res.sym} 1040 -110 0 0 {name=R2
value=100k
footprint=1206
device=resistor
m=2}
C {devices/gnd.sym} 1040 -80 0 0 {name=l9 lab=GND}
C {jesusu/Simbolos/SR_nand.sym} -1470 1710 0 0 {name=X1}
C {devices/lab_wire.sym} 910 -140 0 0 {name=p3 sig_type=std_logic lab=Vq
}
