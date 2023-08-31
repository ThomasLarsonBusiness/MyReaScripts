-- Goal: To Create A Render Region Matrix, assuming one media item per track

-- Gets the number of tracks in the project
reaper.SelectAllMediaItems(0, true);
itemCount = reaper.CountSelectedMediaItems(0);

-- For loop to run through each track
for i=0, itemCount - 1, 1 do
    -- Gets the media item
    item = reaper.GetSelectedMediaItem(0, i);

    -- Gets all necessary media item values
    itemStartPos = reaper.GetMediaItemInfo_Value(item, "D_POSITION"); -- Start position
    itemLength = reaper.GetMediaItemInfo_Value(item, "D_LENGTH"); -- Length
    itemTrack = reaper.GetMediaItem_Track(item); -- Track
    take = reaper.GetActiveTake(item); -- Active Take Name

    -- Create a region using the start pos and length
    reaper.AddProjectMarker(0, true, itemStartPos, itemStartPos + itemLength, reaper.GetTakeName(take), 0);

    -- Adds the region to the region render matrix
    reaper.SetRegionRenderMatrix(0, i, itemTrack, 1);
end