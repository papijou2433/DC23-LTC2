v {xschem version=3.4.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 30 80 30 240 {
lab=vdd}
N 110 80 110 240 {
lab=gnd}
C {../spice/inv.sym} 70 80 3 0 {name=x1
cl=0.28u
wp=0.66u
wn=0.22u}
C {/foss/pdks/gf180mcuC/libs.tech/xschem/symbols/cap_mim_2p0fF.sym} 70 -50 0 0 {name=C1
W=CW
L=CL
model=cap_mim_1f5fF
m=1}
C {/foss/designs/sar_adc/xschem/spice/inv.sym} 70 240 3 0 {name=x2
cl=0.28u
wp=0.66u
wn=0.22u}
C {devices/ipin.sym} 30 160 0 0 {name=p3 lab=vdd}
C {devices/ipin.sym} 110 160 2 0 {name=p4 lab=gnd}
C {devices/ipin.sym} 70 300 3 0 {name=p5 lab=vin
}
C {devices/opin.sym} 70 -80 3 0 {name=p6 lab=vout}
