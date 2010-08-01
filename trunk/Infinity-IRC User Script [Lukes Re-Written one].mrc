############################################
# Infinity-IRC Channel Management Script   #
# Version 2.0 BETA                         #
# All Rights Reserved                      #
############################################

on *:LOAD:{
  echo -at 4Infinity-IRC Channel management Script loaded 12- 4Copyright Infinity-IRC IRC Network 2010 - All Rights Reserved
  echo -at 4Re-Written by: Luke Additional Scripting: iYorkie (First Version), GrimReaper (Modes)
  echo -at 4Setting Variables...4
  inf-setvars
  echo -at 12Variables Set! Infinity-IRC Chanscript is ready for use. 
}

;Aliases

alias inf-setvars {
  ;Warning Variables
  set %infinity.w.swear please watch your language. We want everyone to feel welcome in this room.
  set %infinity.w.caps please do not use caps, they are considered shouting and are rude and annoying.
  set %infinity.w.rep do not repeat yourself. It gets annoying to the users that have already seen the message.
  set %infinity.w.flood flooding is lame. Any idiot can do it! 
  set %infinity.w.eng this channel is an English only channel.
  set %infinity.w.spam spamming is not permitted in this channel. 
  set %infinity.w.atta Debate the opinion and never personally attack the person making it.
  set %infinity.w.bor if you're really bored, then leave. There's plenty else to do on the Internet. By yawning or stating that you're bored here, you're only illustrating your extreme level of apathy and inability to keep yourself entertained. If you're not engaged, you're doing something wrong - and it's nobody's fault but your own.
  set %infinity.w.nick please change your nickname.
  set %infinity.w.nopm please ask before you PM someone.
  set %infinity.w.amsg please do not amsg/ame here.

  ;Kick Variables
  set %infinity.k.swear Please watch your language.
  set %infinity.k.caps Please do not use caps.
  set %infinity.k.rep Stop repeating yourself.
  set %infinity.k.flood Flooding is lame, Any idiot can do it! 
  set %infinity.k.eng This channel is an English only channel.
  set %infinity.k.spam Spamming is not permitted in this channel. 
  set %infinity.k.atta Debate the opinion and never personally attack the person making it.
  set %infinity.k.nick Please change your nickname.
  set %infinity.k.nopm Please ask before you PM someone.
  set %infinity.k.amsg Please do not amsg/ame here.

  ;Help Variables
  set %infinity.h.regchan for info on how to register your channel on Infinity-IRC, go to  http://www.infinityirc.com/2010/01/registering-a-channel/
  set %infinity.h.regnick to register your nickname, use the following command: "/msg NickServ REGISTER passwordhere emailhere". When you connect to Infinity-IRC again, you will need to do "/msg NickServ IDENTIFY passwordhere".
  set %infinity.h.vhostpol our vHost policy can be found on our terms of service document located at: http://www.infinityirc.com/tos
  set %infinity.h.vhost to request a vHost join #vHosts and type ^vhost your-vhost-here
  set %infinity.h.ajoinserv for info on our server-side ajoin, go to http://www.infinityirc.com/2010/01/adding-channels-to-your-autojoin/
  set %infinity.h.flash you can get our flash client by going to http://www.infinityirc.com/chat/embed-code/
  set %infinity.h.ssl for more info on how to connect using SSL, go to http://www.infinityirc.com/2009/12/using-ssl-on-infinity-irc/
  set %infinity.h.botlist you can find a list of BotServ bots by typing the following command "/msg BotServ botlist"
  set %infinity.h.botassign to assign a BotServ bot to your channel do "/msg BotServ assign #channel botnick
  set %infinity.h.botcustom to get a custom BotServ bot speak to an IRCop for more info.
  set %infinity.h.fant you may want to take a look at http://www.infinityirc.com/2009/12/fantasy-commands-with-a-twist/

  ;Docs
  set %infinity.d.list For a complete list of our documentation of commands and faq please go to: www.infinityirc.com/docs
  set %infinity.d.botserv for a list of BotServ commands, go to http://www.infinityirc.com/docs/BotServ-commands/
  set %infinity.d.chanserv for the list of ChanServ commands, go to http://www.infinityirc.com/docs/ChanServ-Commands
  set %infinity.d.nickserv for a list of NickServ commands, go to http://www.infinityirc.com/docs/NickServ-Commands/
  set %infinity.d.hostserv for a list of HostServ commands, go to http://www.infinityirc.com/docs/HostServ-Commands/
  set %infinity.d.operserv for a list of OperServ commands, go to http://www.infinityirc.com/docs/OperServ-Commands
  set %infinity.d.faq take a look out our frequently asked questions section of our site at www.infinityirc.com/docs/faq 

  ;User stuff
  set %infinity.u.chanlist you can view all the channels on the network by visiting http://www.infinityirc.com/channels/
  set %infinity.u.idlerpg you can play IdleRPG in #idlerpg and you can view stats at http://www.infinityirc.com/idlerpg/
  set %infinity.u.servers you can find out about our servers at http://www.infinityirc.com/servers/
  set %infinity.u.forum you can find info and updates on our forums at http://forums.infinityirc.com/
  set %infinity.u.donate help keep us running! Donate to us at http://www.infinityirc.com/donate/
  set %infinity.u.staff a full staff list can be found at http://www.infinityirc.com/staff
  set %infinity.u.tools check out some of our cool tools at http://www.infinityirc.com/tools/
  set %infinity.u.chanscript To get the Infinity-IRC chanscript please go to http://www.infinityirc.com/tools/chanscript

}

alias ikb {
  if ($1 ison $chan) { 
    mode $chan +b $address($1,2)
    kick # $1-
  }
}

;Menu Nicklist 

menu nicklist {
  Infinity-IRC Management Script
  .Warnings
  ..Language:/say $1, %infinity.w.swear 
  ..Caps:/say $1, %infinity.w.caps 
  ..Repeat:/say $1, %infinity.w.rep 
  ..Flooding:/say $1, %infinity.w.flood  
  ..English:/say $1, %infinity.w.eng 
  ..Spamming:/say $1, %infinity.w.spam 
  ..Attack:/say $1, %infinity.w.atta
  ..Bored:/say $1, %infinity.w.bor
  ..Change Nicname:/say $1, %infinity.w.nick
  ..No PM:/say $1, %infinity.w.nopm
  ..AMSG/AME:/say $1, %infinity.w.amsg

  .Kick
  ..Language:/kick # $1, %infinity.k.swear 
  ..Caps:/kick # $1, %infinity.k.caps 
  ..Repeat:/kick # $1, %infinity.k.rep 
  ..Flooding:/kick # $1, %infinity.k.flood  
  ..English:/kick # $1, %infinity.k.eng 
  ..Spamming:/kick # $1, %infinity.k.spam 
  ..Attack:/kick # $1, %infinity.k.atta
  ..Change Nicname:/kick # $1, %infinity.k.nick
  ..No PM:/kick # $1, %infinity.k.nopm
  ..AMSG/AME:/kick # $1, %infinity.k.amsg

  .Ban
  ..Language:/ikb $1 %infinity.k.swear
  ..Caps:/ikb $1 %infinity.k.caps
  ..Repeat:/ikb $1 %infinity.k.rep
  ..Flooding:/ikb $1 %infinity.k.flood
  ..English:/ikb $1 %infinity.k.eng
  ..Spamming:/ikb $1 %infinity.k.spam
  ..Attack:/ikb $1 %infinity.k.atta
  ..Change Nicname:/ikb $1 %infinity.k.nick
  ..No PM:/ikb $1 %infinity.k.nopm
  ..AMSG/AME:/ikb $1 %infinity.k.amsg


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

  .Help
  ..Register Chan:/say $1, %infinity.h.regchan
  ..Register Nicname:/say $1, %infinity.h.regnick
  ..vHost Policy:/say $1, %infinity.h.vhostpol
  ..vHost Request:/say $1, %infinity.h.vhost
  ..Server aJoin:/say $1, %infinity.h.ajoinserv
  ..Flash Chat:/say $1, %infinity.h.flash
  ..SSL Connection:/say $1, %infinity.h.ssl
  ..BotServ Bot List:/say $1, %infinity.h.botlist
  ..BotServ Bot Assign:/say $1, %infinity.h.botassign
  ..BotServ Custom bot:/say $1, %infinity.h.botcustom
  ..Fantasy Commands:/say $1, %infinity.h.fant

  .Docs
  ..Docs List:/say $1, %infinity.d.list
  ..ChanServ Commands:/say $1, %infinity.d.chanserv
  ..BotServ Commands:/say $1, %infinity.d.botserv
  ..NickServ Commands:/say $1, %infinity.d.nickserv
  ..HostServ Commands:/say $1, %infinity.d.hostserv
  ..OperServ Commands:/say $1, %infinity.d.operserv
  ..FAQ:/say $1, %infinity.d.faq

  .User General Help
  ..Channels List:/say $1, %infinity.u.chanlist
  ..IdleRPG:/say $1, %infinity.u.idlerpg
  ..Servers:/say $1, %infinity.u.servers
  ..Forums:/say $1, %infinity.u.forum
  ..Donate:/say $1, %infinity.u.donate
  ..Staff:/say $1, %infinity.u.staff
  ..Tools:/say $1, %infinity.u.tools
  ..ChanScript:/say $1, %infinity.u.chanscript

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
