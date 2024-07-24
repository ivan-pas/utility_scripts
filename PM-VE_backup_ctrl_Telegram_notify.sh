#!/bin/bash

dir=<YOUR-BACKUP-LOCATION>
time=300 #seconds between the script execution and the start of the backup job
chat_id=<YOUR-CHAT-ID>
bot_token=<YOUR-BOT-TOKEN>

find $dir -cmin -$time -name 'vzdump-qemu-100-*.zst' | grep . > /dev/null

if [ $? == 0 ]
        then
                curl -s -X POST https://api.telegram.org/$bot_token/sendMessage -d chat_id=$chat_id -d text="✅Backup VM HomeAssistant OK✅" &> /dev/null
        else
                curl -s -X POST https://api.telegram.org/$bot_token/sendMessage -d chat_id=$chat_id -d text="⚠[WARNING]⚠ Backup VM HomeAssistant ❌FAILED!❌" &> /dev/null

fi                                      