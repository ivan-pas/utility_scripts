# Proxmox Backup Telegram Notifications
This script look at your backup directory if there's a file based on the regex recent more than n seconds, if it's there than send a positive message on a telegram bot, otherwise send a negative message.
## Creating your personal Telegram Bot
Open the telegram app and search for "BotFather"
* write `/newbot`
* write the bot name
* write a username for the bot like "example_bot"
* Take note of the HTTP API token

Search for @RawDataBot, start it and it will tell you your chat ID, take note

## Script Customization
Change the value of the variables at the beginning of the script:
* `dir` the directory where your backup is located
* `time` seconds between the script execution and the start of the backup job
* `chat_id` - the chat ID that you obtain through the procedure described before
* `bot_token` - the HTTP API token that you obtain through the procedure described before

Change also the regex of the find command based on if it's a virtual machine or a container followed by the vm/ct ID:\
\
example for a virtual machine backup\
`find $dir -cmin -$time -name 'vzdump-qemu-100-*.zst | grep . > /dev/null` \
\
example for a container backup\
`find $dir -cmin -$time -name 'vzdump-lxc-100-*.zst' | grep . > /dev/null` \
\
You can also customize the message changing the string between quote in the curl command after "text="

## Execution
Schedule a cronjob with a user that have the permission to read the backup location: \
`crontab -e`\
add the following line to start the script at 9:00 AM changing the script location accordingly:\
`0 9 * * *                       /root/script/PM-VE_backup_ctrl_Telegram_notify.sh`\
\
Don't forget to make the script executable and ensure it has the correct permissions and ownership!