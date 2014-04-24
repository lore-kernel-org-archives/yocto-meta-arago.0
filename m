Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 14A0F52998
	for <meta-arago@arago-project.org>;
	Thu, 24 Apr 2014 14:54:53 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s3OEsqVf025826;
	Thu, 24 Apr 2014 09:54:52 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3OEsqtG018127;
	Thu, 24 Apr 2014 09:54:52 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 24 Apr 2014 09:54:52 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3OEsqgt021967;
	Thu, 24 Apr 2014 09:54:52 -0500
Date: Thu, 24 Apr 2014 10:54:51 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20140424145451.GI18053@edge>
References: <1398304280-15426-1-git-send-email-denis@denix.org>
	<1398304280-15426-8-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED1015CFB2056@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015CFB2056@DLEE11.ent.ti.com>
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
X-List-Received-Date: Thu, 24 Apr 2014 14:54:53 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Apr 24, 2014 at 12:36:35PM +0000, Maupin, Chase wrote:
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> >Sent: Wednesday, April 23, 2014 8:51 PM
> >To: meta-arago@arago-project.org
> >Subject: [meta-arago] [PATCH 8/8] linux-ti-staging: disable
> >AUTOREV
> >
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> > meta-arago-distro/recipes-kernel/linux/linux-ti-
> >staging_3.12.bbappend | 4 +---
> > 1 file changed, 1 insertion(+), 3 deletions(-)
> >
> >diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-
> >staging_3.12.bbappend b/meta-arago-distro/recipes-
> >kernel/linux/linux-ti-staging_3.12.bbappend
> >index f99482c..2a6f090 100644
> >--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-
> >staging_3.12.bbappend
> >+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-
> >staging_3.12.bbappend
> >@@ -1,11 +1,9 @@
> >-MACHINE_KERNEL_PR_append = "-arago0"
> >+MACHINE_KERNEL_PR_append = "-arago1"
> >
> > FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
> >
> > require copy-defconfig.inc
> >
> >-SRCREV = "${AUTOREV}"
> 
> Any reason not to autorev to pickup the latest stable releases?

AUTOREVs are evil!

It just pissed me off yesterday, when I was debugging something and it decided 
to trigger almost a complete rebuild, because kernel just got updated...


> > KERNEL_LOCALVERSION = "-g${@d.getVar('SRCPV',
> >True).partition('+')[2][0:7]}"
> >
> > kernel_do_configure_prepend() {
> >--
> >1.9.2
> >
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

