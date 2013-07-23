Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 0CF5B52A98
	for <meta-arago@arago-project.org>;
	Tue, 23 Jul 2013 16:54:59 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6NGsvCs001766
	for <meta-arago@arago-project.org>; Tue, 23 Jul 2013 11:54:57 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6NGsvbx012030
	for <meta-arago@arago-project.org>; Tue, 23 Jul 2013 11:54:57 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 23 Jul 2013 11:54:57 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r6NGsvHG013399;
	Tue, 23 Jul 2013 11:54:57 -0500
Date: Tue, 23 Jul 2013 12:54:56 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20130723165456.GL31158@edge>
References: <1373574210-4398-1-git-send-email-fcooper@ti.com>
	<1373574210-4398-5-git-send-email-fcooper@ti.com>
	<7D46E86EC0A8354091174257B2FED101596577C0@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED101596577C0@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper Jr.,
	Franklin" <fcooper@ti.com>
Subject: Re: [master & danny][PATCH 5/5] packagegroup-arago-tisdk-matrix: Clock app doesnt work on	older boards.
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
X-List-Received-Date: Tue, 23 Jul 2013 16:54:59 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jul 16, 2013 at 01:03:00PM +0000, Maupin, Chase wrote:
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> >Sent: Thursday, July 11, 2013 3:24 PM
> >To: meta-arago@arago-project.org
> >Cc: Cooper Jr., Franklin
> >Subject: [meta-arago] [master & danny][PATCH 5/5] packagegroup-
> >arago-tisdk-matrix: Clock app doesnt work on older boards.
> >
> >* Don't install by default since some older boards don't support
> >the Clock demo.
> 
> How do the older boards change their cpufreq settings?

Is there frequency scaling on am180x?


> >Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> >---
> > .../packagegroup-arago-tisdk-matrix.bb             |    5 +++--
> > 1 files changed, 3 insertions(+), 2 deletions(-)
> >
> >diff --git a/meta-arago-distro/recipes-
> >core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-
> >arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-
> >matrix.bb
> >index f52eb4a..287baf9 100644
> >--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> >arago-tisdk-matrix.bb
> >+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> >arago-tisdk-matrix.bb
> >@@ -1,6 +1,6 @@
> > DESCRIPTION = "Task to include Matrix v2"
> > LICENSE = "MIT"
> >-PR = "r19"
> >+PR = "r20"
> >
> > inherit packagegroup
> >
> >@@ -23,7 +23,6 @@ MATRIX_COMMON_APPS = "              \
> >     matrix-gui-settings-demos       \
> >     matrix-gui-usb-demos            \
> >     matrix-gui-submenus-ethernet    \
> >-    matrix-gui-clocks               \
> > "
> >
> > MATRIX_QT_APPS = "                  \
> >@@ -61,6 +60,7 @@ MATRIX_APPS_append_ti33x = "        \
> >                                     \
> >     matrix-gui-generic-pm           \
> >     matrix-gui-pm-demos-suspend     \
> >+    matrix-gui-clocks               \
> >                                     \
> >     matrix-gui-wifi-demos           \
> >     matrix-gui-bluetooth-demos      \
> >@@ -97,6 +97,7 @@ MATRIX_APPS_append_am37x-evm = "    \
> >     matrix-gui-camera-loopback      \
> >     matrix-gui-v4l2-demos           \
> >     matrix-gui-display-control      \
> >+    matrix-gui-clocks               \
> >                                     \
> >     matrix-gui-wifi-demos           \
> >     matrix-gui-bluetooth-demos      \
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

