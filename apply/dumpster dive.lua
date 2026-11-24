SMODS.Voucher
{
    key = 'dumpsterdive',
    atlas = 'placeholders',
    discovered=true,
    cost=10,
    pos =
    {
        x=0,
        y=3
    },


    config = 
    {
      cards_discarded=0,
      extra = 
      {
        cash_award=2,
      }
    },

    loc_vars = function(self, info_queue, card)
        return
        {
            vars=
            {
                card.active,
                card.cards_discarded,
                card.cash_award,
            }
        }
    end,
    
    
    redeem = function(self,card)

        card.cards_discarded = 0
        G.GAME.rewardmod = 0
        
    end,

    calculate=function(self, card, context)

       if context.pre_discard then
               
        local repeats = 0

                for i = 1, #G.hand.highlighted do
                
                 card.ability.cards_discarded = card.ability.cards_discarded + 1

                end
            
                  if card.ability.cards_discarded>=5 then
                   
                    repeat
                        -- its done like this to account for edge-cases and for compatibility with other mods (IE. cryptid's card selction limit increasers)
                        card.ability.cards_discarded = card.ability.cards_discarded-5
                        repeats = repeats + 1
                    until card.ability.cards_discarded<=4
                    

                   return
                  {
                     dollars=(card.ability.extra.cash_award +  G.GAME.rewardmod) * repeats,
                  }
                    

                  end
        end

    end,

}

SMODS.Voucher
{
    key = 'marianatrench',
    requires = { 'v_whasdream_dumpsterdive' },
    atlas = 'placeholders',
    discovered=true,
    cost=10,
    pos =
    {
        x=1,
        y=3
    },
    
    redeem = function()

         G.GAME.rewardmod=2
        
    end
}