Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC39C46467
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 21:41:18 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.219.1667598073481496723
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 14:41:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EAABD40D84
	for <meta-arago@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:41:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IvjwvFad822U for <meta-arago@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 21:41:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E0AC440D80
	for <meta-arago@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:41:12 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 7255816367D
	for <meta-arago@lists.yoctoproject.org>; Fri,  4 Nov 2022 17:41:09 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 04/14] cmem: Remove Makefile_cmem-mod and cmem refrences
Date: Fri,  4 Nov 2022 21:41:02 +0000
Message-Id: <20221104214112.1221365-5-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104214112.1221365-1-denis@denix.org>
References: <20221104214112.1221365-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 04 Nov 2022 21:41:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14100

From: Andrew Davis <afd@ti.com>

The cmem allocator has been deprecated for removal for some time now.
Lets remove the kernel module first, then start removing projects
that have not migrated to DMA-BUF Heaps yet.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../packagegroup-arago-tisdk-addons-sdk-target.bb            | 5 -----
 .../packagegroups/packagegroup-arago-tisdk-addons.bb         | 2 --
 meta-arago-distro/recipes-core/packagegroups/ti-test.bb      | 2 --
 3 files changed, 9 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegr=
oups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 43a043e1..e110fad8 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons-sdk-target.bb
@@ -26,11 +26,6 @@ UTILS:append:k3 =3D "\
 "
=20
 EXTRA_LIBS =3D ""
-EXTRA_LIBS:append:ti43x =3D "\
-    cmem-dev \
-    cmem-staticdev \
-"
-EXTRA_LIBS:append:omap-a15 =3D " cmem-dev"
 EXTRA_LIBS:append:dra7xx =3D " libulm-dev \
                              libulm-staticdev \
                              gdbserver-c6x-dev \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packag=
egroup-arago-tisdk-addons.bb
index 6d1d8661..f8c07164 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons.bb
@@ -80,12 +80,10 @@ UTILS:append:dra7xx =3D " \
=20
 EXTRA_LIBS =3D ""
 EXTRA_LIBS:append:omap-a15 =3D " \
-    cmem \
     uio-module-drv \
 "
=20
 EXTRA_LIBS:append:ti43x =3D " \
-    cmem \
     uio-module-drv \
 "
=20
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/me=
ta-arago-distro/recipes-core/packagegroups/ti-test.bb
index 3e76a527..99a6cc82 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
@@ -62,7 +62,6 @@ ARAGO_TI_TEST:append:ti33x =3D " \
=20
 ARAGO_TI_TEST:append:ti43x =3D " \
     omapconf \
-    ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', 'cmem-test', =
d)} \
 "
=20
 NOT_MAINLINE_MMIP_DEPS =3D "${@bb.utils.contains('MACHINE_FEATURES', 'mm=
ip', 'omapdrmtest', '', d)}"
@@ -71,7 +70,6 @@ ARAGO_TI_TEST:append:omap-a15 =3D " \
     omapconf \
     ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', " \
         ti-ipc-test \
-        cmem-test \
 	${NOT_MAINLINE_MMIP_DEPS} \
     ", d)} \
 "
--=20
2.25.1


