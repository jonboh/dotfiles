-- WARNING:  This file gets overwritten by the 'flexprompt configure' wizard!
--
-- If you want to make changes, consider copying the file to
-- 'flexprompt_config.lua' and editing that file instead.

flexprompt = flexprompt or {}
flexprompt.settings = flexprompt.settings or {}
flexprompt.settings.frame_color = "dark"
flexprompt.settings.separators = "vertical"
flexprompt.settings.style = "classic"
flexprompt.settings.use_8bit_color = true
flexprompt.settings.left_prompt = "{battery}{histlabel}{cwd}{git}"
flexprompt.settings.charset = "unicode"
flexprompt.settings.tails = "pointed"
flexprompt.settings.lines = "one"
flexprompt.settings.right_frame = "round"
flexprompt.settings.heads = "slant"
flexprompt.settings.right_prompt = "{overtype}{exit}{duration}{time:format=%a %H:%M}"
flexprompt.settings.flow = "concise"
flexprompt.settings.spacing = "normal"
flexprompt.settings.symbols =
{
    prompt =
    {
        ">",
        winterminal = "❯",
    },
}
flexprompt.settings.powerline_font = true
flexprompt.settings.left_frame = "round"
