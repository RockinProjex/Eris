-- Mixed Bag
SMODS.PokerHand {
    key = "ers_Mixed Bag",
    mult = 1.5,
    chips = 7.5,
    l_mult = 1,
    l_chips = 12.5,
    example = {
        { 'C_4', true },
        { 'D_2', true },
        { 'D_9', true },
        { 'C_5', true },
        { 'D_3', true }
    },
    evaluate = function(parts, hand)
        return #hand >= 5 and { hand } or {}
    end
}