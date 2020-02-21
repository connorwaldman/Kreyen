unpack = table.unpack

sequence1 = {}
sequence2 = {}
index = 0

-- Scales
diatonic = {0,2,4,5,7,9,11,12,14,16,17,19,21,23}
pent_major = {0,2,4,7,9,12,14,16,19,21}
   
function init()
    input[1].mode("change", 1.0, 0.1, "rising")
    input[1].change = handleChangeClock1
    input[2].mode("change", 1.0, 0.1, "rising")
    input[2].change = handleChangeClock2
    output[1].slew = step.slew
end

function handleChangeClock1(s)
    local step = sequence1[index + 1]
    -- output[1].volts = step
    -- print(output[1].volts)
    index = ((index + 1) % #sequence1)
    print(step)
end

-- function handleChangeClock2(s)
--     local step = sequence2[index + 1]
--     output[2].slew = step.slew
--     output[2].volts = step.note
--     print(output[2].volts)
--     index = ((index + 1) % #sequence)
-- end

-- user functions invoked from druid --

-- To load scale: seq(unpack(scale))
function seq1(...)
    sequence1 = {...}
    n = unpack(sequence1)
    show(sequence1)
    return n
end

-- function seq2(...)
--     sequence2 = {...}
--     show(sequence2)
--     return sequence2
-- end

function show(sequence)
    seq = ""
    for i = 1, #sequence do
        seq = seq .. sequence[i] .. " "
    end
    print(seq)
end

-- seq1(unpack(pent_major))
sequence1 = {1,2,3,4,5}
handleChangeClock1(1)
handleChangeClock1(2)
handleChangeClock1(3)
handleChangeClock1(4)
handleChangeClock1(5)
handleChangeClock1(6)
handleChangeClock1(7)
handleChangeClock1(8)
handleChangeClock1(9)
handleChangeClock1(10)