do
local function action_by_reply22(extra, success, result)
if result.media then


return  send_msg(extra.receiver, 'متن عکس:\n'.. result.media.caption, ok_cb, true)
end
if result.service then
return  send_msg(extra.receiver, result.service.type, ok_cb, true)
end
end
local function run(msg, matches)
if msg.to.type == 'chat' or msg.to.type == 'channel' then

local receiver = get_receiver(msg) 
   if msg.reply_id then

  msgr = get_message(msg.reply_id, action_by_reply22, {receiver=receiver})
return 

end
end
end


return {
  patterns = {
	"^[!/#]cap$",
  }, 
  run = run
}
end
