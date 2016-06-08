local function run(msg, matches)
local url , res = http.request('http://api.gpmod.ir/time/')
local jdat = json:decode(url)
local url = "http://latex.codecogs.com/png.download?".."\\dpi{500}%10\\LARGE%75"..jdat.ENtime
local file = download_to_file(url,'signal.webp')
send_document(get_receiver(msg) , file, ok_cb, false)
end
 
return {
  patterns = {
    "^[!/#][Tt][Ii][Mm][Ee]$"
  }, 
  run = run 
}
