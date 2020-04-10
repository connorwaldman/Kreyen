-- Input 1: clock 1
-- Input 2: clock 2
-- Output 1: sequence 1
-- Output 2: gate 1
-- Output 3: sequence 2
-- Output 4: gate 2

sequence1 = {}
sequence2 = {}
index1 = 0
index2 = 0
s = table.unpack

-- Scales
diatonic = {0, 2, 4, 5, 7, 9, 11, 12, 14, 16, 17, 19, 21, 23}
pent_major = {0, 2, 4, 7, 9, 12, 14, 16, 19, 21}

function init()
    input[1].mode("change", 1.0, 0.1, "rising")
    input[1].change = handleChangeClock1
    input[2].mode("change", 1.0, 0.1, "rising")
    input[2].change = handleChangeClock2
end

function handleChangeClock1(s)
    local step = sequence1[index1 + 1]
    output[1].volts = step / 12.0
    output[1].slew = 0.01
    index1 = ((index1 + 1) % #sequence1)
end

function handleChangeClock2(s)
    local step = sequence2[index2 + 1]
    output[3].volts = step / 12.0
    output[3].slew = 0.01
    index2 = ((index2 + 1) % #sequence2)
end

--            USER FUNCTIONS             --
--         (invoked from druid)          --
-- seq1() will set values for sequence 1 --
-- seq2() will set values for sequence 2 --
-- To load a scale: seq1(s(scale))   --

function seq1(...)
    sequence1 = {...}
    show(sequence1)
    return sequence1
end

function seq2(...)
    sequence2 = {...}
    show(sequence2)
    return sequence2
end

function show(sequence)
    seq = ""
    for i = 1, #sequence do
        seq = seq .. sequence[i] .. " "
    end
    print(seq)
end

--Initialize sequences:
sequence1 = {11, 11, 9, 9, 12, 2, 14, 14, 16, 16, 11, 0, 14, 14}
sequence2 = {19, 18, 16, 14, 11, 9, 7}

-- TEST:
-- seq1(0,1,2,3,4,5)
-- seq1(s(diatonic))
-- handleChangeClock1(1)
-- handleChangeClock1(2)
-- handleChangeClock1(3)
-- handleChangeClock1(4)
-- handleChangeClock1(5)
-- handleChangeClock2(1)
-- handleChangeClock2(2)
-- handleChangeClock2(3)
-- handleChangeClock2(4)
-- handleChangeClock2(5)
