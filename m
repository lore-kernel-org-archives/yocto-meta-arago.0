Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4118C35FF4
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 20:01:53 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.20217.1741723305007679157
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 13:01:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3EA9540B66;
	Tue, 11 Mar 2025 20:01:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wCwAKM-m5Usf; Tue, 11 Mar 2025 20:01:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1D68B40CB0;
	Tue, 11 Mar 2025 20:01:43 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 35D2F1642E7;
	Tue, 11 Mar 2025 16:01:41 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master-wip][PATCH 1/8] sysrepo: move and clean up
Date: Tue, 11 Mar 2025 16:01:32 -0400
Message-Id: <20250311200139.3845524-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Mar 2025 20:01:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15984

From: Denys Dmytriyenko <denys@konsulko.com>

* Move into recipes-extended
* Shorten SUMMARY and don't empty DESCRIPTION
* Don't hardode /usr and /etc when passing to CMake
* No need to change SYSROOT_DIRS

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 ...-Hardcode-correct-path-to-tar-binary.patch |  0
 .../sysrepo/sysrepo/sysrepo                   |  0
 .../sysrepo/sysrepo/sysrepod.service          |  0
 .../sysrepo/sysrepo_git.bb                    | 31 ++++++++++---------
 4 files changed, 16 insertions(+), 15 deletions(-)
 rename meta-arago-extras/{recipes-sysrepo =3D> recipes-extended}/sysrepo=
/sysrepo/0001-Hardcode-correct-path-to-tar-binary.patch (100%)
 rename meta-arago-extras/{recipes-sysrepo =3D> recipes-extended}/sysrepo=
/sysrepo/sysrepo (100%)
 rename meta-arago-extras/{recipes-sysrepo =3D> recipes-extended}/sysrepo=
/sysrepo/sysrepod.service (100%)
 rename meta-arago-extras/{recipes-sysrepo =3D> recipes-extended}/sysrepo=
/sysrepo_git.bb (68%)

diff --git a/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/0001-Hardc=
ode-correct-path-to-tar-binary.patch b/meta-arago-extras/recipes-extended=
/sysrepo/sysrepo/0001-Hardcode-correct-path-to-tar-binary.patch
similarity index 100%
rename from meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/0001-Hardco=
de-correct-path-to-tar-binary.patch
rename to meta-arago-extras/recipes-extended/sysrepo/sysrepo/0001-Hardcod=
e-correct-path-to-tar-binary.patch
diff --git a/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/sysrepo b/=
meta-arago-extras/recipes-extended/sysrepo/sysrepo/sysrepo
similarity index 100%
rename from meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/sysrepo
rename to meta-arago-extras/recipes-extended/sysrepo/sysrepo/sysrepo
diff --git a/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/sysrepod.s=
ervice b/meta-arago-extras/recipes-extended/sysrepo/sysrepo/sysrepod.serv=
ice
similarity index 100%
rename from meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/sysrepod.se=
rvice
rename to meta-arago-extras/recipes-extended/sysrepo/sysrepo/sysrepod.ser=
vice
diff --git a/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb b/m=
eta-arago-extras/recipes-extended/sysrepo/sysrepo_git.bb
similarity index 68%
rename from meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb
rename to meta-arago-extras/recipes-extended/sysrepo/sysrepo_git.bb
index 0877a65f..2dbfa55f 100644
--- a/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb
+++ b/meta-arago-extras/recipes-extended/sysrepo/sysrepo_git.bb
@@ -1,15 +1,13 @@
-# Recipe created by recipetool
-SUMMARY =3D "YANG-based configuration and operational state data store f=
or Unix/Linux applications."
-DESCRIPTION =3D ""
+SUMMARY =3D "YANG-based configuration and operational state data store"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Def345f161efb68c3836e6f5648b23=
12f"
=20
-SRC_URI =3D "git://github.com/sysrepo/sysrepo.git;protocol=3Dhttps;branc=
h=3Dmaster \
-           file://0001-Hardcode-correct-path-to-tar-binary.patch \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', \
-                'file://sysrepo','', d)} \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', \
-                'file://sysrepod.service','', d)}"
+SRC_URI =3D " \
+    git://github.com/sysrepo/sysrepo.git;protocol=3Dhttps;branch=3Dmaste=
r \
+    file://0001-Hardcode-correct-path-to-tar-binary.patch \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'file://sysrepo'=
,'', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'file://sysrepod.=
service','', d)} \
+"
=20
 PV =3D "3.3.10+git"
 SRCREV =3D "ef93a1253cc97f13671759f6e7790cbf729a5ae9"
@@ -23,9 +21,15 @@ FILES:${PN} +=3D "${datadir}/yang/* ${libdir}/sysrepo-=
plugind/* ${bindir}/*"
 inherit cmake pkgconfig python3native python3-dir
 inherit ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', ''=
, d)}
=20
-
-# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
-EXTRA_OECMAKE =3D " -DCMAKE_INSTALL_PREFIX:PATH=3D/usr -DCMAKE_BUILD_TYP=
E:String=3DRelease -DBUILD_EXAMPLES:String=3DFalse -DENABLE_TESTS:String=3D=
False -DREPOSITORY_LOC:PATH=3D/etc/sysrepo  -DCALL_TARGET_BINS_DIRECTLY=3D=
False -DGEN_LANGUAGE_BINDINGS:String=3DFalse "
+EXTRA_OECMAKE =3D " \
+    -DCMAKE_INSTALL_PREFIX:PATH=3D${prefix} \
+    -DCMAKE_BUILD_TYPE:String=3DRelease \
+    -DBUILD_EXAMPLES:String=3DFalse \
+    -DENABLE_TESTS:String=3DFalse \
+    -DREPOSITORY_LOC:PATH=3D${sysconfdir}/sysrepo \
+    -DCALL_TARGET_BINS_DIRECTLY=3DFalse \
+    -DGEN_LANGUAGE_BINDINGS:String=3DFalse \
+"
=20
 SYSTEMD_PACKAGES =3D "${PN}"
 SYSTEMD_SERVICE:${PN} =3D "sysrepod.service"
@@ -52,6 +56,3 @@ do_install:append:class-target () {
 }
=20
 BBCLASSEXTEND =3D "native"
-
-SYSROOT_DIRS:append =3D " ${bindir}"
-
--=20
2.25.1


