-- define planet atlases
-- atlas 1 - new planets
SMODS.Atlas{
	key = 'atlas_p1',
	path = 'planets1.png',
	px = 71,
	py = 95,
	-- 2x is 144 by 190
}

-- Asteroid Belt
SMODS.Consumable {
    key = "ers_asteroid_belt",
    atlas = "atlas_p1",
    set = "Planet",
    cost = 3,
    pos = { x = 0, y = 0 },
    config = { hand_type = 'ers_Mixed Bag' },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
    end
}