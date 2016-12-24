do

local function kick_user(user_id, chat_id)
  local chat = 'channel#id'..chat_id
  local user = 'user#id'..user_id
  channel_kick_user(chat, user, function (data, success, result)
    if success ~= 1 then
      send_msg(data.chat, 'Error while kicking user', ok_cb, nil)
    end
  end, {chat=chat, user=user})
end

local function run (msg, matches)
  local user = msg.from.id
  local chat = msg.to.id

  if msg.to.type ~= 'channel' then
    return "Not A Chat 〰"
  elseif user == tostring(our_id) then
    return "i Cant Yourself"
  else
    kick_user(user, chat)
  end
end

return {
  description = "Bot kicks user",
  usage = {
    "!kickme Kicks The Sender"
  },
  patterns = {
    "^[!/#]kickme$"
  },
  run = run
}
