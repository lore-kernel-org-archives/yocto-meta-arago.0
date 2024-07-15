Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B8DC3DA4B
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 20:45:33 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2509.1721076323808002838
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 15 Jul 2024 13:45:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F213340C67;
	Mon, 15 Jul 2024 20:45:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RZZkfNyQmhoB; Mon, 15 Jul 2024 20:45:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CD1A9406B9;
	Mon, 15 Jul 2024 20:45:21 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id E173C163FF2;
	Mon, 15 Jul 2024 16:45:20 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH] sysrepo: fix "buildpaths" QA error
Date: Mon, 15 Jul 2024 16:45:20 -0400
Message-Id: <20240715204520.2729367-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 15 Jul 2024 20:45:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15442

From: Denys Dmytriyenko <denys@konsulko.com>

Finding tar binary and using it's absolute path in the code doesn't work =
for
cross-compilation and causes "buildpaths" QA error.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 ...-Hardcode-correct-path-to-tar-binary.patch | 34 +++++++++++++++++++
 .../recipes-sysrepo/sysrepo/sysrepo_git.bb    |  3 ++
 2 files changed, 37 insertions(+)
 create mode 100644 meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/000=
1-Hardcode-correct-path-to-tar-binary.patch

diff --git a/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/0001-Hardc=
ode-correct-path-to-tar-binary.patch b/meta-arago-extras/recipes-sysrepo/=
sysrepo/sysrepo/0001-Hardcode-correct-path-to-tar-binary.patch
new file mode 100644
index 00000000..daed8c26
--- /dev/null
+++ b/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/0001-Hardcode-cor=
rect-path-to-tar-binary.patch
@@ -0,0 +1,34 @@
+From 367e806a9affbfa351fe799b200f2361eb9d7934 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@konsulko.com>
+Date: Mon, 15 Jul 2024 16:14:23 -0400
+Subject: [PATCH] Hardcode correct path to tar binary
+
+Otherwise the hostpath location gets embedded, which is incorrect for
+the target and trips the "buildpaths" QA error.
+
+Upstream-Status: Inappropriate [OE/crosscompile specific]
+
+Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
+---
+ CMakeLists.txt | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 22c95420..2ba1f44e 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -402,10 +402,7 @@ check_symbol_exists(mkstemps "stdlib.h" SR_HAVE_MKS=
TEMPS)
+ unset(CMAKE_REQUIRED_DEFINITIONS)
+=20
+ # tar
+-find_program(TAR_BINARY "tar")
+-if(NOT TAR_BINARY)
+-    message(FATAL_ERROR "tar binary was not found.")
+-endif()
++set(TAR_BINARY "/usr/bin/tar")
+=20
+ # generate files
+ configure_file("${PROJECT_SOURCE_DIR}/src/config.h.in" "${PROJECT_BINAR=
Y_DIR}/config.h" ESCAPE_QUOTES @ONLY)
+--=20
+2.25.1
+
diff --git a/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb b/m=
eta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb
index ae0e8a27..b893e281 100644
--- a/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb
+++ b/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb
@@ -5,6 +5,7 @@ LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Def345f161efb68c3836e6f5648b23=
12f"
=20
 SRC_URI =3D "git://github.com/sysrepo/sysrepo.git;protocol=3Dhttps;branc=
h=3Ddevel \
+           file://0001-Hardcode-correct-path-to-tar-binary.patch \
            ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', \
                 'file://sysrepo','', d)} \
            ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', \
@@ -32,6 +33,8 @@ SYSTEMD_PACKAGES =3D "${PN}"
 SYSTEMD_SERVICE:${PN} =3D "sysrepod.service"
 SYSTEMD_AUTO_ENABLE:${PN} =3D "disable"
=20
+RDEPENDS:${PN} +=3D "tar"
+
 do_install:append () {
     install -d ${D}${sysconfdir}/sysrepo/data/notifications
     install -d ${D}${sysconfdir}/sysrepo/yang
--=20
2.25.1


