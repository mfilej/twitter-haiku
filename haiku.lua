haiku = haiku or {}
local p = tex.sprint

function haiku.parse(tweet)
  p(tweet)
end

function haiku.author(str)
  _, _, name = string.find(str, "^([%a%d_]+)")
  p(name)
end