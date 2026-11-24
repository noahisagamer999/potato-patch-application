SMODS.Joker
{
    key = 'watchitburn',
    atlas = 'placeholders',
    discovered=true,
    alreadycalced=0,
    pos =
    {
        x=2,
        y=0
    },
    config = 
    {
        extra = 
        {
            xmult=1,
            scalar=1,
            dollars=4
        }
    },
    rarity=3,
    cost=8,
    blueprint_compat=true,
    loc_vars = function(self, info_queue, card)
        return
        {
            vars=
            {
                card.ability.extra.xmult,
                card.ability.extra.dollars,
            }
        }

    end,

    
    

    calculate=function(self, card, context)

        if context.ante_end and not context.blueprint then
            self.alreadycalced=0
        end
        
        if context.setting_blind and not context.blueprint and G.GAME.blind:is_type('Boss') then
            
            local oldjokers = 0

            if self.alreadycalced==0 then

                 for i = 1, #G.jokers.cards do

                if G.jokers.cards[i] ~= card and not SMODS.is_eternal(G.jokers.cards[i], card) then
                
                SMODS.destroy_cards(G.jokers.cards[i])
                oldjokers = oldjokers + 1

                end
                self.alreadycalced=oldjokers
            end

               if self.alreadycalced~=0 then

                oldjokers=self.alreadycalced

               end

            end

            if self.alreadycalced==0 then

                  SMODS.scale_card(card,
            {ref_table = card.ability.extra,
            ref_value = "xmult",
            scalar_factor = oldjokers,
            scalar_value = "scalar",
            
            message_colour = G.C.XMULT})

            end

            if self.alreadycalced~=0 then

                  SMODS.scale_card(card,
            {ref_table = card.ability.extra,
            ref_value = "xmult",
            scalar_factor = self.alreadycalced,
            scalar_value = "scalar",
            
            message_colour = G.C.XMULT})

            end

    
            if self.alreadycalced==0 then

                return
            {
                dollars=card.ability.extra.dollars * oldjokers
            }

            end

              if self.alreadycalced~=0 then
                return
                {
                dollars=card.ability.extra.dollars * self.alreadycalced
                }
                
               end
        
            

        end

        if context.joker_main then
            return
            {
               xmult=card.ability.extra.xmult,
            }
        end
        
    end
}