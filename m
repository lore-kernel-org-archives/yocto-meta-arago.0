Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 8489E52A30
	for <meta-arago@arago-project.org>;
	Wed,  7 Aug 2013 14:24:30 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r77EOTHi015535;
	Wed, 7 Aug 2013 09:24:29 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r77EOTfQ012682;
	Wed, 7 Aug 2013 09:24:29 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 7 Aug 2013 09:24:29 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r77EOTsY012033;
	Wed, 7 Aug 2013 09:24:29 -0500
Date: Wed, 7 Aug 2013 10:24:28 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Sivaprasad Pala (RBEI/EAA1)" <Sivaprasad.Pala@in.bosch.com>
Message-ID: <20130807142428.GA23226@edge>
References: <7D46E86EC0A8354091174257B2FED101596966EC@DLEE11.ent.ti.com>
	<F2E05BCE6D875B4AAC726FD84CBB8F13222682D190@SGPMBX02.APAC.bosch.com>
	<7D46E86EC0A8354091174257B2FED10159696AFE@DLEE11.ent.ti.com>
	<F2E05BCE6D875B4AAC726FD84CBB8F13222682D1B6@SGPMBX02.APAC.bosch.com>
	<7D46E86EC0A8354091174257B2FED10159696B85@DLEE11.ent.ti.com>
	<F2E05BCE6D875B4AAC726FD84CBB8F13222682D1C1@SGPMBX02.APAC.bosch.com>
	<7D46E86EC0A8354091174257B2FED10159696C3F@DLEE11.ent.ti.com>
	<F2E05BCE6D875B4AAC726FD84CBB8F13222682D1CE@SGPMBX02.APAC.bosch.com>
	<7D46E86EC0A8354091174257B2FED10159696CEE@DLEE11.ent.ti.com>
	<F2E05BCE6D875B4AAC726FD84CBB8F13222682D1DA@SGPMBX02.APAC.bosch.com>
MIME-Version: 1.0
In-Reply-To: <F2E05BCE6D875B4AAC726FD84CBB8F13222682D1DA@SGPMBX02.APAC.bosch.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: error while building yocto for am335x
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Aug 2013 14:24:31 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Sorry to interrupt this long conversation, but all it requires is to properly 
configure your proxy settings:

http://arago-project.org/wiki/index.php/Proxy_Settings
https://wiki.yoctoproject.org/wiki/Working_Behind_a_Network_Proxy
There are other resources as well...

Please stop messing the recipes up - you'll have even more problems.

-- 
Denys


On Wed, Aug 07, 2013 at 08:53:49PM +0800, Sivaprasad Pala (RBEI/EAA1) wrote:
> I didn’t did any changes in any other layers.
> 
> Please find the attached recipes.
> 
> Thanks.
> 
> 
> From: Maupin, Chase [mailto:chase.maupin@ti.com]
> Sent: Wednesday, August 07, 2013 6:13 PM
> To: Sivaprasad Pala (RBEI/EAA1); Dmytriyenko, Denys
> Cc: meta-arago@arago-project.org
> Subject: RE: [meta-arago] error while building yocto for am335x
> 
> Can you send the recipe?  Have you made any other modifications in any other layers?  This error looks like an issue with the SRC_URI setting (like commenting out the line but leaving a trailing \) and an AUTOREV issue, but the recipe as I am aware of it is not an AUTOREV recipe.
> 
> Sincerely,
> Chase Maupin
> Integration Team Manager
> Linux Core Product Development
> e-mail: chase.maupin@ti.com<mailto:chase.maupin@ti.com>
> phone: (214) 567-2950
> 
> For support:
> Forums - http://community.ti.com/forums/
> Wiki - http://wiki.davincidsp.com/
> 
> From: Sivaprasad Pala (RBEI/EAA1) [mailto:Sivaprasad.Pala@in.bosch.com]
> Sent: Wednesday, August 07, 2013 6:04 PM
> To: Maupin, Chase; Dmytriyenko, Denys
> Cc: meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
> Subject: RE: [meta-arago] error while building yocto for am335x
> 
> Hi,
> 
> 
> I have changed the .inc file. I am getting the same log except “fatal: Unable to look up github.com (port 9418) (Name or service not known)”
> 
> 
> 
> I tried with adding “import bb.fetch2” line in “sources/bitbake/bin/bitbake-layers” also.
> 
> But I am getting the same error.
> 
> Thanks.
> 
> Log:
> xxx@xxx-desktop:~/build_system/try/tisdk/build$ MACHINE=am335x-evm bitbake hello-world
> Pseudo is not present but is required, building this first before the main build
> Loading cache: 100% |########################################################################################################################################################################################################| ETA:  00:00:00
> Loaded 48 entries from dependency cache.
> ERROR: Error executing a python function in <code>:                                                                                                                                                                          | ETA:  --:--:--
> ExpansionError: Failure expanding variable SRCPV, expression was ${@bb.fetch2.get_srcrev(d)}<mailto:$%7b@bb.fetch2.get_srcrev(d)%7d> which triggered exception FetchError: Fetcher failure: SRCREV was used yet no valid SCM was found in SRC_URI
> 
> ERROR: The stack trace of python calls that resulted in this exception/failure was:
> ERROR:   File "<code>", line 2, in <module>
> ERROR:
> ERROR:   File "__anon_567__home_xxx_build_system_try_tisdk_sources_oe_core_meta_classes_base_bbclass", line 203, in __anon_567__home_xxx_build_system_try_tisdk_sources_oe_core_meta_classes_base_bbclass
> ERROR:
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 293, in getVar
> ERROR:     return self.expand(value, var)
> ERROR:
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 157, in expand
> ERROR:     return self.expandWithRefs(s, varname).value
> ERROR:
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 140, in expandWithRefs
> ERROR:     s = __expand_var_regexp__.sub(varparse.var_sub, s)
> ERROR:
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 61, in var_sub
> ERROR:     var = self.d.getVar(key, True)
> ERROR:
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 293, in getVar
> ERROR:     return self.expand(value, var)
> ERROR:
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 157, in expand
> ERROR:     return self.expandWithRefs(s, varname).value
> ERROR:
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 140, in expandWithRefs
> ERROR:     s = __expand_var_regexp__.sub(varparse.var_sub, s)
> ERROR:
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 61, in var_sub
> ERROR:     var = self.d.getVar(key, True)
> ERROR:
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 293, in getVar
> ERROR:     return self.expand(value, var)
> ERROR:
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 157, in expand
> ERROR:     return self.expandWithRefs(s, varname).value
> ERROR:
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 140, in expandWithRefs
> ERROR:     s = __expand_var_regexp__.sub(varparse.var_sub, s)
> ERROR:
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 61, in var_sub
> ERROR:     var = self.d.getVar(key, True)
> ERROR:
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 293, in getVar
> ERROR:     return self.expand(value, var)
> ERROR:
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 157, in expand
> ERROR:     return self.expandWithRefs(s, varname).value
> ERROR:
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 147, in expandWithRefs
> ERROR:     raise ExpansionError(varname, s, exc)
> ERROR:
> ERROR: The code that was being executed was:
> ERROR:      0001:__anon_125__home_xxx_build_system_try_tisdk_sources_oe_core_meta_classes_staging_bbclass(d)
> ERROR:  *** 0002:__anon_567__home_xxx_build_system_try_tisdk_sources_oe_core_meta_classes_base_bbclass(d)
> ERROR:      0003:__anon_172__home_xxx_build_system_try_tisdk_sources_meta_arago_meta_arago_distro_classes_sourceipk_bbclass(d)
> ERROR:      0004:__anon_218__home_xxx_build_system_try_tisdk_sources_oe_core_meta_classes_package_bbclass(d)
> ERROR:      0005:__anon_471__home_xxx_build_system_try_tisdk_sources_oe_core_meta_classes_package_ipk_bbclass(d)
> ERROR:      0006:__anon_822__home_xxx_build_system_try_tisdk_sources_oe_core_meta_classes_insane_bbclass(d)
> ERROR: [From file: '<code>', lineno: 2, function: <module>]
> ERROR:      0199:    #
> ERROR:      0200:    override = d.getVar('SRC_URI_OVERRIDES_PACKAGE_ARCH', True)
> ERROR:      0201:    if override != '0':
> ERROR:      0202:        paths = []
> ERROR:  *** 0203:        fpaths = (d.getVar('FILESPATH', True) or '').split(':')
> ERROR:      0204:        machine = d.getVar('MACHINE', True)
> ERROR:      0205:        for p in fpaths:
> ERROR:      0206:            if os.path.basename(p) == machine and os.path.isdir(p):
> ERROR:      0207:                paths.append(p)
> ERROR: [From file: '__anon_567__home_xxx_build_system_try_tisdk_sources_oe_core_meta_classes_base_bbclass', lineno: 203, function: __anon_567__home_xxx_build_system_try_tisdk_sources_oe_core_meta_classes_base_bbclass]
> ERROR: Failed to parse recipe: /home/xxx/build_system/try/tisdk/sources/meta-arago/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils_r5.00.18.bb
> ERROR: Error executing a python function in <code>:
> ExpansionError: Failure expanding variable SRCPV, expression was ${@bb.fetch2.get_srcrev(d)}<mailto:$%7b@bb.fetch2.get_srcrev(d)%7d> which triggered exception FetchError: Fetcher failure: SRCREV was used yet no valid SCM was found in SRC_URI
> 
> ERROR: The stack trace of python calls that resulted in this exception/failure was:
> ERROR:   File "<code>", line 2, in <module>
> ERROR:
> ERROR:   File "__anon_567__home_xxx_build_system_try_tisdk_sources_oe_core_meta_classes_base_bbclass", line 203, in __anon_567__home_xxx_build_system_try_tisdk_sources_oe_core_meta_classes_base_bbclass
> ERROR:
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 293, in getVar
> ERROR:     return self.expand(value, var)
> ERROR:
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 157, in expand
> ERROR:     return self.expandWithRefs(s, varname).value
> ERROR:
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 140, in expandWithRefs
> ERROR:     s = __expand_var_regexp__.sub(varparse.var_sub, s)
> ERROR:
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 61, in var_sub
> ERROR:     var = self.d.getVar(key, True)
> ERROR:
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 293, in getVar
> ERROR:     return self.expand(value, var)
> ERROR:
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 157, in expand
> ERROR:     return self.expandWithRefs(s, varname).value
> ERROR:
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 140, in expandWithRefs
> ERROR:     s = __expand_var_regexp__.sub(varparse.var_sub, s)
> ERROR:
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 61, in var_sub
> ERROR:     var = self.d.getVar(key, True)
> ERROR:
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 293, in getVar
> ERROR:     return self.expand(value, var)
> ERROR:
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 157, in expand
> ERROR:     return self.expandWithRefs(s, varname).value
> ERROR:
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 140, in expandWithRefs
> ERROR:     s = __expand_var_regexp__.sub(varparse.var_sub, s)
> ERROR:
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 61, in var_sub
> ERROR:     var = self.d.getVar(key, True)
> ERROR:
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 293, in getVar
> ERROR:     return self.expand(value, var)
> ERROR:
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 157, in expand
> ERROR:     return self.expandWithRefs(s, varname).value
> ERROR:
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 147, in expandWithRefs
> ERROR:     raise ExpansionError(varname, s, exc)
> ERROR:
> ERROR: The code that was being executed was:
> ERROR:      0001:__anon_125__home_xxx_build_system_try_tisdk_sources_oe_core_meta_classes_staging_bbclass(d)
> ERROR:  *** 0002:__anon_567__home_xxx_build_system_try_tisdk_sources_oe_core_meta_classes_base_bbclass(d)
> ERROR:      0003:__anon_172__home_xxx_build_system_try_tisdk_sources_meta_arago_meta_arago_distro_classes_sourceipk_bbclass(d)
> ERROR:      0004:__anon_218__home_xxx_build_system_try_tisdk_sources_oe_core_meta_classes_package_bbclass(d)
> ERROR:      0005:__anon_471__home_xxx_build_system_try_tisdk_sources_oe_core_meta_classes_package_ipk_bbclass(d)
> ERROR:      0006:__anon_822__home_xxx_build_system_try_tisdk_sources_oe_core_meta_classes_insane_bbclass(d)
> ERROR: [From file: '<code>', lineno: 2, function: <module>]
> ERROR:      0199:    #
> ERROR:      0200:    override = d.getVar('SRC_URI_OVERRIDES_PACKAGE_ARCH', True)
> ERROR:      0201:    if override != '0':
> ERROR:      0202:        paths = []
> ERROR:  *** 0203:        fpaths = (d.getVar('FILESPATH', True) or '').split(':')
> ERROR:      0204:        machine = d.getVar('MACHINE', True)
> ERROR:      0205:        for p in fpaths:
> ERROR:      0206:            if os.path.basename(p) == machine and os.path.isdir(p):
> ERROR:      0207:                paths.append(p)
> ERROR: [From file: '__anon_567__home_xxx_build_system_try_tisdk_sources_oe_core_meta_classes_base_bbclass', lineno: 203, function: __anon_567__home_xxx_build_system_try_tisdk_sources_oe_core_meta_classes_base_bbclass]
> ERROR: Command execution failed: Exited with 1
> 
> Summary: There were 140 ERROR messages shown, returning a non-zero exit code.
> 
> From: Maupin, Chase [mailto:chase.maupin@ti.com]
> Sent: Wednesday, August 07, 2013 5:53 PM
> To: Sivaprasad Pala (RBEI/EAA1); Dmytriyenko, Denys
> Cc: meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
> Subject: RE: [meta-arago] error while building yocto for am335x
> 
> OK.  So it seems that maybe your IT has blocked the git protocol?  I’ve heard of companies doing that.
> 
> One thing you could try if the git URL I sent you doesn’t work is changing the protocol=git entry in the meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils.inc file to “http” instead of “git”.
> 
> You may need to bump the PR or clean the recipe work directory to make sure this change takes effect.
> 
> Sincerely,
> Chase Maupin
> Integration Team Manager
> Linux Core Product Development
> e-mail: chase.maupin@ti.com<mailto:chase.maupin@ti.com>
> phone: (214) 567-2950
> 
> For support:
> Forums - http://community.ti.com/forums/
> Wiki - http://wiki.davincidsp.com/
> 
> From: Sivaprasad Pala (RBEI/EAA1) [mailto:Sivaprasad.Pala@in.bosch.com]
> Sent: Wednesday, August 07, 2013 5:50 PM
> To: Maupin, Chase; Dmytriyenko, Denys
> Cc: meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
> Subject: RE: [meta-arago] error while building yocto for am335x
> 
> Hi,
> 
> Not able to clone.
> 
> Log please…
> 
> xxx@xxx-desktop:~/tmp/https$ git clone  git://github.com/TI-OpenLink/ti-utils
> Initialized empty Git repository in /home/xxx/tmp/https/ti-utils/.git/
> fatal: Unable to look up github.com (port 9418) (Name or service not known)
> xxx@xxx-desktop:~/tmp/https$
> 
> From: Maupin, Chase [mailto:chase.maupin@ti.com]
> Sent: Wednesday, August 07, 2013 5:47 PM
> To: Sivaprasad Pala (RBEI/EAA1); Dmytriyenko, Denys
> Cc: meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
> Subject: RE: [meta-arago] error while building yocto for am335x
> 
> So the clone you did was using the http protocol.  Can you try it using the git protocol of git://
> 
> 
> From: Sivaprasad Pala (RBEI/EAA1) [mailto:Sivaprasad.Pala@in.bosch.com]
> Sent: Wednesday, August 07, 2013 5:45 PM
> To: Maupin, Chase; Dmytriyenko, Denys
> Cc: meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
> Subject: RE: [meta-arago] error while building yocto for am335x
> 
> Hello Maupin,
> 
> I can able to clone manually in my machine.
> 
> Please find the log below.
> 
> Thanks,
> Siva
> 
> xxx@xxx-desktop:~/tmp/https$ git clone  https://github.com/TI-OpenLink/ti-utils
> Initialized empty Git repository in /home/xxx/tmp/https/ti-utils/.git/
> remote: Counting objects: 2080, done.
> remote: Compressing objects: 100% (615/615), done.
> remote: Total 2080 (delta 1490), reused 2032 (delta 1444)
> Receiving objects: 100% (2080/2080), 17.83 MiB | 102 KiB/s, done.
> Resolving deltas: 100% (1490/1490), done.
> xxx@xxx-desktop:~/tmp/https$ ls
> hello-world  ti-utils
> xxx@xxx-desktop:~/tmp/https$ cd ti-utils/
> xxx@xxx-desktop:~/tmp/https/ti-utils$ ls
> Android.mk  asi  calibrator.c  calibrator.h  COPYING  hw  ini.c  ini.h  Makefile  misc_cmds.c  nl80211.h  nvs.c  nvs.h  plt.c  plt.h  README  scripts  uim_rfkill  wl18xx_plt.c  wl18xx_plt.h  wlconf  wl_logproxy.c
> xxx@xxx-desktop:~/tmp/https/ti-utils$
> 
> From: Maupin, Chase [mailto:chase.maupin@ti.com]
> Sent: Wednesday, August 07, 2013 5:33 PM
> To: Sivaprasad Pala (RBEI/EAA1); Dmytriyenko, Denys
> Cc: meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
> Subject: RE: [meta-arago] error while building yocto for am335x
> 
> I would try cloning the ti-wifi-utils just to make sure your git setup is correct.  Where is not important right now.
> 
> 
> From: Sivaprasad Pala (RBEI/EAA1) [mailto:Sivaprasad.Pala@in.bosch.com]
> Sent: Wednesday, August 07, 2013 5:12 PM
> To: Maupin, Chase; Dmytriyenko, Denys
> Cc: meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
> Subject: RE: [meta-arago] error while building yocto for am335x
> 
> 
> What all repositories should I clone manually and in which location I should clone…
> 
> Thanks,
> From: Maupin, Chase [mailto:chase.maupin@ti.com]
> Sent: Wednesday, August 07, 2013 2:59 PM
> To: Sivaprasad Pala (RBEI/EAA1); Dmytriyenko, Denys
> Cc: meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
> Subject: RE: [meta-arago] error while building yocto for am335x
> 
> It seems you were unable to lookup github.com?  can you clone the repository manually?
> 
> 
> From: Sivaprasad Pala (RBEI/EAA1) [mailto:Sivaprasad.Pala@in.bosch.com]
> Sent: Wednesday, August 07, 2013 1:36 PM
> To: Dmytriyenko, Denys; Maupin, Chase
> Cc: meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
> Subject: RE: [meta-arago] error while building yocto for am335x
> 
> 
> Hi all,
> 
> 
> 
> Now I am following sitara training<http://processors.wiki.ti.com/index.php/Sitara_Linux_Training:_Getting_Started_with_Openembedded> process to build yocto for am335x sk-evm.
> 
> 
> 
> I am getting the python related errors I guess.
> 
> 
> 
> Please find the below log.
> 
> 
> 
> @Denys & Maupin: Thanks for the reply for both of you.
> 
> 
> 
> 
> 
> Thanks and Regards,
> 
> Siva.
> 
> 
> 
> 
> 
> Loading cache: 100% |########################################################################################################################################################################################################| ETA:  00:00:00
> 
> Loaded 48 entries from dependency cache.
> 
> ERROR: Error executing a python function in <code>:                                                                                                                                                                          | ETA:  --:--:--
> 
> ExpansionError: Failure expanding variable SRCPV, expression was ${@bb.fetch2.get_srcrev(d)}<mailto:$%7b@bb.fetch2.get_srcrev(d)%7d> which triggered exception FetchError: Fetcher failure: Fetch command failed with exit code 128, output:
> 
> fatal: Unable to look up github.com (port 9418) (Name or service not known)
> 
> 
> 
> 
> 
> ERROR: The stack trace of python calls that resulted in this exception/failure was:
> 
> ERROR:   File "<code>", line 2, in <module>
> 
> ERROR:
> 
> ERROR:   File "__anon_567__home_xxx_build_system_try_tisdk_sources_oe_core_meta_classes_base_bbclass", line 203, in __anon_567__home_xxx_build_system_try_tisdk_sources_oe_core_meta_classes_base_bbclass
> 
> ERROR:
> 
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 293, in getVar
> 
> ERROR:     return self.expand(value, var)
> 
> ERROR:
> 
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 157, in expand
> 
> ERROR:     return self.expandWithRefs(s, varname).value
> 
> ERROR:
> 
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 140, in expandWithRefs
> 
> ERROR:     s = __expand_var_regexp__.sub(varparse.var_sub, s)
> 
> ERROR:
> 
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 61, in var_sub
> 
> ERROR:     var = self.d.getVar(key, True)
> 
> ERROR:
> 
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 293, in getVar
> 
> ERROR:     return self.expand(value, var)
> 
> ERROR:
> 
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 157, in expand
> 
> ERROR:     return self.expandWithRefs(s, varname).value
> 
> ERROR:
> 
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 140, in expandWithRefs
> 
> ERROR:     s = __expand_var_regexp__.sub(varparse.var_sub, s)
> 
> ERROR:
> 
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 61, in var_sub
> 
> ERROR:     var = self.d.getVar(key, True)
> 
> ERROR:
> 
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 293, in getVar
> 
> ERROR:     return self.expand(value, var)
> 
> ERROR:
> 
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 157, in expand
> 
> ERROR:     return self.expandWithRefs(s, varname).value
> 
> ERROR:
> 
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 140, in expandWithRefs
> 
> ERROR:     s = __expand_var_regexp__.sub(varparse.var_sub, s)
> 
> ERROR:
> 
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 61, in var_sub
> 
> ERROR:     var = self.d.getVar(key, True)
> 
> ERROR:
> 
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 293, in getVar
> 
> ERROR:     return self.expand(value, var)
> 
> ERROR:
> 
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 157, in expand
> 
> ERROR:     return self.expandWithRefs(s, varname).value
> 
> ERROR:
> 
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 147, in expandWithRefs
> 
> ERROR:     raise ExpansionError(varname, s, exc)
> 
> ERROR:
> 
> ERROR: The code that was being executed was:
> 
> ERROR:      0001:__anon_125__home_xxx_build_system_try_tisdk_sources_oe_core_meta_classes_staging_bbclass(d)
> 
> ERROR:  *** 0002:__anon_567__home_xxx_build_system_try_tisdk_sources_oe_core_meta_classes_base_bbclass(d)
> 
> ERROR:      0003:__anon_172__home_xxx_build_system_try_tisdk_sources_meta_arago_meta_arago_distro_classes_sourceipk_bbclass(d)
> 
> ERROR:      0004:__anon_218__home_xxx_build_system_try_tisdk_sources_oe_core_meta_classes_package_bbclass(d)
> 
> ERROR:      0005:__anon_471__home_xxx_build_system_try_tisdk_sources_oe_core_meta_classes_package_ipk_bbclass(d)
> 
> ERROR:      0006:__anon_822__home_xxx_build_system_try_tisdk_sources_oe_core_meta_classes_insane_bbclass(d)
> 
> ERROR: [From file: '<code>', lineno: 2, function: <module>]
> 
> ERROR:      0199:    #
> 
> ERROR:      0200:    override = d.getVar('SRC_URI_OVERRIDES_PACKAGE_ARCH', True)
> 
> ERROR:      0201:    if override != '0':
> 
> ERROR:      0202:        paths = []
> 
> ERROR:  *** 0203:        fpaths = (d.getVar('FILESPATH', True) or '').split(':')
> 
> ERROR:      0204:        machine = d.getVar('MACHINE', True)
> 
> ERROR:      0205:        for p in fpaths:
> 
> ERROR:      0206:            if os.path.basename(p) == machine and os.path.isdir(p):
> 
> ERROR:      0207:                paths.append(p)
> 
> ERROR: [From file: '__anon_567__home_xxx_build_system_try_tisdk_sources_oe_core_meta_classes_base_bbclass', lineno: 203, function: __anon_567__home_xxx_build_system_try_tisdk_sources_oe_core_meta_classes_base_bbclass]
> 
> ERROR: Failed to parse recipe: /home/xxx/build_system/try/tisdk/sources/meta-arago/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils_r5.00.18.bb
> 
> ERROR: Error executing a python function in <code>:
> 
> ExpansionError: Failure expanding variable SRCPV, expression was ${@bb.fetch2.get_srcrev(d)}<mailto:$%7b@bb.fetch2.get_srcrev(d)%7d> which triggered exception FetchError: Fetcher failure: Fetch command failed with exit code 128, output:
> 
> fatal: Unable to look up github.com (port 9418) (Name or service not known)
> 
> 
> 
> 
> 
> ERROR: The stack trace of python calls that resulted in this exception/failure was:
> 
> ERROR:   File "<code>", line 2, in <module>
> 
> ERROR:
> 
> ERROR:   File "__anon_567__home_xxx_build_system_try_tisdk_sources_oe_core_meta_classes_base_bbclass", line 203, in __anon_567__home_xxx_build_system_try_tisdk_sources_oe_core_meta_classes_base_bbclass
> 
> ERROR:
> 
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 293, in getVar
> 
> ERROR:     return self.expand(value, var)
> 
> ERROR:
> 
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 157, in expand
> 
> ERROR:     return self.expandWithRefs(s, varname).value
> 
> ERROR:
> 
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 140, in expandWithRefs
> 
> ERROR:     s = __expand_var_regexp__.sub(varparse.var_sub, s)
> 
> ERROR:
> 
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 61, in var_sub
> 
> ERROR:     var = self.d.getVar(key, True)
> 
> ERROR:
> 
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 293, in getVar
> 
> ERROR:     return self.expand(value, var)
> 
> ERROR:
> 
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 157, in expand
> 
> ERROR:     return self.expandWithRefs(s, varname).value
> 
> ERROR:
> 
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 140, in expandWithRefs
> 
> ERROR:     s = __expand_var_regexp__.sub(varparse.var_sub, s)
> 
> ERROR:
> 
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 61, in var_sub
> 
> ERROR:     var = self.d.getVar(key, True)
> 
> ERROR:
> 
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 293, in getVar
> 
> ERROR:     return self.expand(value, var)
> 
> ERROR:
> 
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 157, in expand
> 
> ERROR:     return self.expandWithRefs(s, varname).value
> 
> ERROR:
> 
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 140, in expandWithRefs
> 
> ERROR:     s = __expand_var_regexp__.sub(varparse.var_sub, s)
> 
> ERROR:
> 
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 61, in var_sub
> 
> ERROR:     var = self.d.getVar(key, True)
> 
> ERROR:
> 
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 293, in getVar
> 
> ERROR:     return self.expand(value, var)
> 
> ERROR:
> 
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 157, in expand
> 
> ERROR:     return self.expandWithRefs(s, varname).value
> 
> ERROR:
> 
> ERROR:   File "/home/xxx/build_system/try/tisdk/sources/bitbake/lib/bb/data_smart.py", line 147, in expandWithRefs
> 
> ERROR:     raise ExpansionError(varname, s, exc)
> 
> ERROR:
> 
> ERROR: The code that was being executed was:
> 
> ERROR:      0001:__anon_125__home_xxx_build_system_try_tisdk_sources_oe_core_meta_classes_staging_bbclass(d)
> 
> ERROR:  *** 0002:__anon_567__home_xxx_build_system_try_tisdk_sources_oe_core_meta_classes_base_bbclass(d)
> 
> ERROR:      0003:__anon_172__home_xxx_build_system_try_tisdk_sources_meta_arago_meta_arago_distro_classes_sourceipk_bbclass(d)
> 
> ERROR:      0004:__anon_218__home_xxx_build_system_try_tisdk_sources_oe_core_meta_classes_package_bbclass(d)
> 
> ERROR:      0005:__anon_471__home_xxx_build_system_try_tisdk_sources_oe_core_meta_classes_package_ipk_bbclass(d)
> 
> ERROR:      0006:__anon_822__home_xxx_build_system_try_tisdk_sources_oe_core_meta_classes_insane_bbclass(d)
> 
> ERROR: [From file: '<code>', lineno: 2, function: <module>]
> 
> ERROR:      0199:    #
> 
> ERROR:      0200:    override = d.getVar('SRC_URI_OVERRIDES_PACKAGE_ARCH', True)
> 
> ERROR:      0201:    if override != '0':
> 
> ERROR:      0202:        paths = []
> 
> ERROR:  *** 0203:        fpaths = (d.getVar('FILESPATH', True) or '').split(':')
> 
> ERROR:      0204:        machine = d.getVar('MACHINE', True)
> 
> ERROR:      0205:        for p in fpaths:
> 
> ERROR:      0206:            if os.path.basename(p) == machine and os.path.isdir(p):
> 
> ERROR:      0207:                paths.append(p)
> 
> ERROR: [From file: '__anon_567__home_xxx_build_system_try_tisdk_sources_oe_core_meta_classes_base_bbclass', lineno: 203, function: __anon_567__home_xxx_build_system_try_tisdk_sources_oe_core_meta_classes_base_bbclass]
> 
> ERROR: Command execution failed: Exited with 1
> 
> 
> 
> Summary: There were 140 ERROR messages shown, returning a non-zero exit code.
> 
> xxx@xxx-desktop:~/build_system/try/tisdk/build$
> 
> 
> 
> 
> 
> 
> 
> -----Original Message-----
> From: Denys Dmytriyenko [mailto:denys@ti.com]
> Sent: Thursday, August 01, 2013 7:48 PM
> To: Maupin, Chase
> Cc: Sivaprasad Pala (RBEI/EAA1); meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
> Subject: Re: [meta-arago] error while building yocto for am335x
> 
> 
> 
> On Thu, Aug 01, 2013 at 08:57:00AM +0000, Maupin, Chase wrote:
> 
> > >-----Original Message-----
> 
> > >From: Sivaprasad Pala (RBEI/EAA1)
> 
> > >[mailto:Sivaprasad.Pala@in.bosch.com]
> 
> > >Sent: Thursday, August 01, 2013 2:17 PM
> 
> > >To: Maupin, Chase; meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
> 
> > >Subject: RE: [meta-arago] error while building yocto for am335x
> 
> > >
> 
> > >Hi,
> 
> > >
> 
> > >latest commit id I took from site and replaced SRCREV with latest
> 
> > >one.
> 
> > >Even I am getting the error "Failure expanding variable S:"
> 
> > >And "SRCPV, expression was ${@bb.fetch2.get_srcrev(d)}<mailto:$%7b@bb.fetch2.get_srcrev(d)%7d>"
> 
> >
> 
> > Did you replace the SRCREV in the bbappend file at
> 
> > ./meta-arago/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
> 
> 
> 
> BTW, in the original email the error was at ltp-ddt-legacy. But in general,
> 
> all AUTOREVs should be replaced, if there are problems with git access. You'll
> 
> still get issues downloading from git, but at least it will parse.
> 
> 
> 
> 
> 
> > >And,
> 
> > >
> 
> > >I am trying to setup "git proxy settings".
> 
> > >Under corporate firewall I am unable to use command "git clone
> 
> > >git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-
> 
> > >2.6.git"
> 
> > >What configurations should I need to do for using
> 
> > >"git://git.kernel.org"
> 
> >
> 
> > First you need to create a proxy command file:
> 
> > vi ~/git-proxy.sh
> 
> >     #!/bin/bash
> 
> >     exec env corkscrew <your proxy host> <your proxy port> $*
> 
> > chmod +x ~/git-proxy.sh
> 
> > Then set git to use this proxy script
> 
> >     git config --global core.gitproxy “~/git-proxy.sh”
> 
> 
> 
> Or export GITPROXYCOMMAND=~/git-proxy.sh
> 
> 
> 
> 
> 
> > You need to get the proxy host and port from your IT department.
> 
> >
> 
> > >
> 
> > >Thanks for the reply.
> 
> > >
> 
> > >Regards,
> 
> > >Siva.
> 
> > >
> 
> > >
> 
> > >-----Original Message-----
> 
> > >From: Maupin, Chase [mailto:chase.maupin@ti.com]
> 
> > >Sent: Thursday, August 01, 2013 1:39 PM
> 
> > >To: Sivaprasad Pala (RBEI/EAA1); meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
> 
> > >Subject: RE: [meta-arago] error while building yocto for am335x
> 
> > >
> 
> > >Ltp-ddt is an autorev recipe which means that it must read the
> 
> > >current latest commit id in order to parse.  This looks like you
> 
> > >are having an issue with git reaching the repository. Can you
> 
> > >check your git proxy settings?
> 
> > >
> 
> > >>-----Original Message-----
> 
> > >>From: meta-arago-bounces@arago-project.org<mailto:meta-arago-bounces@arago-project.org> [mailto:meta-arago-
> 
> > >>bounces@arago-project.org<mailto:bounces@arago-project.org>] On Behalf Of siva
> 
> > >>Sent: Thursday, August 01, 2013 11:04 AM
> 
> > >>To: meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
> 
> > >>Subject: [meta-arago] error while building yocto for am335x
> 
> > >>
> 
> > >>hello all,
> 
> > >>
> 
> > >>I followed steps mentioned in below wiki.
> 
> > >>http://arago-
> 
> > >>project.org/wiki/index.php/Setting_Up_Build_Environment
> 
> > >>
> 
> > >>I am wandering why the build is going to fail.
> 
> > >>I tried in many ways to resolve it.(changing the definition of
> 
> > >>variable etc.)
> 
> > >>
> 
> > >>Please find the below log.
> 
> > >>
> 
> > >>Thanks,
> 
> > >>Siva.
> 
> > >>
> 
> > >>
> 
> > >>xxxxx@xxxxx:~/tisdk/build$ MACHINE=am335x-evm bitbake core-image-
> 
> > >>minimal
> 
> > >>Pseudo is not present but is required, building this first before
> 
> > >>the main build
> 
> > >>Loading cache: 100%
> 
> > >>|################################################################
> 
> > >#
> 
> > >>#############
> 
> > >>######################################################|
> 
> > >>ETA:  00:00:00
> 
> > >>Loaded 72 entries from dependency cache.
> 
> > >>NOTE: Error during finalise of/home/xxxxx/tisdk/sources/meta-
> 
> > >>arago/
> 
> > >>meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bb-
> 
> > >-
> 
> > >>:--
> 
> > >>
> 
> > >>ERROR: ExpansionError during
> 
> > >>parsing/home/xxxxx/tisdk/sources/meta-arago/
> 
> > >>meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bb:
> 
> > >>
> 
> > >>Failure expanding variable S: ExpansionError: Failure expanding
> 
> > >>variable
> 
> > >>SRCPV, expression was ${@bb.fetch2.get_srcrev(d)}<mailto:$%7b@bb.fetch2.get_srcrev(d)%7d> which triggered
> 
> > >>exception
> 
> > >>FetchError: Fetcher failure: Fetch command failed with exit code
> 
> > >>128, output:
> 
> > >>fatal: unable to connect to arago-project.org:
> 
> > >>arago-project.org: Name or service not known
> 
> > >>
> 
> > >>
> 
> > >>ERROR: Command execution failed: Exited with 1
> 
> > >>
> 
> > >>Summary: There were 2 ERROR messages shown,
> 
> > >>returning a non-zero exit code.
> 
> > >>xxxxx@xxxxx:~/tisdk/build$
> 
> > >>
> 
> > >>_______________________________________________
> 
> > >>meta-arago mailing list
> 
> > >>meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
> 
> > >>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 
> > _______________________________________________
> 
> > meta-arago mailing list
> 
> > meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
> 
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago




