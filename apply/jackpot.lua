SMODS.Joker
{
    key = 'jackpot',
    atlas = 'placeholders',
    discovered=true,
    checkhand=0,
    pos =
    {
        x=0,
        y=0
    },
    config = 
    {
        extra = 
        {
            xmult=2.77,
        }
    },
    rarity=1,
    cost=4,
    blueprint_compat=true,
    loc_vars = function(self, info_queue, card)
        return
        {
            vars=
            {
                card.ability.extra.xmult
            }
        }

    end,

    calculate = function(self,card,context)

        if context.joker_main and context.scoring_name == "Three of a Kind" and #context.full_hand == 3 then


            for _, playing_card in ipairs(context.scoring_hand) do

                 if playing_card:get_id() == 7 then

                    self.handchecked=1
                
                end

            end
    

            if self.handchecked==1 then
            return
            {
            xmult=card.ability.extra.xmult
            }
           end
        
         end
         
         if context.after or context.before then
            self.checkhand=0
         end
    end


}