/*
 *	Diretivas de pré-processamento
*/
:- dynamic
    branco/1,
    preto/1,
    cabeca_preta/1,
    bochecha_branca/1,
    grande/1,
    pescoco_longo/1,
    asas_longas/1,
    voo_lento/1,
    bico_reto/1,
    bico_anzol/1,
    pata_membrana/1,
    narinas_tubulares/1,
    assobio_abafado/1,
    assobio_trombeta/1,
    maritimo/1,
    vista_no_verao_canada/1,
    vista_no_inverno_eua/1,
	anseriformes/1,
	anatidae/1,
	procellariiformes/1,
	diomedeidae/1,
	albatroz_laysan/1,
	albatroz_patinegro/1,
	cisne_pequeno/1,
	cisne_trombeteiro/1,
	ganso_do_canada/1.


/*
 *	Shell
*/
header :- 
	write('================================'), nl,
	write('SISTEMA ESPECIALISTA DE PASSAROS'), nl,
	write('================================'), nl.

read_maincolor(X) :-
    write('Cor predominante (branco/preto/outro): '), 
	read(Y),
    (   
    	Y = 'branco' -> assertz(branco(X));
    	Y = 'preto' -> assertz(preto(X));
    	true
    ).

read_headcolor(X) :-
	write('Cor da cabeca (branco/preto/outro): '), 
	read(Y),
    (   
    	Y = 'preto', assertz(cabeca_preta(X));
   		true
    ).

read_cheekcolor(X) :-
    write('Cor da bocheca (branco/preto/outro): '),
    read(Y),
    (
    	Y = 'branco',  assertz(bochecha_branca(X));
    	true
    ).

read_size(X) :-
	write('Tamanho (pequeno/medio/grande): '), 
	read(Y),
    (	
    	Y = 'grande', assertz(grande(X));
    	true
    ).

read_neck_width(X) :-
    write('Comprimento do pescoço (curto, medio, longo): '),
	read(Y),
    (	
    	Y = 'longo',  assertz(pescoco_longo(X));
    	true
    ).

read_wing_width(X) :-
    write('Comprimento da asa (curto, medio, longo): '),
    read(Y),
    (	
    	Y = 'longo', assertz(asas_longas(X));
    	true
    ).

read_fly_velocity(X) :-
    write('Velocidade do voo (lento, medio, rapido): '),
    read(Y),
    (	
    	Y = 'lento', assertz(voo_lento(X));
    	true
    ).

read_beak_type(X) :-
    write('Tipo de bico (reto, anzol, outro): '),
    read(Y),
    (	
    	Y = 'reto',  assertz(bico_reto(X));
        Y = 'anzol',   assertz(bico_anzol(X));
    	true
    ).

read_paw_type(X) :-
    write('Tipo de pata (comum, membrana): '),
    read(Y),
    (	
        Y = 'membrana', assertz(pata_membrana(X));
    	true
    ).

read_nose_type(X) :-
    write('Tipo de narinas (comum, tubulares): '),
    read(Y),
    (	
        Y = 'tubulares', assertz(narinas_tubulares(X));
    	true
    ).

read_singer_type(X) :-
    write('Tipo de canto (abafado, trombeta, outro): '),
    read(Y),
    (	
    	Y = 'abafado', assertz(assobio_abafado(X));
    	Y = 'trombeta', assertz(assobio_trombeta(X));
    	true
    ).

read_habitat(X) :-
    write('Tipo de habitate (maritimo, terrestre, outro)'),
    read(Y),
    (
    	Y = 'maritimo', assertz(maritmo(X));
    	true
    ).

read_migratory(X) :-
    write('Estacao na qual visualizado (verao, outono, inverno, primavera)'),
    read(Y),
    write('Pais em que foi visualizado (eua, canada, outro)'),
    read(Z),
    (
    	Y = 'verao', Z = 'canada',	assertz(vista_no_verao_canada(X));
    	Y = 'primavera', Z = 'eua',  assertz(vista_no_inverno_eua(X));
    	true
    ).

bird :-
	header,
    read_maincolor(ave),
    read_headcolor(ave),
    read_cheekcolor(ave),
    read_size(ave),
    read_neck_width(ave),
    read_wing_width(ave),
    read_fly_velocity(ave),
    read_beak_type(ave),
    read_paw_type(ave),
    read_nose_type(ave),
    read_singer_type(ave),
    read_habitat(ave),
	read_migratory(ave),
    (
    	albatroz_laysan(ave), write('Albatroz - Laysan!');
    	albatroz_patinegro(ave),  write('Albatroz - Patinegro!');
    	cisne_pequeno(ave),  write('Cisne Pequeno!');
    	cisne_trombeteiro(ave),  write('Cisne Trombeteiro!');
    	ganso_do_canada(ave),  write('Ganso do canada!');
    	write('Especime desconhecida!')
    ).
	

/*
 *	Rules
*/

anseriformes(X) :- 
	bico_reto(X), 
	pata_membrana(X).

anatidae(X) :- 
	anseriformes(X), 
	pescoco_longo(X), 
	branco(X), 
	voo_lento(X).

procellariiformes(X) :- 
	narinas_tubulares(X), 
	maritimo(X), 
	bico_anzol(X).

diomedeidae(X) :- 
	procellariiformes(X), 
	grande(X), 
	asas_longas(X).

albatroz_laysan(X) :- 
	diomedeidae(X), 
	branco(X).

albatroz_patinegro(X) :- 
	diomedeidae(X), 
	preto(X).

cisne_pequeno(X) :- 
	anatidae(X), 
	assobio_abafado(X).
	
cisne_trombeteiro(X) :- 
	anatidae(X), 
	assobio_trombeta(X).
	
ganso_do_canada(X) :- 
	anatidae(X), 
	cabeca_preta(X), 
	bochecha_branca(X), 
	(
		vista_no_verao_canada(X);
		vista_no_inverno_eua(X)
	).