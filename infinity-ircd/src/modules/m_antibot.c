/* This module was written by GeekShed for the gs-ircd project 
 * and is not owned/licensed to Infinity in any way. 
 * Change: Changed the info that is sent to snomasked users
 * Changed on: 01/08/2010 */


#include "config.h"
#include "struct.h"
#include "common.h"
#include "sys.h"
#include "numeric.h"
#include "msg.h"
#include "channel.h"
#include <time.h>
#include <sys/stat.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#ifdef _WIN32
#include <io.h>
#endif
#include <fcntl.h>
#include "h.h"
#include "proto.h"
#ifdef STRIPBADWORDS
#include "badwords.h"
#endif
#ifdef _WIN32
#include "version.h"
#endif

#ifndef GSVERSION
long SNO_BOPM = 0L;
extern MODVAR long SNO_BOPM;
#endif

DLLFUNC int m_lconnect(aClient *cptr);

static Hook *LocalConnect;

ModuleHeader MOD_HEADER(m_antibot)
  = {
        "antibot",      /* Name of module */
        "$Id$", /* Version */
        "", /* Short description of module */
        "3.2-b8-1",
        NULL 
    };

DLLFUNC int MOD_TEST(m_antibot)(ModuleInfo *modinfo)
{
        return MOD_SUCCESS;
}


DLLFUNC int MOD_INIT(m_antibot)(ModuleInfo *modinfo)
{
#ifndef GSVERSION
        SnomaskAdd(NULL, 'p', umode_allow_opers, &SNO_BOPM);
#endif

#ifdef GSVERSION
        if (GSREV >= 20000) {
                LocalConnect = HookAddEx(modinfo->handle, HOOKTYPE_LOCAL_CONNECT, m_lconnect);
        } else
#endif
        {
                LocalConnect = HookAddEx(modinfo->handle, HOOKTYPE_LOCAL_CONNECT, m_lconnect);
        }
        return MOD_SUCCESS;
}

DLLFUNC int MOD_LOAD(m_antibot)(int module_load)
{
        return MOD_SUCCESS;
}


DLLFUNC int MOD_UNLOAD(m_antibot)(int module_unload)
{
        HookDel(LocalConnect);
        return MOD_SUCCESS;
}

DLLFUNC int m_lconnect(aClient *cptr)
{
        time_t now;

        if (!MyClient(cptr))
                return 0;
        
                sendto_one(cptr, ":%s NOTICE %s :*** Your host is being scanned for open proxies...", me.name, cptr->name);
                sendto_snomask_global(SNO_BOPM, "*** Proxy Scanner - IP: %s", Inet_ia2p(&cptr->ip));
                now = TStime();
                cptr->since = now + 12;
        return 0;
}
