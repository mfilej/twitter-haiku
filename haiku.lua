haiku = haiku or {}
local p = tex.sprint

function haiku.parse(tweet)
  p("MWA* " .. tweet .. " *MWA")
end

function haiku.author(str)
  _, _, name = string.find(str, "^(%a+)")
  p(name)
end