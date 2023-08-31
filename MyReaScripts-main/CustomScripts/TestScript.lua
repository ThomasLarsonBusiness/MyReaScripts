-- Goal: Get an TrackEnvelope and add a point to it
-- Volume Math: 0 < 2, 1 = 0dB, 2 = 6.02dB, 0 = -150dB, ScaleToEnvelopeMode(1, 10^(value/20))
-- Panning Math: -1 < 1
-- Width Math: 0 < 1

-- Gets the volume envelope from the first track
track = reaper.GetTrack(0, 0);
envelope = reaper.GetTrackEnvelopeByName(track, "Volume");

-- Converts a value from dB to fader-scale value
value = -20; -- In dB
testValue = reaper.ScaleToEnvelopeMode(1, 10^(value/20));

-- Loops 8 times, adding an envelope point every half second
for i=0, 8, 1 do
    reaper.InsertEnvelopePoint(envelope, i * 0.5, testValue, 0, 0, false, true);
end
reaper.Envelope_SortPoints(envelope);