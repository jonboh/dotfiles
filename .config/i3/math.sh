scratchpad_cmd="$TERM --class MathScratchpad -e python"

running_cmd=$(ps aux | grep "${scratchpad_cmd}" | wc --lines)
# running_cmd will be 1 when no running scratchpad is running, because
# grep will match itself on ps aux
if [ "${running_cmd}" == "1" ]; then
    $scratchpad_cmd
fi
