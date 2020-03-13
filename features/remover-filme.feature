#language:pt

@login
Funcionalidade: Remover filme
    Para que eu possa manter o catálago atualizado
    Sendo um gestor de catálago que encontrou um título cancelado/indesejado/que não tem uma boa aceitação pelo público
    Posso remover este item

    
    Cenario: Confirmar exclusão

        Dado que "dbz" está catálago
        Quando eu solicito a exclusão
        E eu confirmo a solicitação
        Então este item deve ser removido do catálago

    @rm_movie
    Cenario: Cancelar exclusão

        Dado que "10_coisas" está catálago
        Quando eu solicito a exclusão
        Mas cancelo a solicitação
        Então este item deve permanecer no catálago