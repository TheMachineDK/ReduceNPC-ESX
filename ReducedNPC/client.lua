-- Declare variables
local pedModels = {} -- table to store the ped models
local maxPeds = 100 -- maximum number of peds to allow

-- Create a function to reduce the number of NPC ped models
function reduceNPCPeds()
  -- Get a list of all the ped models currently spawned on the server
  pedModels = GetGamePool(CPeds)

  -- If the number of ped models is greater than the maximum allowed
  if #pedModels > maxPeds then
    -- Loop through the list of ped models and despawn any excess models
    for i = 1, #pedModels do
      if i > maxPeds then
        -- Despawn the ped model
        DeleteEntity(pedModels[i])
      end
    end
  end
end

-- Run the reduceNPCPeds function every minute
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(60000) -- wait for one minute
    reduceNPCPeds()
  end
end)