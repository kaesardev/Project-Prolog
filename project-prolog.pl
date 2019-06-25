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
	ganso_do_canada/1,
	passaro_desconhecido/1.

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

/*
 *	Shell
*/
header :- 
	write('================================'), nl,
	write('SISTEMA ESPECIALISTA DE PASSAROS'), nl,
	write('================================'), nl.

read_maincolor(X) :-
	write('Cor predominante'), nl,
	write('1. Branco'), nl,
	write('2. Preto'), nl,
	write('3. Outro'), nl,
	write('Digite o numero correspondente: '),
	read(Y),
	(
		Y == 1, assertz(branco(X));
		Y == 2, assertz(preto(X));
		true
	).

read_headcolor(X) :- 
	write('Cor da cabeca'), nl,
	write('1. Branco'), nl,
	write('2. Preto'), nl,
	write('3. Outro'), nl,
	write('Digite o numero correspondente: '),
	read(Y),
	(
		Y == 2, assertz(cabeca_preta(X));
		true
	).

read_cheekcolor(X) :-
	write('Cor da bocheca'), nl,
	write('1. Branco'), nl,
	write('2. Preto'), nl,
	write('3. Outro'), nl,
	write('Digite o numero correspondente: '), 
	read(Y),
	(
		Y == 1, assertz(bochecha_branca(X));
		true
	).

read_size(X) :-
	write('Tamanho do ave'), nl,
	write('1. Pequena'), nl,
	write('2. Mediana'), nl,
	write('3. Grande'), nl,
	write('Digite o numero correspondente: '),
	read(Y),
	(	
		Y == 3, assertz(grande(X));
		true
	).

read_neck_width(X) :-
	write('Comprimento do pescoco'), nl,
	write('1. Curto'), nl,
	write('2. Mediano'), nl,
	write('3. Longo'), nl,
	write('Digite o numero correspondente: '),
	read(Y),
	(
		Y == 3, assertz(pescoco_longo(X));
		true
	).

read_wing_width(X) :-
	write('Comprimento da asa'), nl,
	write('1. Curta'), nl,
	write('2. Mediana'), nl,
	write('3. Longa'), nl,
	write('Digite o numero correspondente: '),
	read(Y),
	(	
		Y == 3, assertz(asas_longas(X));
		true
	).

read_fly_velocity(X) :-
	write('Velocidade do voo'), nl,
	write('1. Lento'), nl,
	write('2. Mediano'), nl,
	write('3. Rapido'), nl,
	write('Digite o numero correspondente: '),
	read(Y),
	(	
		Y == 1, assertz(voo_lento(X));
		true
	).

read_beak_type(X) :-
	write('Tipo de bico'), nl,
	write('1. Reto'), nl,
	write('2. Anzol'), nl,
	write('3. Outro'), nl,
	write('Digite o numero correspondente: '),
	read(Y),
	(	
		Y == 1, assertz(bico_reto(X));
		Y == 2, assertz(bico_anzol(X));
		true
	).

read_paw_type(X) :-
	write('Tipo de pata'), nl,
	write('1. Comum'), nl,
	write('2. Membrana'), nl,
	write('Digite o numero correspondente: '),
	read(Y),
	(	
		Y == 2, assertz(pata_membrana(X));
		true
	).

read_nose_type(X) :-
	write('Tipo de narina'), nl,
	write('1. Comum'), nl,
	write('2. Tubular'), nl,
	write('Digite o numero correspondente: '),
	read(Y),
	(	
		Y == 2, assertz(narinas_tubulares(X));
		true
	).

read_singer_type(X) :-
	write('Tipo de canto'), nl,
	write('1. Abafado'), nl,
	write('2. Trombeta'), nl,
	write('3. Outro'), nl,
	write('Digite o numero correspondente: '),
	read(Y),
	(	
		Y == 1, assertz(assobio_abafado(X));
		Y == 2, assertz(assobio_trombeta(X));
		true
	).

read_habitat(X) :-
	write('Tipo de habitate'), nl,
	write('1. Maritimo'), nl,
	write('2. Terrestre'), nl,
	write('3. Outro'), nl,
	write('Digite o numero correspondente: '),
	read(Y),
	(
		Y == 1, assertz(maritimo(X));
		true
	).

read_migratory(X) :-
	write('Estacao de visualizacao'), nl,
	write('1. Verao'), nl,
	write('2. Outono'), nl,
	write('3. Inverno'), nl,
	write('4. Primavera'), nl,
	write('Digite o numero correspondente: '),
	read(Y), nl,
	write('Pais em que foi visualizado'), nl,
	write('1. EUA'), nl,
	write('2. Canada'), nl,
	write('3. Outro'), nl,
	write('Digite o numero correspondente: '),
	read(Z),
	(
		Y == 1, Z == 2,	assertz(vista_no_verao_canada(X));
		Y == 3, Z == 1, assertz(vista_no_inverno_eua(X));
		true
	).
	
identificar :-
	write('================================'), nl,
	write('MODULO DE IDENTIFICACAO'), nl,
	write('================================'), nl,
	write('Digite um id para o passaro: '), 
	read(Id),
	read_maincolor(Id), nl,
	read_headcolor(Id), nl,
	read_cheekcolor(Id), nl,
	read_size(Id), nl,
	read_neck_width(Id), nl,
	read_wing_width(Id), nl,
	read_fly_velocity(Id), nl,
	read_beak_type(Id), nl,
	read_paw_type(Id), nl,
	read_nose_type(Id), nl,
	read_singer_type(Id), nl,
	read_habitat(Id), nl,
	read_migratory(Id), nl,
	(
		albatroz_laysan(Id), 
		assertz(albatroz_laysan(Id)),
		write('Albatroz - Laysan!'), nl;
		
		albatroz_patinegro(Id),
		assertz(albatroz_patinegro(Id)),
		write('Albatroz - Patinegro!'), nl;
		
		cisne_pequeno(Id),
		assertz(cisne_pequeno(Id)),
		write('Cisne Pequeno!'), nl;
		
		cisne_trombeteiro(Id), 
		assertz(cisne_trombeteiro(Id)),
		write('Cisne Trombeteiro!'), nl;
		
		ganso_do_canada(Id), 
		assertz(ganso_do_canada(Id)),
		write('Ganso do canada!'), nl;
	
		assertz(passaro_desconhecido(Id)),
		write('Especime desconhecida!'), nl
	).
	
listar :-
	write('================================'), nl,
	write('LISTAGEM DE PASSAROS'), nl,
	write('================================'), nl, nl,
	write('Albatroz Laysan: '), nl,
	(
		findall(X, albatroz_laysan(X), Lista1), write(Lista1), nl;
		write('Nenhum passaro identificado!'), nl
	),
	write('Albatroz Patinegro: '), nl,
	(
		findall(X, albatroz_patinegro(X), Lista2), write(Lista2), nl;
		write('Nenhum passaro identificado!'), nl
	),
	write('Cisne Pequeno: '), nl,
	(
		findall(X, cisne_pequeno(X), Lista3), write(Lista3), nl;
		write('Nenhum passaro identificado!'), nl
	),
	write('Cisne Trombeteiro: '), nl,
	(
		findall(X, cisne_trombeteiro(X), Lista4), write(Lista4), nl;
		write('Nenhum passaro identificado!'), nl
	),
	write('Ganso do Canada: '), nl,
	(
		findall(X, ganso_do_canada(X), Lista5), write(Lista5), nl;
		write('Nenhum passaro identificado!'), nl
	),
	write('Especime desconhecida: '), nl,
	(
		findall(X, passaro_desconhecido(X), Lista6), write(Lista6), nl;
		write('Nenhum passaro identificado!'), nl
	).

remover :-
	write('================================'), nl,
	write('REMOCAO DE PASSAROS'), nl,
	write('================================'), nl, nl,
	write('Digite o identificador: '),
	read(Id),
	(
		retract(albatroz_laysan(Id));
		retract(albatroz_patinegro(Id));
		retract(cisne_pequeno(Id));
		retract(cisne_trombeteiro(Id));
		retract(ganso_do_canada(Id));
		retract(passaro_desconhecido(Id));
		write('Passaro nao encontrado!'), nl
	).

menu :-
	header,
	write('1. Identificar passaro '), nl,
	write('2. Listar passaros'), nl,
	write('3. Remover passaros'), nl,
	write('0. Sair'), nl,
	write('Digite a opcao desejada (0~3): '),
	read(Opcao), nl,
	(
		Opcao == 1, identificar, menu;
		Opcao == 2, listar, menu;
		Opcao == 3, remover, menu;
		Opcao == 0, true
	).
