--[[
    * Script Name: SelectTracksOfMatchingColorOfSelected.lua
    * About: Selects all of the tracks with the same color as a currently selected track
    * Instructions: Select a track. Run the Script. Will not run if no track is selected
    * Author: TJ Larson
--]]


-- Main Function
function Main()
    -- Gets the First Selected Track
    first_track = reaper.GetSelectedTrack(0, 0);

    -- If the track exists, Continue
    if first_track ~= nil then
        -- Gets the selected tracks color
        first_track_color = reaper.GetTrackColor(first_track);

        -- Loop through all tracks and compare track color
        track_count = reaper.CountTracks(0);
        for i = 0, track_count - 1, 1 do
            cur_track = reaper.GetTrack(0, i);
            cur_track_color = reaper.GetTrackColor(cur_track);

            if cur_track_color == first_track_color then
                reaper.SetTrackSelected(cur_track, true);
            end
        end
    else
        reaper.ShowConsoleMsg("Please Select a Track \n");
    end

end

Main();