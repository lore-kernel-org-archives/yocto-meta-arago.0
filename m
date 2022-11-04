Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62E37C3A5A1
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 21:41:18 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.209.1667598073425651410
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 14:41:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DCE1340D7F
	for <meta-arago@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:41:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1pPpMEXmR0WS for <meta-arago@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 21:41:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D0DA240D80
	for <meta-arago@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:41:12 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 6664916367C
	for <meta-arago@lists.yoctoproject.org>; Fri,  4 Nov 2022 17:41:09 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 03/14] big-data-ipc-demo: Merge include file and rename
Date: Fri,  4 Nov 2022 21:41:01 +0000
Message-Id: <20221104214112.1221365-4-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104214112.1221365-1-denis@denix.org>
References: <20221104214112.1221365-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 04 Nov 2022 21:41:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14099

From: Andrew Davis <afd@ti.com>

The include might have been intended to be used by an TI RTOS build
but without this in the roadmap lets merge the include and rename
this recipe without the -linux postfix.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../packagegroup-arago-tisdk-addons.bb        |  2 +-
 .../big-data-ipc-demo/big-data-ipc-demo.inc   | 30 -------------------
 ...-linux_git.bb =3D> big-data-ipc-demo_git.bb} | 30 ++++++++++++-------
 3 files changed, 21 insertions(+), 41 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-apps/big-data-ipc-demo/big-=
data-ipc-demo.inc
 rename meta-arago-extras/recipes-apps/big-data-ipc-demo/{big-data-ipc-de=
mo-linux_git.bb =3D> big-data-ipc-demo_git.bb} (54%)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packag=
egroup-arago-tisdk-addons.bb
index 5b6f05c9..6d1d8661 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons.bb
@@ -108,7 +108,7 @@ EXTRA_PACKAGES:append:omap-a15 =3D " ti-ipc-examples-=
linux"
 EXTRA_PACKAGES:append:omapl138 =3D " ti-ipc-examples-linux"
=20
 EXTRA_PACKAGES:append:omap-a15 =3D " \
-    ${@bb.utils.contains('MACHINE_FEATURES','dsp','big-data-ipc-demo-lin=
ux big-data-ipc-demo-linux-firmware','',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','dsp','big-data-ipc-demo big=
-data-ipc-demo-firmware','',d)} \
 "
=20
 # acontis-atemsys
diff --git a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ip=
c-demo.inc b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ip=
c-demo.inc
deleted file mode 100644
index 0b8a0611..00000000
--- a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.=
inc
+++ /dev/null
@@ -1,30 +0,0 @@
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://makefile;beginline=3D1;endline=3D31;md5=3D2=
f2ea348b98d5cc7807ece7adcc2c43a"
-
-COMPATIBLE_MACHINE =3D "omap-a15"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-BIG_DATA_IPC_GIT_URI =3D "git://git.ti.com/git/processor-sdk/big-data-ip=
c-examples.git"
-BIG_DATA_IPC_GIT_PROTOCOL =3D "https"
-BIG_DATA_IPC_GIT_BRANCH =3D "master"
-
-# Below commit ID corresponds to "DEV.BIG_DATA_IPC.01.03.00.00"
-BIG_DATA_IPC_SRCREV =3D "984edb3c69c8a1f51da02e0abcd2201319650894"
-
-BRANCH =3D "${BIG_DATA_IPC_GIT_BRANCH}"
-SRC_URI =3D "${BIG_DATA_IPC_GIT_URI};protocol=3D${BIG_DATA_IPC_GIT_PROTO=
COL};branch=3D${BRANCH}"
-
-SRCREV =3D "${BIG_DATA_IPC_SRCREV}"
-PV =3D "01.03.00.00"
-
-S =3D "${WORKDIR}/git"
-
-PLATFORM =3D "UNKNOWN"
-PLATFORM:omap-a15 =3D "DRA7XX"
-
-IPC_TARGETS =3D ""
-IPC_TARGETS:omap-a15 =3D "\
-    gnu.targets.arm.A15F=3D"${GCC_ARM_NONE_TOOLCHAIN}" \
-    ti.targets.elf.C66=3D"${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
-    ti.targets.arm.elf.M4=3D"${M4_TOOLCHAIN_INSTALL_DIR}" \
-"
diff --git a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ip=
c-demo-linux_git.bb b/meta-arago-extras/recipes-apps/big-data-ipc-demo/bi=
g-data-ipc-demo_git.bb
similarity index 54%
rename from meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc=
-demo-linux_git.bb
rename to meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-d=
emo_git.bb
index b384bf87..779cef7f 100644
--- a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo-=
linux_git.bb
+++ b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo_=
git.bb
@@ -1,7 +1,15 @@
 SUMMARY =3D "TI Big data IPC: Host linux examples"
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://makefile;beginline=3D1;endline=3D31;md5=3D2=
f2ea348b98d5cc7807ece7adcc2c43a"
=20
-require recipes-ti/includes/ti-paths.inc
-require big-data-ipc-demo.inc
+SRC_URI =3D "git://git.ti.com/processor-sdk/big-data-ipc-examples.git;pr=
otocol=3Dgit;branch=3Dmaster"
+SRCREV =3D "984edb3c69c8a1f51da02e0abcd2201319650894"
+PV =3D "01.03.00.00"
+
+S =3D "${WORKDIR}/git"
+
+COMPATIBLE_MACHINE =3D "omap-a15"
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 inherit features_check
=20
@@ -15,30 +23,32 @@ DEPENDS =3D "ti-ipc \
            ti-cgt6x-native \
 "
=20
+PLATFORM =3D "UNKNOWN"
+PLATFORM:omap-a15 =3D "DRA7XX"
+
+require recipes-ti/includes/ti-paths.inc
+
 EXTRA_OEMAKE =3D "\
     PLATFORM=3D${PLATFORM} \
     XDC_INSTALL_DIR=3D"${XDC_INSTALL_DIR}" \
     BIOS_INSTALL_DIR=3D"${SYSBIOS_INSTALL_DIR}" \
     IPC_INSTALL_DIR=3D"${IPC_INSTALL_DIR}" \
     LINUX_SYSROOT_DIR=3D"${STAGING_INCDIR}" \
-    ${IPC_TARGETS} \
-    JOBS=3D"${PARALLEL_MAKE}" \
+    gnu.targets.arm.A15F=3D"${GCC_ARM_NONE_TOOLCHAIN}" \
+    ti.targets.elf.C66=3D"${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
+    ti.targets.arm.elf.M4=3D"${M4_TOOLCHAIN_INSTALL_DIR}" \
 "
=20
 do_create_srcipk:prepend() {
-  rm -rf host_bios
+    rm -rf host_bios
 }
=20
 do_compile() {
-  if [  "${PLATFORM}" !=3D "UNKNOWN" ]; then
-      oe_runmake host_linux
-  fi
+    oe_runmake host_linux
 }
=20
 do_install() {
-  if [  "${PLATFORM}" !=3D "UNKNOWN" ]; then
     oe_runmake EXEC_DIR=3D"${D}${bindir}" install_linux_bin
-  fi
 }
=20
 PACKAGES =3D+ "${PN}-firmware"
--=20
2.25.1


