# _________ _        _______ _________ _       __________________             # 
#\__   __/( (    /|(  ____ \\__   __/( (    /|\__   __/\__   __/|\     /|     #
#   ) (   |  \  ( || (    \/   ) (   |  \  ( |   ) (      ) (   ( \   / )     #
#   | |   |   \ | || (__       | |   |   \ | |   | |      | |    \ (_) /_____ #
#   | |   | (\ \) ||  __)      | |   | (\ \) |   | |      | |     \   /(_____)#
#   | |   | | \   || (         | |   | | \   |   | |      | |      ) (        #
#\_______/|/    )_)|/       \_______/|/    )_)\_______/   )_(      \_/        #
#                                                                             #
#_________ _______  _______                                                   #
#\__   __/(  ____ )(  ____ \                                                  #
#   ) (   | (    )|| (    \/                                                  #
#   | |   | (____)|| |                                                        #
#   | |   |     __)| |                                                        #
#   | |   | (\ (   | |                                                        #
#___) (___| ) \ \__| (____/\                                                  #
#\_______/|/   \__/(_______/      Channel Manager Script  by iYorkie        #
################################################################################
on *:LOAD:{
  echo -at 4Infinity-IRC Channel management Script loaded 12- 4Copyright Infinity-IRC IRC Network 2009/2010 - All Rights Reserved
  echo -at 4Scripting done and made by iYorkie & channel modes done by GrimReaper. Version 1.0 BETA 
}
menu nicklist {
  Infinity-IRC  Management Script
  .Say: /say $1, $$?="Message here" 
  .Notice: /notice $1 $$?="Message here"
  .Huggle: /me  huggles  $$1! I have been huggled %huggle.recieved times
  .-
  .Warnings
  ..Swearing/Language:/say $1,  please watch your language. We want everyone to feel welcome in this room.
  ..Caps:/say $1, please do not use caps, they are considered shouting and are rude and annoying. That's the button above your left shift key and next to your A key.
  ..Repeat:/say $1, do not repeat yourself. It gets annoying to the users that have already seen the message.
  ..Flooding:/say $1, flooding is lame. Anyone can do it well, especially the idiots! 
  ..English:/say $1, this is an English network, we would like it if you spoke English. Thanks.
  ..Spam:/say $1, spam is off topic and personal links posted in a channel. Please do not spam your links. Thanks.
  ..Attack:/say $1, Debate the opinion and never personally attack the person making it.
  ..Bored:/say $1, if you're really bored, then leave. There's plenty else to do on the Internet. By yawning or stating that you're bored here, you're only illustrating your extreme level of apathy and inability to keep yourself entertained. If you're not engaged, you're doing something wrong - and it's nobody's fault but your own.
 
   .Silence
  ..Silence User - 15 Minutes: {
    mode $chan +bb ~q: $+ $address($$1, 2) ~n: $+ $address($$1, 2)
    set %Time 15
    timer 1 3 /notice $$1 You Have been silenced for %time minutes. Please follow the rules when this silence is removed.
    timer 1 900 /mode $chan -bb ~q: $+ $address($$1, 2) ~n: $+ $address($$1, 2)
  }
  ..Silence User - Custom Time: {
    set %time $$?="Enter time (in minutes) to ban for:"
    mode $chan +bb ~q: $+ $address($$1, 2) ~n: $+ $address($$1, 2)
    timer 1 3 /notice $$1 You Have been silenced for %time minutes. Please follow the rules when this silence is removed.
    %time2 = %time * 60
    timer 1 %time2 /mode $chan -bb ~q: $+ $address($$1, 2) ~n: $+ $address($$1, 2)
  }
  
  .kick/ban
  ..Kick[Standard]:
  ...SpeedKick:/kick # $$1 You have been kicked from the room by $me
  ...Kick [Reason]:/kick # $$1  $$?="Kick Message:"
  ..Kick [Reason]
  ...Flooding:/kick # $$1 Flooding is lame, any idiot can do it.
  ...Spamming:/kick # $$1 Spamming off topic links is not a good idea. Please only use on topic links.
  ...Attack:/kick # $$1 If you're really bored, do not rejoin. You can do plenty of things elsewhere.
  ...Attitude:/kick # $$1 Your attitude is not conductive to the desired environment. Take a moment to think about what you have said.
  ...Repeating:/kick # $$1 We heard you the first time. Repeating yourself is useless.
  ..Ban[Standard]:/cs ban # $$1 You have been banned from the room.
  ..Ban[Message]:/cs ban # $$1 $$?="Kick Message:"
  ..Ban:/ban # $$1 2
  ..Temp Ban
  ...30 seconds:/ban -u30 $$1 2 | /kick # $$1 You are banned 30 seconds..Calm down!  
  ...60 seconds:/ban -u60 $$1 2 | /kick # $$1 You are banned 60 seconds..Calm down!
  ...5 Minutes:/ban -u300 $$1 2 | /kick # $$1 You are banned 5 minutes..Calm Down!
  ...Custom Ban:/ban -u $+ $$?="Ban Time?" $$1 2 | /kick # $$1 You are banned for $$! seconds!!!..Calm down!
  
  .Docs
  ..Register Chan:/say $1, for info on how to register your channel on Infinity-IRC, go to  http://www.infinityirc.com/2010/01/registering-a-channel/
  ..vHost Policy:/say $1, for info on a virtual host or a vHost, go to http://www.infinityirc.com/2010/01/vhost-policy/
  ..Server aJoin:/say $1, for info on our server-side ajoin, go to http://www.infinityirc.com/2010/01/adding-channels-to-your-autojoin/
  ..Flash Clients:/say $1, for info on how to connect flash clients, go to http://www.infinityirc.com/2010/01/connecting-flash-irc-clients-to-infinity-irc/
  ..SSL Connection:/say $1, for more info on how to connect using SSL, go to http://www.infinityirc.com/2009/12/using-ssl-on-infinity-irc/
  ..Fantasy Commands:/say $1, for more info on fantasy comamnds, go to http://www.infinityirc.com/2009/12/fantasy-commands-with-a-twist/
  ..BotServ Bots:/say $1, for a list of botserv bots, go to http://www.infinityirc.com/2010/01/botserv-bots/
 
 .Commands
 ..ChanServ Commands:/say $1, for the list of ChanServ commands, go to http://www.infinityirc.com/docs/ChanServ-Commands
 ..BotServ Commands:/say $1, for a list of BotServ commands, go to http://www.infinityirc.com/docs/BotServ-commands/
 ..NickServ Commands:/say $1, for a list of NickServ commands, go to http://www.infinityirc.com/docs/NickServ-Commands/
 ..HostServ Commands:/say $1, for a list of HostServ commands, go to http://www.infinityirc.com/docs/HostServ-Commands/
 ..OperServ Commands:/say $1, for a list of OperServ commands, go to http://www.infinityirc.com/docs/OperServ-Commands
 ..Modes:/say $1, for a list modes, go to http://www.infinityirc.com/docs/
 
 .Other
 ..Channels:/say $1, you can view all the channels on the network by visiting http://www.infinityirc.com/channels/
 ..IdleRPG:/say $1, you can play IdleRPG in #idlerpg and you can view stats at http://www.infinityirc.com/idlerpg/
 ..Servers:/say $1, you can find out about our servers at http://www.infinityirc.com/servers/
 ..Forums:/say $1, you can find info and updates on our forums at http://forums.infinityirc.com/
 ..Chat:/say $1, you can get the web chat code and chat online at http://www.infinityirc.com/chat/
 ..Netsplit:/say $1, a netsplit is when 2 or more servers split from the rest of the network, so the link between Server1 and Server2 is broken. When the server reconnects, everyone will rejoin and the server will give back everyones status in the channel. For info on this in more detail, please see http://en.wikipedia.org/wiki/Netsplit

  .User Mode $+ $chr(58) $gettok($usermode,1,32)
  ...$iif(D isincs $gettok($usermode,1,32),$style(1)) PM Block:{ if (D isincs $gettok($usermode,1,32)) { umode2 -D } | else { umode2 +D } }
  ...$iif(i isincs $gettok($usermode,1,32),$style(1)) Invisible:{ if (i isincs $gettok($usermode,1,32)) { umode2 -i } | else { umode2 +i } }
  ...$iif(p isincs $gettok($usermode,1,32),$style(1)) Hide Channels:{ if (p isincs $gettok($usermode,1,32)) { umode -p } | else { umode2 +p } }
  ...$iif(w isincs $gettok($usermode,1,32),$style(1)) Wallop Msg Block:{ if (w isincs $gettok($usermode,1,32)) { umode2 -w } | else { umode2 +w } }
  ...$iif(G isincs $gettok($usermode,1,32),$style(1)) Censored Filter:{ if (G isincs $gettok($usermode,1,32)) { umode2 -G } | else { umode2 +G } }
  ...$iif(R isincs $gettok($usermode,1,32),$style(1)) PM/Notices from +r Users:{ if (R isincs $gettok($usermode,1,32)) { umode2 -R } | else { umode2 +R } }
  ...$iif(T isincs $gettok($usermode,1,32),$style(1)) CTCPs Block:{ if (T isincs $gettok($usermode,1,32)) { umode2 -T } | else { umode2 +T } }
}
menu channel {
  .Channel Modes $+ $chr(58) $+ $chr(9) $+ $chan(#).mode
  ...$iif(c isincs $gettok($chan(#).mode,1,32),$style(1)) No Colors:{ if (c isincs $gettok($chan(#).mode,1,32)) { mode # -c } | else { mode # +c } }
  ...$iif(i isincs $gettok($chan(#).mode,1,32),$style(1)) Invite Only:{ if (i isincs $gettok($chan(#).mode,1,32)) { mode # -i } | else { mode # +i } }
  ...$iif(M isincs $gettok($chan(#).mode,1,32),$style(1)) Only Registered Nicks Can Speak:{ if (M isincs $gettok($chan(#).mode,1,32)) { mode # -M } | else { mode # +M } }
  ...$iif(m isincs $gettok($chan(#).mode,1,32),$style(1)) Moderated:{ if (m isincs $gettok($chan(#).mode,1,32)) { mode # -m } | else { mode # +m } }
  ...$iif(n isincs $gettok($chan(#).mode,1,32),$style(1)) No External Messages:{ if (n isincs $gettok($chan(#).mode,1,32)) { mode # -n } | else { mode # +n } }
  ...$iif(p isincs $gettok($chan(#).mode,1,32),$style(1)) Private:{ if (p isincs $gettok($chan(#).mode,1,32)) { mode # -p } | else { mode # +p } }
  ...$iif(R isincs $gettok($chan(#).mode,1,32),$style(1)) Registered Nicks Only:{ if (R isincs $gettok($chan(#).mode,1,32)) { mode # -R } | else { mode # +R } }
  ...$iif(s isincs $gettok($chan(#).mode,1,32),$style(1)) Secret:{ if (s isincs $gettok($chan(#).mode,1,32)) { mode # -s } | else { mode # +s } }
  ...$iif(t isincs $gettok($chan(#).mode,1,32),$style(1)) Only Ops Set Topic:{ if (t isincs $gettok($chan(#).mode,1,32)) { mode # -t } | else { mode # +t } }
  ...$iif(l isincs $gettok($chan(#).mode,1,32),$style(1)) User Limit $+ $chr(58) $chan(#).limit,User Limit):{ if (l isincs $gettok($chan(#).mode,1,32)) { mode # -l } | else { mode # +l $$?"Maximum number of users allowed in # $+ :" } }
  ...$iif(k isincs $gettok($chan(#).mode,1,32),$style(1)) Key $+ $chr(58) $chan(#).key,Key):{ if (k isincs $gettok($chan(#).mode,1,32)) { mode # -k $chan(#).key } | else { mode # +k $$?"Enter key for # $+ :" } }
  ...$iif(U isincs $gettok($chan(#).mode,1,32),$style(1)) No Formatting Codes:{ if (V isincs $gettok($chan(#).mode,1,32)) { mode # -U } | else { mode # +U } }
  ...$iif(V isincs $gettok($chan(#).mode,1,32),$style(1)) No Invite:{ if (V isincs $gettok($chan(#).mode,1,32)) { mode # -V } | else { mode # +V } }
  ...$iif(z isincs $gettok($chan(#).mode,1,32),$style(1)) SSL Clients Only:{ if (z isincs $gettok($chan(#).mode,1,32)) { mode # -z } | else { mode # +z } }

} 
on *:action:$(*huggle* $+ $me $+ *):#: {
  if (%huggleflood != ON ) {
    inc %huggle.recieved 1
    echo -a you have been huggled %huggle.recieved times 
  }
 }