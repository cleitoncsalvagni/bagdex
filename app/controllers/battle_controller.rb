class BattleController < ApplicationController
    def index
      @bagmons = Bagmon.all
  
      if (params[:bagmon1] && params[:bagmon2]) 
        @bagmon1 = Bagmon.find(params[:bagmon1])
        @bagmon2 = Bagmon.find(params[:bagmon2])
  
        @rounds = []
        @winnerName = ''
        @winnerImg = ''
  
        lifeBagmon1 = 100
        lifeBagmon2 = 100
        bagmonInAttack = rand(1..2) == 1 ? @bagmon1 : @bagmon2

        while (lifeBagmon1 > 0 && lifeBagmon2 > 0) do 
  
          if (bagmonInAttack == @bagmon1)
            attackValue = rand(5..10)
            lifeBagmon2 -= attackValue
            @rounds << @bagmon1.name + " atacou " + @bagmon2.name + " e tirou " + attackValue.to_s + " pontos de vida. " + @bagmon2.name + " agora tem " + lifeBagmon2.to_s + " pontos de vida."
            bagmonInAttack = @bagmon2
          else
            attackValue = rand(5..10)
            lifeBagmon1 -= attackValue
            @rounds << @bagmon2.name + " atacou " + @bagmon1.name + " e tirou " + attackValue.to_s + " pontos de vida. " + @bagmon1.name + " agora tem " + lifeBagmon1.to_s + " pontos de vida."
            bagmonInAttack = @bagmon1
          end
        end

        if (lifeBagmon1 > 0)
          @winnerName << @bagmon1.name
          @winnerImg << @bagmon1.image
        else
          @winnerName << @bagmon2.name
          @winnerImg << @bagmon2.image
        end
      end
    end
  end