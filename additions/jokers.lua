-- define joker atlases
-- atlas 1 - new jokers
SMODS.Atlas{
	key = 'atlas_j1',
	path = 'jokers1.png',
	px = 71,
	py = 95,
	-- 2x is 144 by 190
}

-- Test Jimbo
SMODS.Joker {
    key = "testjimbojoker",
    atlas = 'atlas_j1',
    pos = { x = 0, y = 0 },
    rarity = 1,
    blueprint_compat = true,
    cost = 2,
    discovered = true,
    config = { extra = { mult = 1048576 }, },
    loc_txt = {
        name = "Joker",
        text = {
            "{C:red,s:1.1}+#1#{} Mult",
        },
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

-- Mixed Joker
SMODS.Joker {
    key = "mixed",
    atlas = "atlas_j1",
    pos = { x = 1, y = 0 },
    rarity = 1,
    blueprint_compat = true,
    cost = 3,
    config = { extra = { t_mult = 6, type = 'ers_Mixed Bag' }, },
    loc_txt = {
        name = "Mixed Joker",
        text = {
            "{C:red,s:1.1}+#1#{} Mult if played hand",
            "contains a mixed bag"
        },
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.t_mult, localize(card.ability.extra.type, 'poker_hands') } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
            return {
                mult = card.ability.extra.t_mult
            }
        end
    end
}

-- Bipolar Joker
SMODS.Joker {
    key = "bipolar",
    atlas = "atlas_j1",
    pos = { x = 2, y = 0 },
    blueprint_compat = true,
    rarity = 1,
    cost = 3,
    config = { extra = { t_chips = 30, type = 'ers_Mixed Bag' } },
        loc_txt = {
        name = "Bipolar Joker",
        text = {
            "{C:blue,s:1.1}+#1#{} Chips if played hand",
            "contains a mixed bag"
        },
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.t_chips, localize(card.ability.extra.type, 'poker_hands') } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
            return {
                chips = card.ability.extra.t_chips
            }
        end
    end
}