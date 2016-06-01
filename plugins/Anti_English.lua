local function run(msg, matches)
    if is_owner(msg) then
        return
    end
    local data = load_data(_config.moderation.data)
    if data[tostring(msg.to.id)] then
        if data[tostring(msg.to.id)]['settings'] then
            if data[tostring(msg.to.id)]['settings']['lock_english'] then
                lock_english = data[tostring(msg.to.id)]['settings']['lock_english']
            end
        end
    end
    local chat = get_receiver(msg)
    local user = "user#id"..msg.from.id
    if lock_fosh == "yes" then
        send_large_msg(chat, 'انگلیسی ممنوع  است و شما انگلیسی گفتید \nشما اخراج می شوید')
        chat_del_user(chat, user, ok_cb, true)
    end
end
 
return {
  patterns = {
"[Aa](.*)",
"[Bb](.*)",
"[Cc](.*)",
"[Dd](.*)",
"[Ee](.*)",
"[Ff](.*)",
"[Gg](.*)",
"[Hh](.*)",
"[Ii](.*)",
"[Jj](.*)",
"[Kk](.*)",
"[Ll](.*)",
"[Mm](.*)",
"[Nn](.*)",
"[Oo](.*)",
"[Pp](.*)",
"[Qq](.*)",
"[Rr](.*)",
"[Ss](.*)",
"[Tt](.*)",
"[Uu](.*)",
"[Vv](.*)",
"[Ww](.*)",
"[Xx](.*)",
"[Yy](.*)",
"[Zz](.*)",
  },
  run = run
}
