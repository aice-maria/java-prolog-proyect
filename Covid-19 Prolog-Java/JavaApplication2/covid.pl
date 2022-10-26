

enfermedad(Paciente, covid_19):-
	sintoma(Paciente, sintomas_graves),
	prueba(Paciente, viral, positiva).
	
enfermedad(Paciente, covid_19) :-
	sintoma(Paciente, sintomas_generales),
	prueba(Paciente, viral, positiva).

sintoma(Paciente, sintomas_generales) :-
	sintoma(Paciente, fiebre),
	sintoma(Paciente, escalofrios),
	sintoma(Paciente, tos),
	sintoma(Paciente, dificultades_respiratorias_generales),
	sintoma(Paciente, fatiga),
	sintoma(Paciente, dolores_musculares),
	sintoma(Paciente, dolor_de_cabeza),
	sintoma(Paciente, perdida_olfato_gusto),
	sintoma(Paciente, dolor_garganta),
	sintoma(Paciente, congestion),
	sintoma(Paciente, nauseas),
	sintoma(Paciente, diarrea).

sintoma(Paciente, sintomas_graves):-
	sintoma(Paciente, dificultades_respiratorias_graves),
	sintoma(Paciente, presion_en_pecho),
	sintoma(Paciente, dolor_en_pecho),
	sintoma(Paciente, confusion),
	sintoma(Paciente, incapacidad_de_despertar),
	sintoma(Paciente, coloracion_azulada_en_labios).

prueba(Paciente, viral, positiva).
prueba(Paciente, viral, negativa).
prueba(Paciente, anticuerpos, positiva).
prueba(Paciente, anticuerpos, negativa).

servicios_medicos_urgentes(Paciente) :-
	sintoma(Paciente, sintomas_graves).
servicios_medicos(Paciente) :-
	sintoma(Paciente, sintomas_generales).

tratamiento(Paciente, sintomas_graves, 'Suministrar antivirales').
tratamiento(Paciente, sintomas_graves, 'Reducir respuesta inmunitaria execiva').
tratamiento(Paciente, sintomas_graves, 'Tratar complicaciones').
tratamiento(Paciente, sintomas_graves, 'Constribuir a la funcion inmunitaria').
tratamiento(Paciente, sintomas_graves, 'Aliviar sintomas').
tratamiento(Paciente, sintomas_graves, 'Mantenerse hidratado, beber agua').

tratamiento(Paciente, sintomas_generales, 'Aislamiento para evitar propagacion').
tratamiento(Paciente, sintomas_generales, 'Monitoreo de sintomas').
tratamiento(Paciente, sintomas_generales, 'Tomar medicamentos para aliviar sintomas, acetaminofeno entre otros').
tratamiento(Paciente, sintomas_generales, 'Mantenerse hidratado, beber agua').
tratamiento(Paciente, sintomas_generales, 'Descansar').

sintoma('Aicenis Castro', dificultades_respiratorias_graves).
sintoma('Aicenis Castro', presion_en_pecho).
sintoma('Aicenis Castro', dolor_en_pecho).
sintoma('Aicenis Castro', confusion).
sintoma('Aicenis Castro', incapacidad_de_despertar).
sintoma('Aicenis Castro', coloracion_azulada_en_labios).
prueba('Aicenis Castro', viral, positiva).


tratamiento_paciente_gv(X,L) :- 
	findall(P, tratamiento(X, sintomas_graves, P), LS), X=Paciente, setof(Pers,member(Pers,LS),L).

tratamiento_paciente_gen(X,L) 
	:- findall(P, tratamiento(X, sintomas_generales, P), LS), X=Paciente, setof(Pers,member(Pers,LS),L).

paciente_covid(X,L):- 
	findall(X,enfermedad((X),covid_19),LS), X=Paciente, setof(Pers,member(Pers,LS),L).

paciente_otra_enfermedad(X,L):- 
	findall(X,prueba((X),viral, negativa),LS), X=Paciente, setof(Pers,member(Pers,LS),L).


sintoma('Osvaldo Zaragoza','fiebre').
sintoma('Osvaldo Zaragoza','escalofrios').
sintoma('Osvaldo Zaragoza','tos').
sintoma('Osvaldo Zaragoza','dificultades_respiratorias_generales').
sintoma('Osvaldo Zaragoza','dolor_garganta').
sintoma('Osvaldo Zaragoza','congestion').
sintoma('Osvaldo Zaragoza','nauseas').
sintoma('Osvaldo Zaragoza','fatiga').
sintoma('Osvaldo Zaragoza','dolores_musculares').
sintoma('Osvaldo Zaragoza','dolor_de_cabeza').
sintoma('Osvaldo Zaragoza','diarrea').
sintoma('Osvaldo Zaragoza','perdida_olfato_gusto').
prueba('Osvaldo Zaragoza','viral','positiva').
sintoma('Carlos Gracia','perdida_olfato_gusto').
sintoma('Carlos Gracia','dolor_en_pecho').
prueba('Carlos Gracia','viral','negativa').
sintoma('Yoana Leon','fiebre').
sintoma('Yoana Leon','escalofrios').
sintoma('Yoana Leon','tos').
sintoma('Yoana Leon','dificultades_respiratorias_generales').
sintoma('Yoana Leon','dolor_garganta').
sintoma('Yoana Leon','dolores_musculares').
sintoma('Yoana Leon','perdida_olfato_gusto').
sintoma('Yoana Leon','dolor_en_pecho').
prueba('Yoana Leon','viral','positiva').
sintoma('Ana Laura Lara','presion_en_pecho').
sintoma('Ana Laura Lara','dolor_en_pecho').
sintoma('Ana Laura Lara','confusion').
sintoma('Ana Laura Lara','incapacidad_de_despertar').
sintoma('Ana Laura Lara','dificultades_respiratorias_graves').
sintoma('Ana Laura Lara','coloracion_azulada_en_labios').
prueba('Ana Laura Lara','viral','positiva').
sintoma('Adrisan LALSLAL','fiebre').
sintoma('Adrisan LALSLAL','escalofrios').
sintoma('Adrisan LALSLAL','tos').
sintoma('Adrisan LALSLAL','dificultades_respiratorias_generales').
sintoma('Adrisan LALSLAL','dolor_garganta').
sintoma('Adrisan LALSLAL','congestion').
sintoma('Adrisan LALSLAL','nauseas').
sintoma('Adrisan LALSLAL','fatiga').
sintoma('Adrisan LALSLAL','dolores_musculares').
sintoma('Adrisan LALSLAL','dolor_de_cabeza').
sintoma('Adrisan LALSLAL','diarrea').
sintoma('Adrisan LALSLAL','perdida_olfato_gusto').
prueba('Adrisan LALSLAL','viral','positiva').
