Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 8B3BC52998
	for <meta-arago@arago-project.org>;
	Thu, 24 Apr 2014 15:08:56 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s3OF8tSn018811;
	Thu, 24 Apr 2014 10:08:55 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3OF8tgv028411;
	Thu, 24 Apr 2014 10:08:55 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 24 Apr 2014 10:08:55 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3OF8tqT011814;
	Thu, 24 Apr 2014 10:08:55 -0500
Date: Thu, 24 Apr 2014 11:08:54 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20140424150854.GL18053@edge>
References: <1398304280-15426-1-git-send-email-denis@denix.org>
	<1398304280-15426-8-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED1015CFB2056@DLEE11.ent.ti.com>
	<20140424145451.GI18053@edge>
	<7D46E86EC0A8354091174257B2FED1015CFB2FD5@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015CFB2FD5@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 8/8] linux-ti-staging: disable AUTOREV
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
X-List-Received-Date: Thu, 24 Apr 2014 15:08:56 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Apr 24, 2014 at 10:55:44AM -0400, Maupin, Chase wrote:
> >-----Original Message-----
> >From: Dmytriyenko, Denys
> >Sent: Thursday, April 24, 2014 9:55 AM
> >To: Maupin, Chase
> >Cc: Denys Dmytriyenko; meta-arago@arago-project.org
> >Subject: Re: [meta-arago] [PATCH 8/8] linux-ti-staging: disable
> >AUTOREV
> >
> >On Thu, Apr 24, 2014 at 12:36:35PM +0000, Maupin, Chase wrote:
> >> >-----Original Message-----
> >> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >> >bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> >> >Sent: Wednesday, April 23, 2014 8:51 PM
> >> >To: meta-arago@arago-project.org
> >> >Subject: [meta-arago] [PATCH 8/8] linux-ti-staging: disable
> >> >AUTOREV
> >> >
> >> >From: Denys Dmytriyenko <denys@ti.com>
> >> >
> >> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >> >---
> >> > meta-arago-distro/recipes-kernel/linux/linux-ti-
> >> >staging_3.12.bbappend | 4 +---
> >> > 1 file changed, 1 insertion(+), 3 deletions(-)
> >> >
> >> >diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-
> >> >staging_3.12.bbappend b/meta-arago-distro/recipes-
> >> >kernel/linux/linux-ti-staging_3.12.bbappend
> >> >index f99482c..2a6f090 100644
> >> >--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-
> >> >staging_3.12.bbappend
> >> >+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-
> >> >staging_3.12.bbappend
> >> >@@ -1,11 +1,9 @@
> >> >-MACHINE_KERNEL_PR_append = "-arago0"
> >> >+MACHINE_KERNEL_PR_append = "-arago1"
> >> >
> >> > FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
> >> >
> >> > require copy-defconfig.inc
> >> >
> >> >-SRCREV = "${AUTOREV}"
> >>
> >> Any reason not to autorev to pickup the latest stable releases?
> >
> >AUTOREVs are evil!
> 
> :)
> 
> >
> >It just pissed me off yesterday, when I was debugging something
> >and it decided
> >to trigger almost a complete rebuild, because kernel just got
> >updated...
> 
> OK.  Let's not forget to bump regularly then.

It's 3.12 line - I've already bumped to 3.12.17 and 3.12.18 was released 
yesterday. I'll keep bumping stable versions.
But most probably we'll switch to 3.14/3.15 by the time we'll be doing any 
Dora-based releases... So keeping 3.12 AUTOREV-ed doesn't make much sense now.


> >> > KERNEL_LOCALVERSION = "-g${@d.getVar('SRCPV',
> >> >True).partition('+')[2][0:7]}"
> >> >
> >> > kernel_do_configure_prepend() {
> >> >--
> >> >1.9.2
> >> >
> >> >_______________________________________________
> >> >meta-arago mailing list
> >> >meta-arago@arago-project.org
> >> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >> _______________________________________________
> >> meta-arago mailing list
> >> meta-arago@arago-project.org
> >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

