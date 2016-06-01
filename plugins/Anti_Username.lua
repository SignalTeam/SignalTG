ocal function run(msg, matches)
    if is_owner(msg) then
        return
    end
    local data = load_data(_config.moderation.data)
    if data[tostring(msg.to.id)] then
        if data[tostring(msg.to.id)]['settings'] then
            if data[tostring(msg.to.id)]['settings']['lock_username'] then
                lock_username = data[tostring(msg.to.id)]['settings']['lock_username']
            end
        end
    end
    local chat = get_receiver(msg)
    local user = "user#id"..msg.from.id
    if lock_username == "yes" then
        send_large_msg(chat, 'Username is not allowed here!'
        chat_del_user(chat, user, ok_cb, true)
    end
end
 
return {
  patterns = {
    "@(.*)",
  },
  run = run
}
