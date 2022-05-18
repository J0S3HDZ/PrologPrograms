inicio:- 
	write('###############################'),nl,
	write('## Calculadora de IMC ##'),nl,
	write('- Nombre: '),
	read(Nombre),nl, %%Siempre con comillas ya que es String
	write('- Peso [kg]: '),
	read(Peso),nl,
	write('- Altura [mts]: '),
	read(Altura),nl,
	operacion(Nombre,Peso,Altura).


%% Calculo IMC

operacion(Nombre,Peso,Altura):- 
	B is Altura * Altura,
	Res is Peso / B ,
	clasifica(Nombre,Peso,Altura,Res).

:-dynamic bajo/2.
:-dynamic normal/2.
:-dynamic alto/2.


%% Clasificacion de acuerdo al IMC

clasifica(Nombre,Peso,Altura,Res):-
nl,	(Res < 18.5 -> 
	write('###############################'),nl,
	write('DATOS Y RESULTADOS'),nl,
	write('###############################'),nl,
	write('Nombre: '),write(Nombre),nl,
	write('Peso: '),write(Peso),nl,
	write('Altura: '),write(Altura),nl,
	write('IMC: '),write(Res),nl,
	write('Resultado: BAJO PESO'),nl,
	write('###############################'),
	assert(bajo(Nombre,Res))
	
;Res < 24.9 -> 
	write('###############################'),nl,
	write('DATOS Y RESULTADOS'),nl,
	write('###############################'),nl,
	write('Nombre: '),write(Nombre),nl,
	write('Peso: '),write(Peso),nl,
	write('Altura: '),write(Altura),nl,
	write('IMC: '),write(Res),nl,
	write('Resultado: PESO NORMAL'),nl,
	write('###############################'),
	assert(normal(Nombre,Res))
;Res > 25 -> 
	write('###############################'),nl,
	write('DATOS Y RESULTADOS'),nl,
	write('###############################'),nl,
	write('Nombre: '),write(Nombre),nl,
	write('Peso: '),write(Peso),nl,
	write('Altura: '),write(Altura),nl,
	write('IMC: '),write(Res),nl,
	write('Resultado: OBESIDAD'),nl,
	assert(alto(Nombre,Res))
	
),
reporte().

reporte() :- 
	write('###############################'),nl,
	write('###### IMPRIMIR REPORTE #######'),nl,
	write('###############################'),nl,
	write('1. Personas con bajo peso.'),nl,
	write('2. Personas con peso normal.'),nl,
	write('3. Personas con obesidad.'),nl,
	write('4. Eliminar todos los registros.'),nl,
	write('0. Volver al inicio.'),nl,
	read(Menures),nl,
	selected(Menures).


%% Opciones del menú de imprimir reportes
selected(Menures) :-
nl,
	(Menures == 1 ->
		listing(bajo),
		reporte()
	;Menures == 2 ->
		listing(normal),
		reporte()
	;Menures == 3 ->
		listing(alto),
		reporte()
	;Menures == 4 ->
		retractall(bajo(_,_)),
		retractall(normal(_,_)),
		retractall(alto(_,_)),
		reporte()
	;Menures == 0 ->
		inicio
	 ).
