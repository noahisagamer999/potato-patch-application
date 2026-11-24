SMODS.Back
{
      key = 'pumpncrash',
    atlas = 'placeholders',
    discovered=true,
    pos =
    {
        x=4,
        y=2
    },

    config = 
    {
     dollarsA=0,
     reset=0
    },


    calculate = function(self, back, context)

        if context.money_altered and not context.from_scoring and not context.from_consumeable then

            if (context.initial + context.amount) > 40 then

                back.effect.config.dollarsA = 0
        
                    return

                    ease_dollars((-G.GAME.dollars - context.amount))
                
                    end
                
        end

         if context.from_consumeable then

        if (context.initial + context.amount) > 40 then

                back.effect.config.dollarsA = 0
        
                    return

                    ease_dollars(-G.GAME.dollars )
                
                    end

        end

        if context.final_scoring_step and G.GAME.dollars > 40 then

        G.E_MANAGER:add_event(Event({
        trigger = "after",
        blocking = "false",
        delay=0.2,
        ref_table = "G.GAME",
        ref_value = "dollars",
        ease_to = G.GAME.dollars - G.GAME.dollars,
        func = function()
            back.effect.config.dollarsA=0
            ease_dollars(-G.GAME.dollars)
            return true
        end
        
        

        }))
            
        end
        
    end,

     calc_dollar_bonus = function(self, back)

        back.effect.config.dollarsA = back.effect.config.dollarsA + 1

        return
        back.effect.config.dollarsA
        end
        
}