main :-
    write('Comecando...'),
   %% Tempo inicial
    statistics(cputime,T1),

    modelo(  [A1, A2, A3, A4,A5]  ),
    imprime_lista(  [A1, A2, A3, A4,A5]  ),

    %% Tempo final
    statistics(cputime ,T2),
    Tempo_BUSCA is T2 - T1,
    format('\n T1: ~f \t T2: ~f  msec', [T1, T2]),
    format('\n Tempo total: ~10f  msec', Tempo_BUSCA),
    fail.

main :-
        nl,
        write('xxxx AQUI SOH PODE VIR UMA RESPOSTA ....'),
        nl,
        write('........ UFA apos o fail .......').

modelo( [ (BARRACA_1,NOME_1,IDADE_1,SANDUICHE_1,EQUIPE_1,ESPORTE_1),
          (BARRACA_2,NOME_2,IDADE_2,SANDUICHE_2,EQUIPE_2,ESPORTE_2),
          (BARRACA_3,NOME_3,IDADE_3,SANDUICHE_3,EQUIPE_3,ESPORTE_3),
          (BARRACA_4,NOME_4,IDADE_4,SANDUICHE_4,EQUIPE_4,ESPORTE_4),
          (BARRACA_5,NOME_5,IDADE_5,SANDUICHE_5,EQUIPE_5,ESPORTE_5)]) :-

%barracas
    barracas(BARRACA_1),
    barracas(BARRACA_2),
    barracas(BARRACA_3),
    barracas(BARRACA_4),
    barracas(BARRACA_5),
    alldifferent([BARRACA_1,BARRACA_2,BARRACA_3,BARRACA_4,BARRACA_5]),

%NOME
    nomes(NOME_1),
    nomes(NOME_2),
    nomes(NOME_3),
    nomes(NOME_4),
    nomes(NOME_5),
    alldifferent([NOME_1,NOME_2,NOME_3,NOME_4,NOME_5]),

    %Breno está em algum lugar à direita da barraca Vermelha.
    (
        (BARRACA_1==vermelha,NOME_2==breno);
        (BARRACA_1==vermelha,NOME_3==breno);
        (BARRACA_1==vermelha,NOME_4==breno);
        (BARRACA_1==vermelha,NOME_5==breno);

        (BARRACA_2==vermelha,NOME_3==breno);
        (BARRACA_2==vermelha,NOME_4==breno);
        (BARRACA_2==vermelha,NOME_5==breno);

        (BARRACA_3==vermelha,NOME_4==breno);
        (BARRACA_3==vermelha,NOME_5==breno);

        (BARRACA_4==vermelha,NOME_5==breno)
    ),
    %A barraca Amarela está em algum lugar à esquerda de Marco.
    (
        (BARRACA_1==amarela,NOME_2==marco);
        (BARRACA_1==amarela,NOME_3==marco);
        (BARRACA_1==amarela,NOME_4==marco);
        (BARRACA_1==amarela,NOME_5==marco);

        (BARRACA_2==amarela,NOME_3==marco);
        (BARRACA_2==amarela,NOME_4==marco);
        (BARRACA_2==amarela,NOME_5==marco);

        (BARRACA_3==amarela,NOME_4==marco);
        (BARRACA_3==amarela,NOME_5==marco);

        (BARRACA_4==amarela,NOME_5==marco)
    ),

%IDADE
    idades(IDADE_1),
    idades(IDADE_2),
    idades(IDADE_3),
    idades(IDADE_4),
    idades(IDADE_5),
    alldifferent([IDADE_1,IDADE_2,IDADE_3,IDADE_4,IDADE_5]),

    %O menino de 9 anos está em algum lugar à direita da barraca Verde.
    (
        (BARRACA_1==verde,IDADE_2==9);
        (BARRACA_1==verde,IDADE_3==9);
        (BARRACA_1==verde,IDADE_4==9);
        (BARRACA_1==verde,IDADE_5==9);

        (BARRACA_2==verde,IDADE_3==9);
        (BARRACA_2==verde,IDADE_4==9);
        (BARRACA_2==verde,IDADE_5==9);

        (BARRACA_3==verde,IDADE_4==9);
        (BARRACA_3==verde,IDADE_5==9);

        (BARRACA_4==verde,IDADE_5==9)
    ),

    %O menino de 10 anos está em algum lugar à direita da barraca Vermelha.
    (
        (BARRACA_1==vermelha,IDADE_2==10);
        (BARRACA_1==vermelha,IDADE_3==10);
        (BARRACA_1==vermelha,IDADE_4==10);
        (BARRACA_1==vermelha,IDADE_5==10);

        (BARRACA_2==vermelha,IDADE_3==10);
        (BARRACA_2==vermelha,IDADE_4==10);
        (BARRACA_2==vermelha,IDADE_5==10);

        (BARRACA_3==vermelha,IDADE_4==10);
        (BARRACA_3==vermelha,IDADE_5==10);

        (BARRACA_4==vermelha,IDADE_5==10)
    ),

    %A barraca Amarela está em algum lugar à esquerda do garoto de 12 anos.
    (
        (IDADE_2==12,BARRACA_1==amarela);
        (IDADE_3==12,BARRACA_1==amarela);
        (IDADE_4==12,BARRACA_1==amarela);
        (IDADE_5==12,BARRACA_1==amarela);

        (IDADE_3==12,BARRACA_2==amarela);
        (IDADE_4==12,BARRACA_2==amarela);
        (IDADE_5==12,BARRACA_2==amarela);

        (IDADE_4==12,BARRACA_3==amarela);
        (IDADE_5==12,BARRACA_3==amarela);

        (IDADE_5==12,BARRACA_4==amarela)
    ),


%SANDUICHE
    sanduiches(SANDUICHE_1),
    sanduiches(SANDUICHE_2),
    sanduiches(SANDUICHE_3),
    sanduiches(SANDUICHE_4),
    sanduiches(SANDUICHE_5),

    alldifferent([SANDUICHE_1,SANDUICHE_2,SANDUICHE_3,SANDUICHE_4,SANDUICHE_5]),

    %O menino que gosta de sanduíche de Salame está ao lado de quem está na barraca Verde.
    (
        (SANDUICHE_1==salame,BARRACA_2==verde);
        (SANDUICHE_2==salame,BARRACA_3==verde);
        (SANDUICHE_3==salame,BARRACA_4==verde);
        (SANDUICHE_4==salame,BARRACA_5==verde);

        (SANDUICHE_5==salame,BARRACA_4==verde);
        (SANDUICHE_4==salame,BARRACA_3==verde);
        (SANDUICHE_3==salame,BARRACA_2==verde);
        (SANDUICHE_2==salame,BARRACA_1==verde)
    ),

    %O garoto da barraca Verde gosta de sanduíche de Atum.
    (
        (BARRACA_1==verde,SANDUICHE_1==atum);
        (BARRACA_2==verde,SANDUICHE_2==atum);
        (BARRACA_3==verde,SANDUICHE_3==atum);
        (BARRACA_4==verde,SANDUICHE_4==atum);
        (BARRACA_5==verde,SANDUICHE_5==atum)
    ),

    %Gabriel está ao lado do menino que gosta de sanduíche de Frango.
    (
        (NOME_1==gabriel,SANDUICHE_2==frango);
        (NOME_2==gabriel,SANDUICHE_3==frango);
        (NOME_3==gabriel,SANDUICHE_4==frango);
        (NOME_4==gabriel,SANDUICHE_5==frango);

        (NOME_2==gabriel,SANDUICHE_1==frango);
        (NOME_3==gabriel,SANDUICHE_2==frango);
        (NOME_4==gabriel,SANDUICHE_3==frango);
        (NOME_5==gabriel,SANDUICHE_4==frango)
    ),

    %Quem gosta de sanduíche de Frago está em algum lugar à direita da barraca Verde.
    (
        (BARRACA_1==verde,SANDUICHE_2==frango);
        (BARRACA_1==verde,SANDUICHE_3==frango);
        (BARRACA_1==verde,SANDUICHE_4==frango);
        (BARRACA_1==verde,SANDUICHE_5==frango);

        (BARRACA_2==verde,SANDUICHE_3==frango);
        (BARRACA_2==verde,SANDUICHE_4==frango);
        (BARRACA_2==verde,SANDUICHE_5==frango);

        (BARRACA_3==verde,SANDUICHE_4==frango);
        (BARRACA_3==verde,SANDUICHE_5==frango);

        (BARRACA_4==verde,SANDUICHE_5==frango)
    ),

    %A barraca Vermelha está em algum lugar entre quem gosta de sanduíche de Presunto e quem tem 12 anos.
    (
        (SANDUICHE_1==presunto,BARRACA_2==vermelha,IDADE_3==12);
        (SANDUICHE_1==presunto,BARRACA_2==vermelha,IDADE_4==12);
        (SANDUICHE_1==presunto,BARRACA_2==vermelha,IDADE_5==12);

        (SANDUICHE_1==presunto,BARRACA_3==vermelha,IDADE_4==12);
        (SANDUICHE_1==presunto,BARRACA_3==vermelha,IDADE_5==12);

        (SANDUICHE_1==presunto,BARRACA_4==vermelha,IDADE_5==12);

        (SANDUICHE_2==presunto,BARRACA_3==vermelha,IDADE_4==12);
        (SANDUICHE_2==presunto,BARRACA_3==vermelha,IDADE_5==12);

        (SANDUICHE_2==presunto,BARRACA_4==vermelha,IDADE_5==12);

        (SANDUICHE_3==presunto,BARRACA_4==vermelha,IDADE_5==12)

        %(IDADE_1==12,BARRACA_2==vermelha,SANDUICHE_3==presunto);
        %(IDADE_1==12,BARRACA_2==vermelha,SANDUICHE_4==presunto);
        %(IDADE_1==12,BARRACA_2==vermelha,SANDUICHE_5==presunto);

        %(IDADE_1==12,BARRACA_3==vermelha,SANDUICHE_4==presunto);
        %(IDADE_1==12,BARRACA_3==vermelha,SANDUICHE_5==presunto);

        %(IDADE_1==12,BARRACA_4==vermelha,SANDUICHE_5==presunto);

        %(IDADE_2==12,BARRACA_3==vermelha,SANDUICHE_4==presunto);
        %(IDADE_2==12,BARRACA_3==vermelha,SANDUICHE_5==presunto);

        %(IDADE_2==12,BARRACA_4==vermelha,SANDUICHE_5==presunto);

        %(IDADE_3==12,BARRACA_4==vermelha,SANDUICHE_5==presunto)

    ),

%EQUIPE
    equipes(EQUIPE_1),
    equipes(EQUIPE_1),
    equipes(EQUIPE_1),
    equipes(EQUIPE_1),
    equipes(EQUIPE_1),
    equipes(EQUIPE_1),
    alldifferent([EQUIPE_1,EQUIPE_2,EQUIPE_3,EQUIPE_4,EQUIPE_5]),

    %O garoto da equipe Tupis está em uma das pontas.
    (
        (EQUIPE_1==tupis);
        (EQUIPE_5==tupis)
    ),
    %O garoto da equipe Rocket está exatamente à esquerda de Rui.
    (
        (EQUIPE_1==rocket,NOME_2==rui);
        (EQUIPE_2==rocket,NOME_3==rui);
        (EQUIPE_3==rocket,NOME_4==rui);
        (EQUIPE_4==rocket,NOME_5==rui)
    ),

    %O menino da equipe Dragão está ao lado de quem gosta de jogar Tênis.
    (
        (EQUIPE_1==dragao,ESPORTE_2==tenis);
        (EQUIPE_2==dragao,ESPORTE_3==tenis);
        (EQUIPE_3==dragao,ESPORTE_4==tenis);
        (EQUIPE_4==dragao,ESPORTE_5==tenis);

        (EQUIPE_5==dragao,ESPORTE_4==tenis);
        (EQUIPE_4==dragao,ESPORTE_3==tenis);
        (EQUIPE_3==dragao,ESPORTE_2==tenis);
        (EQUIPE_2==dragao,ESPORTE_1==tenis)
    ),



%ESPORTE
    esportes(ESPORTE_1),
    esportes(ESPORTE_2),
    esportes(ESPORTE_3),
    esportes(ESPORTE_4),
    esportes(ESPORTE_5),

    alldifferent([ESPORTE_1,ESPORTE_2,ESPORTE_3,ESPORTE_4,ESPORTE_5]),

    %Na primeira barraca está o garoto que gosta de Natação.
    ESPORTE_1=natacao,

%A barraca Vermelha está em algum lugar entre o garoto mais velho e quem gosta de Basquete, nessa ordem.
(
    (IDADE_1==13,BARRACA_2==vermelha,ESPORTE_3==basquete);
    (IDADE_1==13,BARRACA_2==vermelha,ESPORTE_4==basquete);
    (IDADE_1==13,BARRACA_2==vermelha,ESPORTE_5==basquete);

    (IDADE_1==13,BARRACA_3==vermelha,ESPORTE_4==basquete);
    (IDADE_1==13,BARRACA_3==vermelha,ESPORTE_5==basquete);

    (IDADE_1==13,BARRACA_4==vermelha,ESPORTE_5==basquete);

    (IDADE_2==13,BARRACA_3==vermelha,ESPORTE_4==basquete);
    (IDADE_2==13,BARRACA_3==vermelha,ESPORTE_5==basquete);

    (IDADE_2==13,BARRACA_4==vermelha,ESPORTE_5==basquete);

    (IDADE_3==13,BARRACA_4==vermelha,ESPORTE_5==basquete)
),


%O garoto que joga Tênis está exatamente à esquerda de quem está na barraca Verde.

(
    (ESPORTE_1==tenis,BARRACA_2==verde);
    (ESPORTE_2==tenis,BARRACA_3==verde);
    (ESPORTE_3==tenis,BARRACA_4==verde);
    (ESPORTE_4==tenis,BARRACA_5==verde)
),




%A barraca Vermelha está em algum lugar à esquerda de quem gosta de Basquete.
(
    (BARRACA_1==vermelha,ESPORTE_2==basquete);
    (BARRACA_1==vermelha,ESPORTE_3==basquete);
    (BARRACA_1==vermelha,ESPORTE_4==basquete);
    (BARRACA_1==vermelha,ESPORTE_5==basquete);

    (BARRACA_2==vermelha,ESPORTE_3==basquete);
    (BARRACA_2==vermelha,ESPORTE_4==basquete);
    (BARRACA_2==vermelha,ESPORTE_5==basquete);

    (BARRACA_3==vermelha,ESPORTE_4==basquete);
    (BARRACA_3==vermelha,ESPORTE_5==basquete);

    (BARRACA_4==vermelha,ESPORTE_5==basquete)
),

%Quem gosta de Corrida está em algum lugar à direita da barraca Verde.
(
    (BARRACA_1==verde,ESPORTE_2==corrida);
    (BARRACA_1==verde,ESPORTE_3==corrida);
    (BARRACA_1==verde,ESPORTE_4==corrida);
    (BARRACA_1==verde,ESPORTE_5==corrida);

    (BARRACA_2==verde,ESPORTE_3==corrida);
    (BARRACA_2==verde,ESPORTE_4==corrida);
    (BARRACA_2==verde,ESPORTE_5==corrida);

    (BARRACA_3==verde,ESPORTE_4==corrida);
    (BARRACA_3==verde,ESPORTE_5==corrida);

    (BARRACA_4==verde,ESPORTE_5==corrida)
),


%O menino da equipe Dragão está em algum lugar entre a barraca Branca e o garoto que gosta de sanduíche de Salame, nessa ordem.
(
    (BARRACA_1==branca,EQUIPE_2==dragao,SANDUICHE_3==salame);
    (BARRACA_1==branca,EQUIPE_2==dragao,SANDUICHE_4==salame);
    (BARRACA_1==branca,EQUIPE_2==dragao,SANDUICHE_5==salame);

    (BARRACA_1==branca,EQUIPE_3==dragao,SANDUICHE_4==salame);
    (BARRACA_1==branca,EQUIPE_3==dragao,SANDUICHE_5==salame);

    (BARRACA_1==branca,EQUIPE_4==dragao,SANDUICHE_5==salame);

    (BARRACA_2==branca,EQUIPE_3==dragao,SANDUICHE_4==salame);
    (BARRACA_2==branca,EQUIPE_3==dragao,SANDUICHE_5==salame);

    (BARRACA_2==branca,EQUIPE_4==dragao,SANDUICHE_5==salame);

    (BARRACA_3==branca,EQUIPE_4==dragao,SANDUICHE_5==salame)
),

%O menino que gosta de Futebol está ao lado do menino da equipe Ciclanos.
(
    (ESPORTE_1==futebol,EQUIPE_2==ciclanos);
    (ESPORTE_2==futebol,EQUIPE_3==ciclanos);
    (ESPORTE_3==futebol,EQUIPE_4==ciclanos);
    (ESPORTE_4==futebol,EQUIPE_5==ciclanos);

    (ESPORTE_5==futebol,EQUIPE_4==ciclanos);
    (ESPORTE_4==futebol,EQUIPE_3==ciclanos);
    (ESPORTE_3==futebol,EQUIPE_2==ciclanos);
    (ESPORTE_2==futebol,EQUIPE_1==ciclanos)
),



%O garoto da equipe Rocket está exatamente à esquerda de quem gosta de Futebol.
(
    (EQUIPE_1==rocket,ESPORTE_2==futebol);
    (EQUIPE_2==rocket,ESPORTE_3==futebol);
    (EQUIPE_3==rocket,ESPORTE_4==futebol);
    (EQUIPE_4==rocket,ESPORTE_5==futebol)
),

%FIM DO MODELO
nl,
write('FIM DO MODELO').
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%BASE%
barracas(amarela).
barracas(azul).
barracas(branca).
barracas(verde).
barracas(vermelha).

nomes(anderson).
nomes(breno).
nomes(gabriel).
nomes(marco).
nomes(rui).

idades(9).
idades(10).
idades(11).
idades(12).
idades(13).

sanduiches(atum).
sanduiches(frango).
sanduiches(presunto).
sanduiches(queijo).
sanduiches(salame).

equipes(alfafas).
equipes(ciclanos).
equipes(dragao).
equipes(rocket).
equipes(tupis).

esportes(basquete).
esportes(corrida).
esportes(futebol).
esportes(natacao).
esportes(tenis).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
alldifferent([]).
alldifferent([H|T]):- not(member(H,T)),
    alldifferent(T).

imprime_lista([]):- write('\n\n FIM do imprime_lista \n').
imprime_lista([H|T]):-
    write('\n......................................\n'),
    write(H), write(' : '),
    imprime_lista(T).
