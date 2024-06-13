Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 201B3C27C6E
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 17:25:54 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.237.1718299548780607006
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 13 Jun 2024 10:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 211F840CC4;
	Thu, 13 Jun 2024 17:25:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oBzrr6XzMyqi; Thu, 13 Jun 2024 17:25:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 07C5D40CC2;
	Thu, 13 Jun 2024 17:25:46 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 9CB0D163F9F;
	Thu, 13 Jun 2024 13:25:46 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/scarthgap][PATCH] branding: simplify some branding configs
Date: Thu, 13 Jun 2024 13:25:45 -0400
Message-Id: <20240613172545.771087-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 13 Jun 2024 17:25:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15384

From: Denys Dmytriyenko <denys@konsulko.com>

With the addition of multi-BSP support in meta-ti, some branding configs
can be simplified significantly.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../conf/distro/include/branding-ltsprep.inc    | 17 +----------------
 .../conf/distro/include/branding-mainline.inc   | 10 +---------
 .../conf/distro/include/branding-next.inc       |  9 ++-------
 3 files changed, 4 insertions(+), 32 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-ltsprep.inc b=
/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
index 4853f3c6..1b295adf 100644
--- a/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
+++ b/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
@@ -1,11 +1,4 @@
-
-PREFERRED_VERSION_linux-ti-staging =3D "6.6%"
-PREFERRED_VERSION_linux-ti-staging-rt =3D "6.6%"
-PREFERRED_VERSION_linux-ti-staging-systest =3D "6.6%"
-PREFERRED_VERSION_u-boot-ti-staging =3D "2024.04%"
-PREFERRED_VERSION_ti-img-rogue-umlibs =3D "24.1.6554834"
-PREFERRED_VERSION_ti-img-rogue-driver =3D "24.1.6554834"
-PREFERRED_VERSION_mesa-pvr =3D "23.2.1"
+TI_DEFAULT_BSP =3D "ti-6_6"
=20
 # Remove mmip - DRM allocator, KMS sink, Wayland sink need porting to GS=
T 1.18
 MACHINE_FEATURES:remove =3D "mmip"
@@ -13,11 +6,3 @@ MACHINE_FEATURES:remove =3D "mmip"
 # GC320 support requires out-of-tree drivers not available in until LTS =
prep is
 # complete. Disable for now.
 MACHINE_FEATURES:remove =3D "gc320"
-
-PREFERRED_PROVIDER_virtual/gpudriver:am335x-evm =3D ""
-PREFERRED_PROVIDER_virtual/gpudriver:am335x-hs-evm =3D ""
-PREFERRED_PROVIDER_virtual/gpudriver:am437x-evm =3D ""
-PREFERRED_PROVIDER_virtual/gpudriver:am437x-hs-evm =3D ""
-PREFERRED_PROVIDER_virtual/gpudriver:am57xx-evm =3D ""
-PREFERRED_PROVIDER_virtual/gpudriver:am57xx-hs-evm =3D ""
-PREFERRED_PROVIDER_virtual/gpudriver:am65xx-evm =3D ""
diff --git a/meta-arago-distro/conf/distro/include/branding-mainline.inc =
b/meta-arago-distro/conf/distro/include/branding-mainline.inc
index 613e76f9..245fa19b 100644
--- a/meta-arago-distro/conf/distro/include/branding-mainline.inc
+++ b/meta-arago-distro/conf/distro/include/branding-mainline.inc
@@ -1,9 +1 @@
-PREFERRED_PROVIDER_virtual/kernel =3D "linux-ti-mainline"
-PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-ti-mainline"
-PREFERRED_PROVIDER_u-boot =3D "u-boot-ti-mainline"
-SRCREV_ti-upstream-tools:pn-linux-ti-mainline =3D "${AUTOREV}"
-
-# GPU support requires out-of-tree SGX and RGX drivers not available in =
mainline
-# fall back to software rendering
-MACHINE_FEATURES:remove =3D "gpu"
-PREFERRED_PROVIDER_virtual/gpudriver =3D ""
+TI_DEFAULT_BSP =3D "mainline"
diff --git a/meta-arago-distro/conf/distro/include/branding-next.inc b/me=
ta-arago-distro/conf/distro/include/branding-next.inc
index 20291041..3b504aa1 100644
--- a/meta-arago-distro/conf/distro/include/branding-next.inc
+++ b/meta-arago-distro/conf/distro/include/branding-next.inc
@@ -1,10 +1,5 @@
+TI_DEFAULT_BSP =3D "mainline"
 PREFERRED_PROVIDER_virtual/kernel =3D "linux-ti-next"
-PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-ti-mainline"
-PREFERRED_PROVIDER_u-boot =3D "u-boot-ti-mainline"
+
 SRCREV:pn-linux-ti-next =3D "${AUTOREV}"
 SRCREV:pn-u-boot-ti-mainline =3D "${AUTOREV}"
-
-# GPU support requires out-of-tree SGX and RGX drivers not available in =
next
-# fall back to software rendering
-MACHINE_FEATURES:remove =3D "gpu"
-PREFERRED_PROVIDER_virtual/gpudriver =3D ""
--=20
2.25.1


