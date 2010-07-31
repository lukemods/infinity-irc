::::::::::::::::::::::::::::::::::::::::::
:: Infinity IRC Network Operator Script ::
:: Concept by Zetacon                   ::
:: Owned by: Infinity IRC and staff     ::
:: Main Contributor: Danneh             ::
:: Contributors: Luke                   ::
::::::::::::::::::::::::::::::::::::::::::

on *:LOAD:*: {
  inf.var.setup
}

alias inf.var.setup {
  echo -at Setting up Operscript
  ; ----Ban Vars----
  set %Infinity-IRC.appealurl.attitude To appeal, please visit: http://www.infinityirc.com/irc/bans?bannedby= $+ $me $+ &nick= $+ $$1 $+ &reason= $+ $replacecs(%Infinity-IRC.g.attitude,$chr(32),$chr(43)) $+ &time= $+ $! $+ &blacklist=Unknown
  set %Infinity-IRC.appealurl.hatespeech To appeal, please visit: http://www.infinityirc.com/irc/bans?bannedby= $+ $me $+ &nick= $+ $$1 $+ &reason= $+ $replacecs(%Infinity-IRC.g.hatespeech,$chr(32),$chr(43)) $+ &time= $+ $$2 $+ &blacklist=Unknown
  set %Infinity-IRC.appealurl.harassment To appeal, please visit: http://www.infinityirc.com/irc/bans?bannedby= $+ $me $+ &nick= $+ $$1 $+ &reason= $+ $replacecs(%Infinity-IRC.g.harassment,$chr(32),$chr(43)) $+ &time= $+ $$2 $+ &blacklist=Unknown
  set %Infinity-IRC.appealurl.botnet To appeal, please visit: http://www.infinityirc.com/irc/bans?bannedby= $+ $me $+ &nick= $+ $$1 $+ &reason= $+ $replacecs(%Infinity-IRC.g.botnet,$chr(32),$chr(43)) $+ &time= $+ $$2 $+ &blacklist=Unknown
  set %Infinity-IRC.appealurl.disobeying To appeal, please visit: http://www.infinityirc.com/irc/bans?bannedby= $+ $me $+ &nick= $+ $$1 $+ &reason= $+ $replacecs(%Infinity-IRC.g.disobeying,$chr(32),$chr(43)) $+ &time= $+ $$2 $+ &blacklist=Unknown
  set %Infinity-IRC.appealurl.msgsnoperm To appeal, please visit: http://www.infinityirc.com/irc/bans?bannedby= $+ $me $+ &nick= $+ $$1 $+ &reason= $+ $replacecs(%Infinity-IRC.g.msgsnoperm,$chr(32),$chr(43)) $+ &time= $+ $$2 $+ &blacklist=Unknown
  set %Infinity-IRC.appealurl.malware To appeal, please visit: http://www.infinityirc.com/irc/bans?bannedby= $+ $me $+ &nick= $+ $$1 $+ &reason= $+ $replacecs(%Infinity-IRC.g.malware,$chr(32),$chr(43)) $+ &time= $+ $$2 $+ &blacklist=Unknown
  set %Infinity-IRC.appealurl.hack To appeal, please visit: http://www.infinityirc.com/irc/bans?bannedby= $+ $me $+ &nick= $+ $$1 $+ &reason= $+ $replacecs(%Infinity-IRC.g.hack,$chr(32),$chr(43)) $+ &time= $+ $$2 $+ &blacklist=Unknown
  set %Infinity-IRC.appealurl.inappronicks To appeal, please visit: http://www.infinityirc.com/irc/bans?bannedby= $+ $me $+ &nick= $+ $$1 $+ &reason= $+ $replacecs(%Infinity-IRC.g.inappronicks,$chr(32),$chr(43)) $+ &time= $+ $$2 $+ &blacklist=Unknown
  ; ----Gline-Reasons----
  set %Infinity-IRC.g.attitude You have displayed conduct that is not suitable for the Infinity-IRC environment.
  set %Infinity-IRC.g.hatespeech Hate speech is not tolerated on Infinity-IRC.
  set %Infinity-IRC.g.harassment Harassment of user's/staff is not permitted on Infinity-IRC.
  set %Infinity-IRC.g.botnet This network does not permit clones, trojan bots, spam bots, xdcc/fserves/leech bots, zombies, or drones.
  set %Infinity-IRC.g.disobeying Disobeying the request's of Network Staff is not allowed.
  set %Infinity-IRC.g.msgsnoperm Don't PM/Query/DCC/CTCP or /invite anyone without first asking their permission in the channel.
  set %Infinity-IRC.g.malware Malicious links/programs are not acceptible on Infinity-IRC.
  set %Infinity-IRC.g.hack Attempt's to hack either the Network or the Users is not acceptible.
  set %Infinity-IRC.g.inappronicks Your nickname is inappropriate, Please return when you pick a more suitable nick.
  set %Infinity-IRC.g.flood Flooding is not permitted on Infinity-IRC.
  ; ----Need's to be added----
  ;set %Infinity-IRC.g.baneva Attempting to evade a ban is a serious infraction and only results for a longer ban.
  ;set %Infinity-IRC.g.pornlink Inappropriate or pornographic links displayed in public channels are not tolerated here.
  ;set %Infinity-IRC.g.proxies The use of an open proxy to connect to the network is not allowed.
  ;set %Infinity-IRC.g.amsg AMSGs considered to be spam are not allowed.
  ; ----Oper Up Section----
  ;set %Infinity-IRC-UID $$?="Please enter your UID for opering up:"
  ;set %Infinity-IRC-PASS $$?="Please enter your password for opering up:"
  echo -at Setup finished!
}

on *:CONNECT: {
  if ($network == Infinity-IRC) { 
    if (!%Infinity-IRC-UID) || (!%Infinity-IRC-PASS) { HALT }
    else {
      oper %Infinity-IRC-UID %Infinity-IRC-PASS 
    }
  }
}

;--------Aliases--------

alias vhost {
  if ($1 == set) {
    if ($chan == #vhosts) {
      hs set $2-
      msg $chan $1 $+ , your vhost has been set to $3 $+ . To activate your vhost, please type /hs on and hit enter. If you have no further vhost requests, please part the channel. Thanks.
      HALT
    }
    else {
      hs set $2-
      msg $chan $1 $+ , your vhost has been set to $3 $+ . To activate your vhost, please type /hs on and hit enter.
      HALT
    }
  }
  if ($1 == setall) {
    if ($chan == #vhosts) {
      hs setall $2-
      msg $chan $1 + , your vhost has been set to $3 on all of your grouped nicks. To activate your vhost on all your nicks, type /hs group on your main nick and hit enter. If you have no further vhost requests, please part the channel. Thanks.
      HALT
    }
    else {
      hs setall $2-
      msg $chan $1 + , your vhost has been set to $3 on all of your grouped nicks. To activate your vhost on all your nicks, type /hs group on your main nick and hit enter.
      HALT
    }
  }
}

alias -l infbantype {
  var %type = $$1
  var %bannick = $$2
  var %time = $$3
  var %reason = $$4-
  %type %bannick %time %reason To appeal, please visit: http://www.infinityirc.com/irc/bans?bannedby= $+ $me $+ &nick= $+ %bannick $+ &reason= $+ $replacecs(%reason,$chr(32),$chr(43)) $+ &time= $+ %time $+ &blacklist=Unknown
}


;---------------------NICKLIST MENU---------------------

menu nicklist {
  -
  $iif(o !isincs $usermode,$style(2)) Infinity Oper Menu
  .Discipline
  ..G-line
  ...G-line (No Reason):/infbantype gline $$1 $$?="Time Limit? (Use server format)"
  ...G-line (Custom):/infbantype gline $$1 $$?="Time Limit? (Use server format)" $$?="Enter a reason"
  ...G-line (Scripted)
  ....Attitude:/infbantype gline $$1 $$?="Time Limit? (Use server format)" %Infinity-IRC.g.attitude
  ....Hate Speech:/infgline gline $$1 $$?="Time Limit? (Use server format)" %Infinity-IRC.g.hatespeech
  ....Harassment:/infbantype gline $$1 $$?="Time Limit? (Use server format)" %Infinity-IRC.g.harassment
  ....Botnetting:/infbantype gline $$1 $$?="Time Limit? (Use server format)" %Infinity-IRC.g.botnet
  ....Disobeying:/infbantype gline $$1 $$?="Time Limit? (Use server format)" %Infinity-IRC.g.disobeying
  ....No PMs:/infbantype gline $$1 $$?="Time Limit? (Use server format)" %Infinity-IRC.g.msgsnoperm
  ....Malware:/infbantype gline $$1 $$?="Time Limit? (Use server format)" %Infinity-IRC.g.malware
  ....Hacking:/infbantype gline $$1 $$?="Time Limit? (Use server format)" %Infinity-IRC.g.hack
  ....Inappropriate Nicks:/infbantype gline $$1 $$?="Time Limit? (Use server format)" %Infinity-IRC.g.inappronicks
  ....Flooding:/infbantype gline $$1 $$?="Time Limit? (Use server format)" %Infinity-IRC.g.flood
  ..GZ-line
  ...GZ-line (No Reason):/infbantype gzline $$1 $$?="Time Limit? (Use server format)"
  ...GZ-line (Custom):/infbantype gzline $$1 $$?="Time Limit? (Use server format)" $$?="Enter a reason"
  ...GZ-line (Scripted)
  ....Attitude:/infbantype gzline $$1 $$?="Time Limit? (Use server format)" %Infinity-IRC.g.attitude
  ....Hate Speech:/infbantype gzline $$1 $$?="Time Limit? (Use server format)" %Infinity-IRC.g.hatespeech
  ....Harassment:/infbantype gzline $$1 $$?="Time Limit? (Use server format)" %Infinity-IRC.g.harassment
  ....Botnetting:/infbantype gzline $$1 $$?="Time Limit? (Use server format)" %Infinity-IRC.g.botnet
  ....Disobeying:/infbantype gzline $$1 $$?="Time Limit? (Use server format)" %Infinity-IRC.g.disobeying
  ....No PMs:/infbantype gzline $$1 $$?="Time Limit? (Use server format)" %Infinity-IRC.g.msgsnoperm
  ....Malware:/infbantype gzline $$1 $$?="Time Limit? (Use server format)" %Infinity-IRC.g.malware
  ....Hacking:/infbantype gzline $$1 $$?="Time Limit? (Use server format)" %Infinity-IRC.g.hack
  ....Inappropriate Nicks:/infbantype gzline $$1 $$?="Time Limit? (Use server format)" %Infinity-IRC.g.inappronicks
  ....Flooding:/infbantype gzline $$1 $$?="Time Limit? (Use server format)" %Infinity-IRC.g.flood
  ..K-Line
  ...K-line (No Reason):/infbantype kline $$1 $$?="Time Limit? (Use server format)"
  ...K-line (Custom):/infbantype kline $$1 $$?="Time Limit? (Use server format)" $$?="Enter a reason"
  ...K-line (Scripted)
  ....Attitude:/infbantype kline $$1 $$?="Time Limit? (Use server format)" %Infinity-IRC.g.attitude
  ....Hate Speech:/infbantype kline $$1 $$?="Time Limit? (Use server format)" %Infinity-IRC.g.hatespeech
  ....Harassment:/infbantype kline $$1 $$?="Time Limit? (Use server format)" %Infinity-IRC.g.harassment
  ....Botnetting:/infbantype kline $$1 $$?="Time Limit? (Use server format)" %Infinity-IRC.g.botnet
  ....Disobeying:/infbantype kline $$1 $$?="Time Limit? (Use server format)" %Infinity-IRC.g.disobeying
  ....No PMs:/infbantype kline $$1 $$?="Time Limit? (Use server format)" %Infinity-IRC.g.msgsnoperm
  ....Malware:/infbantype kline $$1 $$?="Time Limit? (Use server format)" %Infinity-IRC.g.malware
  ....Hacking:/infbantype kline $$1 $$?="Time Limit? (Use server format)" %Infinity-IRC.g.hack
  ....Inappropriate Nicks:/kline $$1 $$?="Time Limit? (Use server format)" %Infinity-IRC.g.inappronicks
  ....Flooding:/infbantype kline $$1 $$?="Time Limit? (Use server format)" %Infinity-IRC.g.flood
  ..Kill
  ...Kill (No Reason):/infbantype Kill $$1 [ $+ $me $+ ] - No Reason
  ...Kill (Custom):/infbantype Kill $$1 $$?="Enter a reason"
  ...Kill (Scripted)
  ....Attitude:/Kill $$1 %Infinity-IRC.g.attitude
  ....Hate Speech:/Kill $$1 %Infinity-IRC.g.hatespeech
  ....Harassment:/Kill $$1 %Infinity-IRC.g.harassment
  ....Botnetting:/Kill $$1 %Infinity-IRC.g.botnet
  ....Disobeying:/Kill $$1 %Infinity-IRC.g.disobeying
  ....No PMs:/Kill $$1 %Infinity-IRC.g.msgsnoperm
  ....Malware:/Kill $$1 %Infinity-IRC.g.malware
  ....Hacking:/Kill $$1 %Infinity-IRC.g.hack
  ....Inappropriate Nicks:/Kill $$1 %Infinity-IRC.g.inappronicks
  ....Flooding:/kill $$1 %Infinity-IRC.g.flood
  ..Shun
  ...Timed
  ....Timed Shun (No Reason):/shun $$1 $$?="Time Limit? (Use server format)"
  ....Timed Shun (Custom):/shun $$1 $$?="Time Limit? (Use server format)" $$?="Enter a reason"
  ....Timed Shun (Scripted)
  .....Attitude:/shun $$1 $$?="Time Limit? (Use server format)" %Infinity-IRC.g.attitude
  .....Hate Speech:/shun $$1 $$?="Time Limit? (Use server format)" %Infinity-IRC.g.hatespeech
  .....Harassment:/shun $$1 $$?="Time Limit? (Use server format)" %Infinity-IRC.g.harassment
  .....Botnetting:/shun $$1 $$?="Time Limit? (Use server format)" %Infinity-IRC.g.botnet
  .....Disobeying:/shun $$1 $$?="Time Limit? (Use server format)" %Infinity-IRC.g.disobeying
  .....No PMs:/shun $$1 $$?="Time Limit? (Use server format)" %Infinity-IRC.g.msgsnoperm
  .....Malware:/shun $$1 $$?="Time Limit? (Use server format)" %Infinity-IRC.g.malware
  .....Hacking:/shun $$1 $$?="Time Limit? (Use server format)" %Infinity-IRC.g.hack
  .....Inappropriate Nicks:/shun $$1 $$?"Time Limit? (Use server format)" %Infinity-IRC.g.inappronicks
  .....Flooding:/shun $$1 $$?="Time Limit? (Use server format)" %Infinity-IRC.g.flood
  ...Session (TempShun)
  ....TempShun (No Reason):/tempshun $$1
  ....TempShun (Custom):/tempshun $$1 $$?="Enter a reason"
  ....TempShun (Scripted)
  .....Attitude:/tempshun $$1 %Infinity-IRC.g.attitude
  .....Hate Speech:/tempshun $$1 %Infinity-IRC.g.hatespeech
  .....Harassment:/tempshun $$1 %Infinity-IRC.g.harassment
  .....Botnetting:/tempshun $$1 %Infinity-IRC.g.botnet
  .....Disobeying:/tempshun $$1 %Infinity-IRC.g.disobeying
  .....No PMs:/tempshun $$1 %Infinity-IRC.g.msgsnoperm
  .....Malware:/tempshun $$1 %Infinity-IRC.g.malware
  .....Hacking:/tempshun $$1 %Infinity-IRC.g.hack
  .....Inappropriate Nicks:/tempshun $$1 %Infinity-IRC.g.inappronicks
  .....Flooding:/tempshun $$1 %Infinity-IRC.g.flood

  .HostServ
  ..Set
  ...Nick Set:/vhost set $$1 $$?="Enter the nick's desired host:"
  ...Group Set:/vhost SETALL $$1 $$?="Enter the group's desired host"
  ..Remove
  ...Nick Delete:/msg hostserv del $$1
  ...Group Delete:/msg hostserv DELALL $$1
  ..List:/msg HostServ LIST $$?="Enter a keyword or list range"

  .Oper Override
  ..SA Commands
  ...Join:/sajoin $$1 $$?="Enter the channels to force join (#chan1,#chan2,#chan3)"
  ...Part:/sapart $$1 $$?="Enter the channels to force part (#chan1,#chan2,#chan3)"
  ..Status
  ...Permanent
  ....SOP
  .....Set
  .....Remove
  ....AOP
  .....Set
  .....Remove
  ....HOP
  ....VOP
  ...Temporary
  ..Channel Discipline
  ...Kick:/msg operserv kick $chan $$1 $$?="Enter a reason"
}

menu channel {
  -
  .BotServ
  ..Add:/msg BotServ BOT ADD $$?="Enter the bot's nick" $$?="Enter the bot's user" $$?="Enter the bot's host" $$?="Enter the bot's real name"
  ..Change:/msg BotServ BOT CHANGE $$?="Enter the bot's old nick" $$?="Enter the bot's new nick" $$?="Enter a new user" $$?="Enter a new host" $$?="Enter a new real name"
  ..Delete:/msg BotServ DEL $$?="Enter the bot's nick to delete"
  ..Set Private
  ...On:/msg BotServ SET $$?="Enter the bot's nick to set private" ON
  ...Off:/msg BotServ SET $$?="Enter the bot's nick to set private" OFF

  .ChanServ
  ..Drop:/msg ChanServ DROP $chan
  ..Forbid:/msg ChanServ FORBID $chan $$?="Enter a reason"
  ..Retrieve Channel Password:/msg ChanServ GETPASS $chan
  ..Suspend:/msg ChanServ SUSPEND $chan $$?="Enter a reason"
  ..Unsuspend:/msg ChanServ UNSUSPEND $chan
  ..Set No Expire
  ...On:/msg ChanServ SET $chan NOEXPIRE on
  ...Off:/msg ChanServ SET $chan NOEXPIRE off
}

menu status {
  -
  Infinity-IRC Oper Menu
  .ServerStats
  ..KZElines(Banned hosts/IP):/stats k
  ..Glines(Banned hosts&Shuns):/stats g
  ..Elines(K $+ $chr(58) $+ Line Exceptions):/stats E
  ..Flines(Filename masks on DCCDENY):/stats f
  ..OLines(IRC Operator Lines):/stats O
  ..Qlines(Forbidden Nicks):/stats Q
  ..CNlines(Serversconnect or acceptfrom):/stats C
  ..HLlines(Hub and Leaf Lines):/stats H
  ..nLines(GECOS Deny):/stats n
  ..VHostLines:/stats V
  ..Tlines(Specific MOTD/Rules Lines):/stats T
  ..Ulines(Usually Services):/stats U
  ..Vlines(Version Deny):/stats v
  ..Dlines(Disallow Lines-Oper & Server Orig Connects):/stats D
  ..dLINES(Disallow Lines-Autoconnects):/stats d
  ..eLInes(Proxy scan exempt IPs):/stats e
  ..ILines(Client auth Lines):/stats I
  ..Flines(DCCDENY Lines):/stats F
  ..Ylines(Connection classes):/stats Y
  ..lLines(Client auth Lines):/stats l 
  ..ChanRestric:/stats r
  ..NetConfig:/stats N
  ..DynamConfig:/stats S
  ..ServerLoad:/stats W
  ..SQLineReport:/stats q
  ..ServerUpTime:/stats u
  ..ServCmdList:/stats m
  ..MiscSErv:/stats z
  ..ServerCAcheNS:/stats s
  ..MiscINfo:/stats t
  ..SerVConnt:/stats L
  ..StatsCommands:/stats ?
}
