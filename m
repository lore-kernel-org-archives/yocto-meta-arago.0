Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id D452152A5F
	for <meta-arago@arago-project.org>;
	Fri, 23 Aug 2013 20:28:41 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7NKSfcl018383;
	Fri, 23 Aug 2013 15:28:41 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7NKSfTs024049;
	Fri, 23 Aug 2013 15:28:41 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 23 Aug 2013 15:28:40 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7NKSeku019057;
	Fri, 23 Aug 2013 15:28:40 -0500
Date: Fri, 23 Aug 2013 16:28:40 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20130823202840.GE27308@edge>
References: <1377289002-20230-1-git-send-email-denis@denix.org>
	<1377289002-20230-4-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED101596DF2C7@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED101596DF2C7@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 4/4] u-boot-ti-staging: enable LOCALVERSION and	AUTOREV
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
X-List-Received-Date: Fri, 23 Aug 2013 20:28:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Aug 23, 2013 at 08:24:43PM +0000, Maupin, Chase wrote:
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> >Sent: Friday, August 23, 2013 3:17 PM
> >To: meta-arago@arago-project.org
> >Subject: [meta-arago] [PATCH 4/4] u-boot-ti-staging: enable
> >LOCALVERSION and AUTOREV
> >
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> > .../recipes-bsp/u-boot/u-boot-ti-staging_git.bbappend     | 15
> >+++++++++++++++
> > 1 file changed, 15 insertions(+)
> > create mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot-
> >ti-staging_git.bbappend
> >
> >diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-
> >staging_git.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-
> >boot-ti-staging_git.bbappend
> >new file mode 100644
> >index 0000000..754d625
> >--- /dev/null
> >+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-
> >staging_git.bbappend
> >@@ -0,0 +1,15 @@
> >+PR_append = "-arago0"
> >+
> >+SRCREV = "${AUTOREV}"
> >+
> >+UBOOT_LOCALVERSION = "-g${@d.getVar('SRCPV',
> >True).partition('+')[2][0:7]}"
> >+
> >+# the lines below can be removed once the U-Boot LOCALVERSION
> >patches are merged
> >+# into the oe-core danny branch. Update: not coming to danny,
> >wait for dylan.
> 
> Still needed?

Neither linux kernel nor u-boot picked up LOCALVERSION patches upstream... 
Should probably remove comment altogether.


> >+do_compile_prepend() {
> >+    if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
> >+    then
> >+        echo ${UBOOT_LOCALVERSION} > ${B}/.scmversion
> >+        echo ${UBOOT_LOCALVERSION} > ${S}/.scmversion
> >+    fi
> >+}
> >--
> >1.8.3.2
> >
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

