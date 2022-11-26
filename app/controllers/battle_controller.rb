class BattleController < ApplicationController
    def index
      @bagmons = Bagmon.all

      if (params[:bagmon1] && params[:bagmon2])

        # Pega os parametros dos bagmons
        @bagmon1 = Bagmon.find(params[:bagmon1])
        @bagmon2 = Bagmon.find(params[:bagmon2])

        # Criação das variáveis
        @rodada1 = []
        @rodada2 = []
        @vencedor = ''
        @vencedorImg = ''
        vidaBagmon1 = 100
        vidaBagmon2 = 100
        quemAtaca = rand(1..2) == 1 ? @bagmon1 : @bagmon2

        # Batalha

        while (vidaBagmon1 > 0 && vidaBagmon2 > 0) do 
  
          if (quemAtaca == @bagmon1)
            valorAtaque = rand(5..10)
            vidaBagmon2 -= valorAtaque
            @rodada1 << "#{@bagmon1.name} atacou o #{@bagmon2.name} com #{valorAtaque} de dano. Restam #{vidaBagmon2} de vida."
            quemAtaca = @bagmon2
          else
            valorAtaque = rand(5..10)
            vidaBagmon1 -= valorAtaque
            @rodada2 << "#{@bagmon2.name} atacou o #{@bagmon1.name} com #{valorAtaque} de dano. Restam #{vidaBagmon1} de vida."
            quemAtaca = @bagmon1
          end
        end

        #Armazena quem chega primeiro a vida 0 e declara vencedor

        if (vidaBagmon1 > 0)
          @vencedor << @bagmon1.name
          @vencedorImg << @bagmon1.image
        else
          @vencedor << @bagmon2.name
          @vencedorImg << @bagmon2.image 
        end
      end
    end
  end