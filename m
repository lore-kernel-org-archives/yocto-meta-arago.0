Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 580C6C3A59F
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 21:41:18 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.225.1667598074264467977
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 14:41:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0D6E140D88
	for <meta-arago@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:41:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uyeE2sKy6EHC for <meta-arago@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 21:41:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 034C140D87
	for <meta-arago@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:41:12 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 899B2162035
	for <meta-arago@lists.yoctoproject.org>; Fri,  4 Nov 2022 17:41:09 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 06/14] ti-tisdk: Remove uio-module-drv kernel module
Date: Fri,  4 Nov 2022 21:41:04 +0000
Message-Id: <20221104214112.1221365-7-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104214112.1221365-1-denis@denix.org>
References: <20221104214112.1221365-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 04 Nov 2022 21:41:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14101

From: Andrew Davis <afd@ti.com>

UIO drivers are generally frowned upon and were only used here for some
K2 devices and PRUs before RPMSG. With these uses finally gone, lets
remove this out-of-tree module.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../packagegroup-arago-tisdk-addons.bb        | 20 -------------------
 1 file changed, 20 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packag=
egroup-arago-tisdk-addons.bb
index f8c07164..f4e72a89 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons.bb
@@ -34,16 +34,12 @@ UTILS_DSP =3D " \
 UTILS:append:ti33x =3D " mmc-utils \
                        switch-config \
                        pru-icss \
-                       uio-module-drv-test \
-                       uio-test-pruss \
 "
=20
 UTILS:append:ti43x =3D " mmc-utils \
                        switch-config \
                        libdrm-omap \
                        pru-icss \
-                       uio-module-drv-test \
-                       uio-test-pruss \
 "
=20
 UTILS:append:omap-a15 =3D " mmc-utils \
@@ -51,8 +47,6 @@ UTILS:append:omap-a15 =3D " mmc-utils \
                           libdrm-omap \
                           pru-icss \
                           ti-ipc-rtos-fw \
-                          uio-test-pruss \
-                          uio-module-drv-test \
 "
=20
 UTILS:append:k3 =3D " mmc-utils \
@@ -78,19 +72,6 @@ UTILS:append:dra7xx =3D " \
                         ${@bb.utils.contains('MACHINE_FEATURES','gpu','g=
lsdk-example-apps','',d)} \
 "
=20
-EXTRA_LIBS =3D ""
-EXTRA_LIBS:append:omap-a15 =3D " \
-    uio-module-drv \
-"
-
-EXTRA_LIBS:append:ti43x =3D " \
-    uio-module-drv \
-"
-
-EXTRA_LIBS:append:ti33x =3D " \
-    uio-module-drv \
-"
-
 EXTRA_PACKAGES =3D " \
     nodejs \
     nodejs-npm \
@@ -118,7 +99,6 @@ EXTRA_PACKAGES:append:omap-a15 =3D " \
 RDEPENDS:${PN} =3D "\
     ${UTILS} \
     ${UTILS_UBOOT_FW} \
-    ${EXTRA_LIBS} \
 "
=20
 RDEPENDS:${PN}-extra =3D "\
--=20
2.25.1


