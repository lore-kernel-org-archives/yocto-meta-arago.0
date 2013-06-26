Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 48E9A52992
	for <meta-arago@arago-project.org>;
	Wed, 26 Jun 2013 13:48:10 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5QDm9cX005516
	for <meta-arago@arago-project.org>; Wed, 26 Jun 2013 08:48:09 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5QDm9u3003311
	for <meta-arago@arago-project.org>; Wed, 26 Jun 2013 08:48:09 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 26 Jun 2013 08:48:09 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r5QDm9SW011268;
	Wed, 26 Jun 2013 08:48:09 -0500
Date: Wed, 26 Jun 2013 09:48:08 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20130626134808.GD27031@edge>
References: <1372244597-11600-1-git-send-email-heroor@ti.com>
	<1372244597-11600-2-git-send-email-heroor@ti.com>
	<7D46E86EC0A8354091174257B2FED10159617417@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED10159617417@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 1/2] meta-arago-distro: recipes-kernel - Overlay Arago info
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
X-List-Received-Date: Wed, 26 Jun 2013 13:48:10 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jun 26, 2013 at 12:53:51PM +0000, Maupin, Chase wrote:
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Heroor, Siddharth
> >Sent: Wednesday, June 26, 2013 6:03 AM
> >To: meta-arago@arago-project.org
> >Subject: [meta-arago] [PATCH 1/2] meta-arago-distro: recipes-
> >kernel - Overlay Arago info
> >
> >* Based of linux-ti-staging_3.8.bbappend
> >
> >Signed-off-by: Siddharth Heroor <heroor@ti.com>
> >cc: Mrinmayee Hingolikar <mrinmayee@ti.com>
> >---
> > .../linux/linux-ti-glsdk_3.8.bbappend              |   17
> >+++++++++++++++++
> > 1 files changed, 17 insertions(+), 0 deletions(-)
> > create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-
> >ti-glsdk_3.8.bbappend
> >
> >diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-
> >glsdk_3.8.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-
> >ti-glsdk_3.8.bbappend
> >new file mode 100644
> >index 0000000..b20c63a
> >--- /dev/null
> >+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-
> >glsdk_3.8.bbappend
> >@@ -0,0 +1,17 @@
> >+MACHINE_KERNEL_PR_append = "-arago6"
> 
> Maybe I'm missing something, but I didn't remember seeing the patch that 
> added linux-ti-glsdk recipe to be appended in the first place.

Correct, a dangling bbappend will break the build.


> Also, why start with arago6?
> 
> >+
> >+FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
> >+
> >+require copy-defconfig.inc
> >+
> >+KERNEL_LOCALVERSION = "-g${@d.getVar('SRCPV',
> >True).partition('+')[2][0:7]}"
> >+
> >+# The below lines are overlayed until the LOCALVERSION change is
> >merged into
> >+# the oe-core danny branch. Update: not coming to danny, keep
> >until dylan.
> >+kernel_do_configure_prepend() {
> >+    if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
> >+    then
> >+        echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
> >+        echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
> >+    fi
> >+}
> >--
> >1.7.0.4
> >
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

