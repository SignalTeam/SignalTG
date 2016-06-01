kicktable = {}


local function run(msg, matches)
    if is_momod(msg) then
        return msg
    end
    local data = load_data(_config.moderation.data)
    if data[tostring(msg.to.id)] then
        if data[tostring(msg.to.id)]['settings'] then
            if data[tostring(msg.to.id)]['settings']['lock_voice'] then
                lock_voice = data[tostring(msg.to.id)]['settings']['lock_voice']
            end
        end
    end
    local chat = get_receiver(msg)
    local user = "user#id"..msg.from.id
    if lock_voice == "yes" then
        send_large_msg(get_receiver(msg), "User @" .. msg.from.username .. " Send voice is not allowed here!")
        chat_del_user(chat, user, ok_cb, true)
    end
end
 
return {
  patterns = {
  "%[(audio)%]"
 },
  run = run
}
