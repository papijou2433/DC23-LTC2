v {xschem version=3.4.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
C {/foss/designs/sar_adc/xschem/spice/sar_logic.sym} 40 130 0 0 {name=X1}
C {devices/opin.sym} 140 150 1 0 {name=p2 lab=eoc}
C {devices/ipin.sym} 20 0 0 0 {name=p3 lab=data_in}
C {devices/ipin.sym} 80 -150 1 0 {name=p4 lab=clk}
C {devices/ipin.sym} 100 -150 1 0 {name=p5 lab=rst}
C {devices/vdd.sym} 140 -150 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} 80 150 0 0 {name=l14 lab=GND}
C {devices/code_shown.sym} -860 -170 0 0 {name=NGSPICE only_toplevel=false value="
.include /foss/pdks/gf180mcuC/libs.tech/ngspice/design.ngspice
.include /foss/pdks/gf180mcuC/libs.ref/gf180mcu_fd_sc_mcu7t5v0/spice/gf180mcu_fd_sc_mcu7t5v0.spice
.lib /foss/pdks/gf180mcuC/libs.tech/ngspice/sm141064.ngspice typical

.param period=10u
.param stoptime=\{50*period\}

vd0 data_in 0 PULSE(0 3.3 \{0*period\}  1ps 1ps \{period/2*10\} \{period*10\})
vc  clk 0 PULSE(0 3.3 \{0*period\}  1ps 1ps \{period/2\} \{period\})
vr  rst 0 PULSE(0 3.3 \{0*period\}  1ps 1ps \{12*period/2\} \{12*period\} 2)
.tran \{0.05*stoptime\} \{stoptime\} uic

.control
save all
run
plot V(q0) V(q11)
plot V(clk) V(rst)
plot V(data_in)
plot \{V(q11)*2048+V(q10)*1024+V(q9)*512+V(q8)*256+V(q7)*128+V(q6)*64+V(q5)*32+V(q4)*16+V(q3)*8+V(q2)*4+V(q1)*2+V(q0)\}
plot V(eoc)
.endc
"}
C {devices/vsource.sym} 0 -70 0 1 {name=VDD value=3.3}
C {devices/gnd.sym} 0 -40 0 1 {name=l17 lab=GND}
C {devices/vdd.sym} 0 -100 0 1 {name=l18 lab=VDD}
C {devices/opin.sym} 200 -110 0 0 {name=p1 lab=q0}
C {devices/opin.sym} 200 -90 0 0 {name=p6 lab=q1}
C {devices/opin.sym} 200 -70 0 0 {name=p7 lab=q2}
C {devices/opin.sym} 200 -50 0 0 {name=p8 lab=q3}
C {devices/opin.sym} 200 -30 0 0 {name=p9 lab=q4}
C {devices/opin.sym} 200 -10 0 0 {name=p10 lab=q5}
C {devices/opin.sym} 200 10 0 0 {name=p11 lab=q6}
C {devices/opin.sym} 200 30 0 0 {name=p12 lab=q7}
C {devices/opin.sym} 200 50 0 0 {name=p13 lab=q8}
C {devices/opin.sym} 200 70 0 0 {name=p14 lab=q9}
C {devices/opin.sym} 200 90 0 0 {name=p15 lab=q10}
C {devices/opin.sym} 200 110 0 0 {name=p16 lab=q11}
