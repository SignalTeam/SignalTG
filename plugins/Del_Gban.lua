local function run(msg, matches)
if matches[1]:lower() == 'del' then 
      if not is_sudo(msg) then
        return "Only For Sudo!"
      end
if matches[2] == 'gbanlist' then 
local hash = 'gbanned'
        local data_cat = 'gbanlist'
        data[tostring(msg.to.id)][data_cat] = nil
        save_data(_config.moderation.data, data)
send_large_msg(get_receiver(msg), "Global Ban list Cleaned!")
redis:del(hash)
     end
if matches[2] == 'banlist' and is_owner(msg) then
local chat_id = msg.to.id
local hash = 'banned:'..chat_id
        local data_cat = 'banlist'
        data[tostring(msg.to.id)][data_cat] = nil
        save_data(_config.moderation.data, data)
send_large_msg(get_receiver(msg), "Banlist Cleaned!")
redis:del(hash)
end
end
 end

return {
  patterns = {
  "^[!/#]([Dd]el) (.*)$",
  "^([Dd]el) (.*)$"
  },
  run = run
}

