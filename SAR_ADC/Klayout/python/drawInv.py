import gf180
import gdsfactory as gf

def fingers_to_sources(F):
    if F >= 2  :
        return 2 + (F - 2) // 2
    else:
        raise ValueError("F debe ser mayor o igual a 2")
    
def fingers_to_drains(F):
    if F >= 2  :
        return (F + 1) // 2
    else:
        raise ValueError("F debe estar entre 2 y 12 inclusive.")
@gf.cell   
def drawInv(
        w_gate_Nmos : float = 2,
        folding_Nmos: int = 1,
        w_gate_Pmos: float = 2,
        folding_Pmos: int = 1,
)->gf.Component:
    top = gf.Component("TOP")

    folding = folding_Nmos
    if folding > 1:
        w_gate_folding = w_gate_Nmos/folding
        nf = folding
    else:
        w_gate_folding = w_gate_Nmos
        nf = 1

    folding_P = folding_Pmos
    if folding_P > 1:
        w_gate_folding_P = w_gate_Pmos/folding_P
        nf_P = folding_P
    else:
        w_gate_folding_P = w_gate_Pmos
        nf_P = 1

    inter_sd_l = 0.52
    l_gate = 0.28

    metal_s = "metal1"
    width_metal1_conection = 0.38

    # Nmos  pull_down
    pull_down = drawTransistor('Nmos' , w_gate_Nmos , folding_Nmos)
    pull_up   = drawTransistor('Pmos' , w_gate_Pmos , folding_Pmos)



    pull_up = top << pull_up
    pull_down = top << pull_down
    pull_up.mirror_y(y0=w_gate_folding_P/2)
    pull_up.movey(w_gate_folding + 2)

    #out
    drain_out = gf.components.rectangle(size=(0.38, 0.84), layer=metal_s)   #0.84 es la distania en las que quedas los m1
    drain_out = top.add_ref(drain_out)
    drain_out.movex(0.075 + 0.07 + l_gate)
    drain_out.movey(w_gate_folding + 0.58)

    out_m1_nf = nf if nf >= nf_P else nf_P
    drain_out2 = gf.components.rectangle(size=((out_m1_nf+3)*inter_sd_l, 0.38), layer=metal_s)   #0.84 es la distania en las que quedas los m1
    drain_out2 = top.add_ref(drain_out2)
    drain_out2.movex(0.075 + 0.07 + l_gate + 0.38)
    drain_out2.movey(w_gate_folding + 0.81)

    #In
    poly_in = gf.components.rectangle(size=(0.38, 0.8), layer="poly2")   #0.84 es la distania en las que quedas los m1
    poly_in = top.add_ref(poly_in)
    poly_in.movex(0.025)
    poly_in.movey(w_gate_folding + 0.6)

    poly_in2 = gf.components.rectangle(size=(2, 0.38), layer="poly2")   #0.84 es la distania en las que quedas los m1
    poly_in2 = top.add_ref(poly_in2)
    poly_in2.movex(0.025 - 2)
    poly_in2.movey(w_gate_folding + 0.8)


    #contact 
    contactPoly = gf.components.rectangle(size=(width_metal1_conection, width_metal1_conection), layer=metal_s)  
    contactPoly = top.add_ref(contactPoly)
    contactPoly.movex(0.025-2)
    contactPoly.movey(w_gate_folding + 0.8)

    contactP_m1 = gf.components.rectangle(size=(0.22, 0.22), layer="contact")
    contactP_m1 = top.add_ref(contactP_m1)
    contactP_m1.movex(0.025-2 + 0.08)
    contactP_m1.movey(w_gate_folding + 0.8 + 0.08)

    return  top


@gf.cell   
def drawTransistor(
        typeTransistor : str = 'Nmos',   #  opcion de Nmos y Pmos 
        w_gate : float = 2,
        folding: int = 1,
)->gf.Component:
    transistor = gf.Component(typeTransistor)
     #estos 2 parametros los dejamos fijas para ambos transistores 
    inter_sd_l = 0.52
    l_gate = 0.28

    metal_s = "metal1"
    width_metal1_conection = 0.38
    DistanceFisrt_metal1_conection =  - 0.375      # desde el origen (0.0) el primer source esta a la izquierda (-)
    min_distance_between_m1 = 0.26

    #ej. foldding = 2, W = 4, x = 2     donde x es la cantida de finger a usar 
    if folding > 1:
        w_gate_folding = w_gate/folding
        nf = folding
    else:
        w_gate_folding = w_gate
        nf = 1

    if typeTransistor == 'Nmos':
        c = gf180.nfet(
        l_gate=l_gate,
        w_gate= w_gate_folding,
        sd_con_col=1,          #numero de columnas de contacto en la difusion 
        inter_sd_l= inter_sd_l,       #largo del canal entre finger
        nf=nf,                  #numero de fingers
        grw=0.38,
        volt='3.3V',
        bulk='None',
        con_bet_fin=1,
        gate_con_pos='top',   #alternating   #bottom
        interdig=1,
        patt='',
        deepnwell=0,
        pcmpgr=0,
        lbl=0,  # Cambia 'label' por 'lbl'
        sub_lbl='',
        patt_lbl=0
        )

        bulk_plus = "pplus"
        
    else:
        c = gf180.pfet(
        l_gate=l_gate,
        w_gate= w_gate_folding,
        sd_con_col=1,          #numero de columnas de contacto en la difusion 
        inter_sd_l= inter_sd_l,       #largo del canal entre finger
        nf=nf,                  #numero de fingers
        grw=0.38,
        volt='3.3V',
        bulk='None',
        con_bet_fin=1,
        gate_con_pos='top',   #alternating   #bottom
        interdig=1,
        patt='',
        deepnwell=0,
        pcmpgr=0,
        lbl=0,  # Cambia 'label' por 'lbl'
        sub_lbl='',
        patt_lbl=0
        )
        bulk_plus = "nplus"

    c = transistor << c


    if nf >=2:  
    
        # nf par -> sources = nf -1  and drain = nf -2      |   nf impar -> sources = nf -1  and drain = nf -1       #cantidad de sources y drains al hacer foldding

        #hace una if para saber si nf es par o impar y un else para caso impar
        if nf % 2 == 0:
            Length_horizontal_metal1_conection = 2*(inter_sd_l - 0.07)  + (nf -1)*inter_sd_l +nf*l_gate
        else:
            Length_horizontal_metal1_conection =2*(inter_sd_l - 0.07)  + (nf -2)*inter_sd_l +(nf-1)*l_gate

        sourceMOS_H = gf.components.rectangle(size=( Length_horizontal_metal1_conection , width_metal1_conection), layer=metal_s)  #3.72
        sourceMOS_H = transistor.add_ref(sourceMOS_H)
        sourceMOS_H.movex(DistanceFisrt_metal1_conection)
        sourceMOS_H.movey(-1*width_metal1_conection - min_distance_between_m1  + 0.06)   # 0.06 pq me falto un poco y era más facil asi al igual que en el for

        sources = []  # List to store the references
        sourceMOS_m1_y = gf.components.rectangle(size=(0.38, min_distance_between_m1), layer=metal_s)   #agregando el bulk del lado izquierdo
        sourceNP = fingers_to_sources(nf)  #cantidad de sources que hay al hacer el folding
        for i in range(sourceNP):
            sources.append(transistor.add_ref(sourceMOS_m1_y))

        for i, source in enumerate(sources):  # Start from the 1st index
            firstM = 0 if i == 0 else 0.07
            secondM = secondM = 0.07 if i > 1 else 0
            source.move([ DistanceFisrt_metal1_conection + firstM + secondM*(i-1) + i*(width_metal1_conection + 0.07 + inter_sd_l )  + 2*i*l_gate , -min_distance_between_m1 + 0.06])  # Move the reference   izquierda
    else:
        sourceMOS_m1_y = gf.components.rectangle(size=(0.38, 0.64), layer=metal_s) 
        sourceMOS_m1_y = transistor.add_ref(sourceMOS_m1_y)
        sourceMOS_m1_y.move([DistanceFisrt_metal1_conection , -0.58 ])

    #drain
    firstM1_drain = 0.425
    if nf >=3:
        if nf % 2 == 0:
            Length_horizontal_metal1_conection = (inter_sd_l - 0.07)  + (nf -2)*inter_sd_l +(nf-2)*l_gate -0.07
        else:
            Length_horizontal_metal1_conection =(inter_sd_l - 0.07)  + (nf -1)*inter_sd_l +(nf-1)*l_gate -0.07

        drainMOS_H = gf.components.rectangle(size=( Length_horizontal_metal1_conection , width_metal1_conection), layer=metal_s)  #3.72
        drainMOS_H = transistor.add_ref(drainMOS_H)
        drainMOS_H.movex(firstM1_drain)
        drainMOS_H.movey(w_gate_folding + min_distance_between_m1 - 0.06)   # 0.06 pq me falto un poco y era más facil asi al igual que en el for

        drains = []  # List to store the references
        drainMOS_m1_y = gf.components.rectangle(size=(0.38, min_distance_between_m1), layer=metal_s)   #agregando el bulk del lado izquierdo
        drainNP = fingers_to_drains(nf)  #cantidad de sources que hay al hacer el folding
        for i in range(drainNP):
            drains.append(transistor.add_ref(drainMOS_m1_y))

        for i, drain in enumerate(drains):  # Start from the 1st index
        
            drain.move([0.075 + 0.07  + l_gate  + (2*inter_sd_l + 2*l_gate  )*i, w_gate_folding - 0.06])
    else :
        drainMOS_m1_y = gf.components.rectangle(size=(0.38, 0.64), layer=metal_s) 
        drainMOS_m1_y = transistor.add_ref(drainMOS_m1_y)
        drainMOS_m1_y.move([0.075 + 0.07  + l_gate, w_gate_folding - 0.06])

    
    #poly conect 
    poly_down = gf.components.rectangle(size=((nf-1)*0.42 + nf*0.38 , 0.38), layer="poly2")
    poly_down = transistor.add_ref(poly_down)
    poly_down.movex(0.025)
    poly_down.movey( 0.22 + w_gate_folding)


    #BULK
    # Agregando el bulk left
    bulk_comp_left = gf.components.rectangle(size=(0.37, w_gate_folding), layer="comp")   #agregando el bulk del lado izquierdo 
    bulk_comp_left = transistor.add_ref(bulk_comp_left)
    bulk_comp_left.movex(-3*(0.36 + 0.01))

    bulk_m1_left = gf.components.rectangle(size=(0.36, w_gate_folding - 2*0.08), layer="metal1")   #agregando el bulk del lado izquierdo 
    bulk_m1_left =transistor.add_ref(bulk_m1_left)
    bulk_m1_left.movex(-3*(0.36 + 0.01))
    bulk_m1_left.movey(0.08) 

    bulk_plus_left = gf.components.rectangle(size=(0.59 + 0.27, w_gate_folding + 2*0.23), layer=bulk_plus)   #agregando el bulk del lado derecho   0.87-0.28=0.59
    bulk_plus_left = transistor.add_ref(bulk_plus_left)
    bulk_plus_left.movex(-1.11 - 0.27 - 0.01)
    bulk_plus_left.movey(-0.23)

    ## agregar if de nwell de pmos 
    if typeTransistor== "Pmos" :
        bulk_nwell_left = gf.components.rectangle(size=(0.59 + 0.27, w_gate_folding + 2*0.43), layer="nwell")   
        bulk_nwell_left = transistor.add_ref(bulk_nwell_left)
        bulk_nwell_left.movex(-1.38 - 0.27 - 0.01)
        bulk_nwell_left.movey(-0.43)

    #cantidadda de contactos en la difusion viene dados por W_gate / (0.22 + 0.28)-> 0.22 ancho de contacto y 0.28 ceparacion entre contactos
    refs = []  # List to store the references
    numberContact = int(w_gate_folding / (0.22 + 0.28))
    bulK_contact_left = gf.components.rectangle(size=(0.22, 0.22), layer="contact")   #agregando el bulk del lado izquierdo
    for i in range(numberContact):
        refs.append(transistor.add_ref(bulK_contact_left))

    for i, ref in enumerate(refs):  # Start from the 1st index
        ref.move([ -1*(0.72 + 0.085 + 0.22 + 0.01) , 0.28*i + 0.22*i + 0.14])  # Move the reference   izquierda 

    # Agregando el bulk right
    bulk_comp_right = gf.components.rectangle(size=(0.37, w_gate_folding), layer="comp")   #agregando el bulk del lado derecho
    bulk_comp_right = transistor.add_ref(bulk_comp_right)
    bulk_comp_right.movex(nf*(l_gate + inter_sd_l)+ 0.37)

    bulk_m1_right = gf.components.rectangle(size=(0.36, w_gate_folding - 2*0.08), layer="metal1")   #agregando el bulk del derecho
    bulk_m1_right = transistor.add_ref(bulk_m1_right)
    bulk_m1_right.movex(nf*(l_gate + inter_sd_l) + 0.37)
    bulk_m1_right.movey(0.08)

    bulk_plus_right = gf.components.rectangle(size=(0.59 + 0.27, w_gate_folding + 2*0.23), layer=bulk_plus)   #agregando el bulk del lado derecho   0.87-0.28=0.59
    bulk_plus_right = transistor.add_ref(bulk_plus_right)
    bulk_plus_right.movex(nf*(l_gate + inter_sd_l) + 0.16)
    bulk_plus_right.movey(-0.23)

    if typeTransistor=="Pmos":
        bulk_nwell_right = gf.components.rectangle(size=(0.59 + 0.27, w_gate_folding + 2*0.43), layer="nwell")
        bulk_nwell_right = transistor.add_ref(bulk_nwell_right)
        bulk_nwell_right.movex(nf*(l_gate + inter_sd_l)+ 0.43 )
        bulk_nwell_right.movey(-0.43)

    #contactos lado derecho 
    refs2 = []  # List to store the references
    bulK_contact_right = gf.components.rectangle(size=(0.22, 0.22), layer="contact")   #agregando el bulk del lado izquierdo
    for i in range(numberContact):
        refs2.append(transistor.add_ref(bulK_contact_right))

    for i, ref in enumerate(refs2):  # Start from the 1st index
        ref.move([ nf*(l_gate + inter_sd_l) + 0.445 , 0.28*i + 0.22*i + 0.14])  # Move the reference   izquierda

    # conect BULK and source 
    bulk_m1_left = gf.components.rectangle(size=(0.36 , min_distance_between_m1 +0.02), layer=metal_s)   #agregando el bulk del lado izquierdo
    bulk_m1_left = transistor.add_ref(bulk_m1_left)
    bulk_m1_left.movex(2*DistanceFisrt_metal1_conection - 0.36)
    bulk_m1_left.movey(-min_distance_between_m1 + 0.06)

    bulk_m1_left_conect = gf.components.rectangle(size=(0.375 + 0.36 , 0.38), layer=metal_s)   #agregando el bulk del lado izquierdo
    bulk_m1_left_conect = transistor.add_ref(bulk_m1_left_conect)
    bulk_m1_left_conect.movex(2*DistanceFisrt_metal1_conection - 0.36)
    bulk_m1_left_conect.movey(-1*width_metal1_conection - min_distance_between_m1  + 0.06)

    # el lado derecho tiene 2 opciones dependiendo de si es par o impar
    if nf % 2 == 0:
            Length_horizontal_metal1_conection_bulk =  0.36 + 0.365
            N_b_m1 = nf
    else:
            Length_horizontal_metal1_conection_bulk = 0.07*2 + width_metal1_conection + 0.36 + 0.365 + l_gate
            N_b_m1 = nf -1 

    bulk_m1_right_conect = gf.components.rectangle(size=(Length_horizontal_metal1_conection_bulk , width_metal1_conection), layer=metal_s)   #agregando el bulk del lado izquierdo
    bulk_m1_right_conect = transistor.add_ref(bulk_m1_right_conect)
    bulk_m1_right_conect.movex( DistanceFisrt_metal1_conection + N_b_m1*l_gate + N_b_m1*inter_sd_l + width_metal1_conection )
    bulk_m1_right_conect.movey(-min_distance_between_m1 + 0.06 - width_metal1_conection)

    bulk_m1_right = gf.components.rectangle(size=(0.36 , min_distance_between_m1 +0.02), layer=metal_s)   #agregando el bulk del lado izquierdo
    bulk_m1_right = transistor.add_ref(bulk_m1_right)
    bulk_m1_right.movex(DistanceFisrt_metal1_conection + nf*l_gate + nf*inter_sd_l + width_metal1_conection + 0.365 )
    bulk_m1_right.movey(-min_distance_between_m1 + 0.06)


    return transistor



if __name__ == "__main__":
    c = drawInv(10 , 10 , 6, 3 )
    c.write_gds("prueba.gds")
