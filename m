Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id A66FE529DC
	for <meta-arago@arago-project.org>;
	Thu,  1 Aug 2013 14:17:42 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r71EHfaQ022914;
	Thu, 1 Aug 2013 09:17:41 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r71EHfaY002413;
	Thu, 1 Aug 2013 09:17:41 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 1 Aug 2013 09:17:41 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r71EHeeQ004194;
	Thu, 1 Aug 2013 09:17:41 -0500
Date: Thu, 1 Aug 2013 10:17:39 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20130801141739.GH13691@edge>
References: <1366828154-17755-1-git-send-email-hzhang@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C4328F5@DFLE08.ent.ti.com>
	<ECA334CFBA16F74DB2C66A2F1181F4D63C2B1F41@DLEE09.ent.ti.com>
	<20130424194115.GR12173@edge>
	<loom.20130801T071150-638@post.gmane.org>
	<7D46E86EC0A8354091174257B2FED101596876B2@DLEE11.ent.ti.com>
	<F2E05BCE6D875B4AAC726FD84CBB8F1322266D84DE@SGPMBX02.APAC.bosch.com>
	<7D46E86EC0A8354091174257B2FED101596877B8@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED101596877B8@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>,
	"Sivaprasad Pala \(RBEI/EAA1\)" <Sivaprasad.Pala@in.bosch.com>
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
X-List-Received-Date: Thu, 01 Aug 2013 14:17:43 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Aug 01, 2013 at 08:57:00AM +0000, Maupin, Chase wrote:
> >-----Original Message-----
> >From: Sivaprasad Pala (RBEI/EAA1)
> >[mailto:Sivaprasad.Pala@in.bosch.com]
> >Sent: Thursday, August 01, 2013 2:17 PM
> >To: Maupin, Chase; meta-arago@arago-project.org
> >Subject: RE: [meta-arago] error while building yocto for am335x
> >
> >Hi,
> >
> >latest commit id I took from site and replaced SRCREV with latest
> >one.
> >Even I am getting the error "Failure expanding variable S:"
> >And "SRCPV, expression was ${@bb.fetch2.get_srcrev(d)}"
> 
> Did you replace the SRCREV in the bbappend file at 
> ./meta-arago/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend

BTW, in the original email the error was at ltp-ddt-legacy. But in general, 
all AUTOREVs should be replaced, if there are problems with git access. You'll 
still get issues downloading from git, but at least it will parse.


> >And,
> >
> >I am trying to setup "git proxy settings".
> >Under corporate firewall I am unable to use command "git clone
> >git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-
> >2.6.git"
> >What configurations should I need to do for using
> >"git://git.kernel.org"
> 
> First you need to create a proxy command file:
> vi ~/git-proxy.sh
> 	#!/bin/bash
> 	exec env corkscrew <your proxy host> <your proxy port> $*
> chmod +x ~/git-proxy.sh
> Then set git to use this proxy script
> 	git config --global core.gitproxy “~/git-proxy.sh”

Or export GITPROXYCOMMAND=~/git-proxy.sh


> You need to get the proxy host and port from your IT department.
> 
> >
> >Thanks for the reply.
> >
> >Regards,
> >Siva.
> >
> >
> >-----Original Message-----
> >From: Maupin, Chase [mailto:chase.maupin@ti.com]
> >Sent: Thursday, August 01, 2013 1:39 PM
> >To: Sivaprasad Pala (RBEI/EAA1); meta-arago@arago-project.org
> >Subject: RE: [meta-arago] error while building yocto for am335x
> >
> >Ltp-ddt is an autorev recipe which means that it must read the
> >current latest commit id in order to parse.  This looks like you
> >are having an issue with git reaching the repository. Can you
> >check your git proxy settings?
> >
> >>-----Original Message-----
> >>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >>bounces@arago-project.org] On Behalf Of siva
> >>Sent: Thursday, August 01, 2013 11:04 AM
> >>To: meta-arago@arago-project.org
> >>Subject: [meta-arago] error while building yocto for am335x
> >>
> >>hello all,
> >>
> >>I followed steps mentioned in below wiki.
> >>http://arago-
> >>project.org/wiki/index.php/Setting_Up_Build_Environment
> >>
> >>I am wandering why the build is going to fail.
> >>I tried in many ways to resolve it.(changing the definition of
> >>variable etc.)
> >>
> >>Please find the below log.
> >>
> >>Thanks,
> >>Siva.
> >>
> >>
> >>xxxxx@xxxxx:~/tisdk/build$ MACHINE=am335x-evm bitbake core-image-
> >>minimal
> >>Pseudo is not present but is required, building this first before
> >>the main build
> >>Loading cache: 100%
> >>|################################################################
> >#
> >>#############
> >>######################################################|
> >>ETA:  00:00:00
> >>Loaded 72 entries from dependency cache.
> >>NOTE: Error during finalise of/home/xxxxx/tisdk/sources/meta-
> >>arago/
> >>meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bb-
> >-
> >>:--
> >>
> >>ERROR: ExpansionError during
> >>parsing/home/xxxxx/tisdk/sources/meta-arago/
> >>meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bb:
> >>
> >>Failure expanding variable S: ExpansionError: Failure expanding
> >>variable
> >>SRCPV, expression was ${@bb.fetch2.get_srcrev(d)} which triggered
> >>exception
> >>FetchError: Fetcher failure: Fetch command failed with exit code
> >>128, output:
> >>fatal: unable to connect to arago-project.org:
> >>arago-project.org: Name or service not known
> >>
> >>
> >>ERROR: Command execution failed: Exited with 1
> >>
> >>Summary: There were 2 ERROR messages shown,
> >>returning a non-zero exit code.
> >>xxxxx@xxxxx:~/tisdk/build$
> >>
> >>_______________________________________________
> >>meta-arago mailing list
> >>meta-arago@arago-project.org
> >>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

