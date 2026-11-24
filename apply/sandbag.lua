SMODS.Joker
{
    key = 'sandbagging',
    atlas = 'placeholders',
    discovered=true,
    pos =
    {
        x=1,
        y=0
    },
    config = 
    {
        extra = 
        {
            
        }
    },
    rarity=2,
    cost=6,
    blueprint_compat=true,
    loc_vars = function(self, info_queue, card)
        return
        {
            vars=
            {
            
            }
        }

    end,

    calculate = function(self,card,context)

        if context.setting_blind and G.GAME.round_resets.hands <= 1 and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit or (context.setting_blind and G.GAME.blind.name == 'The Needle' and self.needlechecked==0 and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit) then 
            
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            
         G.E_MANAGER:add_event(Event({
        trigger = "after",
        blocking = "false",
        func = function()
             SMODS.add_card 
             {
                set = 'Spectral', 
             }
              G.GAME.consumeable_buffer=0

            return true
        end
    
        }))
        
        return 
        {
         message = localize('k_plus_spectral'),
         colour = G.C.SECONDARY_SET.Spectral
        }

        end

        if context.before and G.GAME.current_round.hands_left == 1 and G.GAME.chips <= (G.GAME.blind.chips * 0.1) and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then

             G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            
         G.E_MANAGER:add_event(Event({
        trigger = "after",
        blocking = "false",
        func = function()
             SMODS.add_card 
             {
                set = 'Spectral', 
             }
              G.GAME.consumeable_buffer=0

            return true
        end
    
        }))

        return 
        {
         message = localize('k_plus_spectral'),
         colour = G.C.SECONDARY_SET.Spectral
        }
    end
end


}

--and G.GAME.current_round.hands_left == 1 and G.GAME.chips <= (G.GAME.blind.chips * 0.1) 