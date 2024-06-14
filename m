Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF1EBC27C77
	for <webhook@archiver.kernel.org>; Fri, 14 Jun 2024 19:37:41 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2825.1718393861327310021
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 14 Jun 2024 12:37:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AEFFF40CC7;
	Fri, 14 Jun 2024 19:37:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xkM7Blt4cu7s; Fri, 14 Jun 2024 19:37:40 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9A07140C8C;
	Fri, 14 Jun 2024 19:37:39 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id D69B9163FA0;
	Fri, 14 Jun 2024 15:37:38 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/scarthgap][PATCH] linux: remove unused bbappends and generic empty kernel
Date: Fri, 14 Jun 2024 15:37:38 -0400
Message-Id: <20240614193738.795284-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 14 Jun 2024 19:37:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15388

From: Denys Dmytriyenko <denys@konsulko.com>

These haven't been used for long time, remove them.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-kernel/linux/linux-arago.bb           | 15 ---------------
 .../linux/linux-ti-staging-rt_%.bbappend          |  5 -----
 .../linux/linux-ti-staging-systest_%.bbappend     |  5 -----
 .../linux/linux-ti-staging/arago-armv8/defconfig  |  1 -
 .../linux/linux-ti-staging_%.bbappend             |  5 -----
 5 files changed, 31 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-kernel/linux/linux-arago.bb
 delete mode 100644 meta-arago-distro/recipes-kernel/linux/linux-ti-stagi=
ng-rt_%.bbappend
 delete mode 100644 meta-arago-distro/recipes-kernel/linux/linux-ti-stagi=
ng-systest_%.bbappend
 delete mode 100644 meta-arago-distro/recipes-kernel/linux/linux-ti-stagi=
ng/arago-armv8/defconfig
 delete mode 100644 meta-arago-distro/recipes-kernel/linux/linux-ti-stagi=
ng_%.bbappend

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-arago.bb b/meta=
-arago-distro/recipes-kernel/linux/linux-arago.bb
deleted file mode 100644
index b8fff950..00000000
--- a/meta-arago-distro/recipes-kernel/linux/linux-arago.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SECTION =3D "kernel"
-DESCRIPTION =3D "Linux kernel (non-existent) for Arago fake machine"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
-
-PV =3D "2.6"
-PR =3D "r0"
-
-PROVIDES +=3D "virtual/kernel kernel kernel-base kernel-image kernel-dev=
 kernel-vmlinux kernel-misc kernel-modules perf-dbg perf"
-
-INHIBIT_DEFAULT_DEPS =3D "1"
-
-COMPATIBLE_MACHINE =3D "arago|arago-armv5|arago-armv7"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%=
.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.=
bbappend
deleted file mode 100644
index 06f33291..00000000
--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappe=
nd
+++ /dev/null
@@ -1,5 +0,0 @@
-MACHINE_KERNEL_PR:append =3D ".arago1"
-
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
-
-ALLOW_EMPTY:kernel-devicetree =3D "1"
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-syst=
est_%.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-=
systest_%.bbappend
deleted file mode 100644
index 06f33291..00000000
--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.b=
bappend
+++ /dev/null
@@ -1,5 +0,0 @@
-MACHINE_KERNEL_PR:append =3D ".arago1"
-
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
-
-ALLOW_EMPTY:kernel-devicetree =3D "1"
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging/arag=
o-armv8/defconfig b/meta-arago-distro/recipes-kernel/linux/linux-ti-stagi=
ng/arago-armv8/defconfig
deleted file mode 100644
index 3228f4e2..00000000
--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging/arago-armv8=
/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-kernel-config=3Ddefconfig
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bb=
append b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappe=
nd
deleted file mode 100644
index 9d9a3593..00000000
--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-MACHINE_KERNEL_PR:append =3D ".arago5"
-
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
-
-ALLOW_EMPTY:kernel-devicetree =3D "1"
--=20
2.25.1


