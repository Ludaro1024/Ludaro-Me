Config = {}
Config.Commandname = "me"
Config.Debug = false
--Config.Permissions = {} -- input nothing if everybody can do the command
Config.ShowTime = 2000 -- in ms
Config.Locale = "en" -- de or en
Config.ESXName = true
Config.Range = 5
Translation = {
        ['de'] = {
            ['nomsg'] = "Du hast keine Nachricht Angegeben, bitte mach /me Wer das liest ist cool!",
            ['said'] = "[%s] said: %s", -- %s first one is player name, second one is the entered text
        },
        ['en'] = {
            ['nomsg'] = "You have not Inputted any message! input it like this: /me i want cookies",
            ['said'] = "[%s] Sagte: %s", -- %s first one is player name, second one is the entered text
        }
}

function notify(msg)
    -- lib.notify({
    --     id = 'some_identifier',
    --     title = '/me Command',
    --     description = msg,
    --     position = 'top',
    --     style = {
    --         backgroundColor = '#141517',
    --         color = '#909296'
    --     },
    --     icon = "mustache",
    --     iconColor = 'white'
    -- })
    ESX.ShowNotification(msg)
    
end
