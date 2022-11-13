class BattleController < ApplicationController
    def index
      @bagmons = Bagmon.all
  
      # Check if bagmon1 and bagmon2 params are present
  
      # If they are, set @bagmon1 and @bagmon2 to the Bagmon with the id of the params
  
      if (params[:bagmon1] && params[:bagmon2]) 
        @bagmon1 = Bagmon.find(params[:bagmon1])
        @bagmon2 = Bagmon.find(params[:bagmon2])
  
        # Create a list of all rounds that have happened in this battle
  
        @rounds = []
  
        lifeBagmon1 = 100
        lifeBagmon2 = 100
  
        # Random pokemon attack initialization
        bagmonInAttack = rand(1..2) == 1 ? @bagmon1 : @bagmon2
  
        # While both bagmons are alive, keep fighting
        while (lifeBagmon1 > 0 && lifeBagmon2 > 0) do
  
          # Bagmon 1 attack bagmons 2 and remove random between 5 and 10 life points
  
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
  
        # If bagmon 1 is alive, bagmon 1 wins, else bagmon 2 wins
        if (lifeBagmon1 > 0)
          @rounds << @bagmon1.name + " venceu!"
        else
          @rounds << @bagmon2.name + " venceu!"
        end
      end
    end
  end