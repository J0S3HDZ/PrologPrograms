inicio:- 
write('## Calculadora de IMC ##'),nl,
write('- Nombre: '),
read_line_to_string(user_input,Nombre),nl,
write('- Peso [kg]: '),
read(Peso),nl,
write('- Altura [mts]: '),
read(Altura),nl,
operacion(Nombre,Peso,Altura).

operacion(Nombre,Peso,Altura):- 
B is Altura * Altura,
A is Peso / B ,
clasifica(Nombre,Peso,Altura,A).

clasifica(Nombre,Peso,Altura,A):-
nl,	(A < 18.5 -> 
	write('###############################'),nl,
	write('DATOS Y RESULTADOS'),nl,
	write('###############################'),nl,
	write('Nombre: '),write(Nombre),nl,
	write('Peso: '),write(Peso),nl,
	write('Altura: '),write(Altura),nl,
	write('IMC: '),write(A),nl,
	write('Resultado: BAJO PESO'),nl,
	write('###############################')

;A < 24.9 -> 
	write('###############################'),nl,
	write('DATOS Y RESULTADOS'),nl,
	write('###############################'),nl,
	write('Nombre: '),write(Nombre),nl,
	write('Peso: '),write(Peso),nl,
	write('Altura: '),write(Altura),nl,
	write('IMC: '),write(A),nl,
	write('Resultado: PESO NORMAL'),nl,
	write('###############################')


;A > 25 -> 
	write('###############################'),nl,
	write('DATOS Y RESULTADOS'),nl,
	write('###############################'),nl,
	write('Nombre: '),write(Nombre),nl,
	write('Peso: '),write(Peso),nl,
	write('Altura: '),write(Altura),nl,
	write('IMC: '),write(A),nl,
	write('Resultado: OBESIDAD'),nl,
	write('###############################')
).
