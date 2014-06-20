Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 9248B52A63
	for <meta-arago@arago-project.org>;
	Fri, 20 Jun 2014 19:33:29 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5KJXTin005698;
	Fri, 20 Jun 2014 14:33:29 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5KJXT8J024536;
	Fri, 20 Jun 2014 14:33:29 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 20 Jun 2014 14:33:28 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5KJXSj1014784;
	Fri, 20 Jun 2014 14:33:28 -0500
Date: Fri, 20 Jun 2014 15:33:28 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20140620193328.GG1825@edge>
References: <1403287009-11256-1-git-send-email-denis@denix.org>
	<1403287009-11256-13-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED1015D0D936D@DLEE11.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C6D63CF@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C6D63CF@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 12/19] hostap-daemon: specify the branch being used for this version
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
X-List-Received-Date: Fri, 20 Jun 2014 19:33:29 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Yeah, if we can get someone from Wireless to confirm that would be great. I 
just picked the first branch that contained the required commit ID.


On Fri, Jun 20, 2014 at 07:28:43PM +0000, Cooper Jr., Franklin wrote:
> I'm not familiar with the git repos for these wireless packages. Do we need 
> our wireless friends to confirm these branches? Taking a quick glance it 
> looks like this tag was based on the android_jb_mr1_39 branch but 
> mbss_suspend is forked off of android_jb_mr1_39.
> 
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Maupin, Chase
> > Sent: Friday, June 20, 2014 2:09 PM
> > To: Denys Dmytriyenko; meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH 12/19] hostap-daemon: specify the branch
> > being used for this version
> > 
> > Acked-by: Chase Maupin <chase.maupin@ti.com>
> > 
> > >-----Original Message-----
> > >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > >bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > >Sent: Friday, June 20, 2014 12:57 PM
> > >To: meta-arago@arago-project.org
> > >Subject: [meta-arago] [PATCH 12/19] hostap-daemon: specify the branch
> > >being used for this version
> > >
> > >From: Denys Dmytriyenko <denys@ti.com>
> > >
> > >Bitbake fetcher now requires the branch to be specified when SRCREV is
> > >not on master
> > >
> > >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > >---
> > > .../recipes-connectivity/hostap/hostap-daemon-wl18xx_r8.a8.10.bb
> > >| 1 +
> > > meta-arago-extras/recipes-connectivity/hostap/hostap.inc
> > >| 2 +-
> > > 2 files changed, 2 insertions(+), 1 deletion(-)
> > >
> > >diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-
> > >daemon-wl18xx_r8.a8.10.bb b/meta-arago-extras/recipes-
> > >connectivity/hostap/hostap-daemon-wl18xx_r8.a8.10.bb
> > >index acd3c29..cd5d8d3 100644
> > >--- a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-
> > >wl18xx_r8.a8.10.bb
> > >+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-
> > >wl18xx_r8.a8.10.bb
> > >@@ -16,6 +16,7 @@ PV = "2.0-devel-ti"
> > >
> > > # Tag: ol_r8.a8.10
> > > SRCREV = "257ab333aad993b4be81808524bc0d939c276058"
> > >+BRANCH = "mbss_suspend"
> > >
> > > PROVIDES += "hostap-daemon"
> > > RPROVIDES_${PN} += "hostap-daemon"
> > >diff --git a/meta-arago-extras/recipes- connectivity/hostap/hostap.inc
> > >b/meta-arago-extras/recipes- connectivity/hostap/hostap.inc index
> > >9be2585..15e82d5 100644
> > >--- a/meta-arago-extras/recipes-connectivity/hostap/hostap.inc
> > >+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap.inc
> > >@@ -18,7 +18,7 @@ INITSCRIPT_NAME="hostapd"
> > >
> > > CONFFILES_${PN} += "${sysconfdir}/hostapd.conf"
> > >
> > >-SRC_URI = "git://github.com/TI-OpenLink/hostap.git;protocol=git \
> > >+SRC_URI = "git://github.com/TI-
> > >OpenLink/hostap.git;protocol=git;branch=${BRANCH} \
> > >            file://0001-hostapd-change-conf-file-for-better-oob-
> > >startup.patch;patchdir=.. \
> > >            file://defconfig \
> > > 	       file://init"
> > >--
> > >2.0.0
> > >
> > >_______________________________________________
> > >meta-arago mailing list
> > >meta-arago@arago-project.org
> > >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

