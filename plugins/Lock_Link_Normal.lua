local function run(msg, matches)
    if is_owner(msg) then
        return
    end
    local data = load_data(_config.moderation.data)
    if data[tostring(msg.to.id)] then
        if data[tostring(msg.to.id)]['settings'] then
            if data[tostring(msg.to.id)]['settings']['lock_ads'] then
                lock_ads = data[tostring(msg.to.id)]['settings']['lock_ads']
            end
        end
    end
    local chat = get_receiver(msg)
    local user = "user#id"..msg.from.id
    if lock_ads == "yes" then
        send_large_msg(chat, 'شما تبلیغ کردید و این در گروه ممنوع بود\nشما اخراج می شوید')
        chat_del_user(chat, user, ok_cb, true)
    end
end
 
return {patterns = {
"[Hh]ttps://(.*)",
"[Hh][Tt][Tt][Pp][Ss]://[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/(.*)",
"[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/(.*)/",
"[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/(.*",
"[Hh][Tt][Tt][Pp]://(.*)",
"[Ww][Ww][Ww]:(.*)",
  },
  run = run
}
