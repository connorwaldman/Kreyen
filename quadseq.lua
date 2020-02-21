unpack = table.unpack

sequence1 = {}
sequence2 = {}
index1 = 0
index2 = 0

-- Scales
diatonic = {0,2,4,5,7,9,11,12,14,16,17,19,21,23}
pent_major = {0,2,4,7,9,12,14,16,19,21}
   
function init()
    input[1].mode("change", 1.0, 0.1, "rising")
    input[1].change = handleChangeClock1
    input[2].mode("change", 1.0, 0.1, "rising")
    input[2].change = handleChangeClock2
end

function handleChangeClock1(s)
    local step = sequence1[index1 + 1]
    -- output[1].volts = step.note
    -- output[1].slew = 0.0
    index1 = ((index1 + 1) % #sequence1)
    print(step)
end

function handleChangeClock2(s)
    local step = sequence2[index2 + 1]
    -- output[1].volts = step.note
    -- output[1].slew = 0.0
    index2 = ((index2 + 1) % #sequence2)
    print(step)
end

-- user functions invoked from druid --

-- To load scale: seq(unpack(scale))
function seq1(...)
    sequence1 = {...}
    show(sequence1)
    return sequence1
end

function seq2(...)
    sequence2 = {...}
    show(sequence2)
    return sequence1
end

function show(sequence)
    seq = ""
    for i = 1, #sequence do
        seq = seq .. sequence[i] .. " "
    end
    print(seq)
end

-- Test
-- sequence1 = {1,2,3,4,5}
-- sequence2 = {100,200,300,400,500}
seq1(unpack(pent_major))
seq2(unpack(diatonic))

handleChangeClock1(1)
handleChangeClock1(2)
handleChangeClock1(3)
handleChangeClock1(4)
handleChangeClock1(5)
handleChangeClock2(1)
handleChangeClock2(2)
handleChangeClock2(3)
handleChangeClock2(4)
handleChangeClock2(5)