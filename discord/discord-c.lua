RegisterCommand("discord", function()
    msg("PUT THE DISCORD LINK HERE")
end, false)

function msg(text)
    TriggerEvent("chat:addMessage", {
        color = {255,0,0},
        multiline = true,
        args = {"Me", text}
    })
end