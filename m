Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B671BC2BA1B
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 20:01:53 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.20216.1741723304986230498
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 13:01:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4144A40CB8;
	Tue, 11 Mar 2025 20:01:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GoOaJLkP45Zv; Tue, 11 Mar 2025 20:01:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1AE5C40C21;
	Tue, 11 Mar 2025 20:01:43 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 420D31642E8;
	Tue, 11 Mar 2025 16:01:41 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master-wip][PATCH 2/8] sysrepo-plugins-common: move and clean up
Date: Tue, 11 Mar 2025 16:01:33 -0400
Message-Id: <20250311200139.3845524-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250311200139.3845524-1-denis@denix.org>
References: <20250311200139.3845524-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Mar 2025 20:01:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15983

From: Denys Dmytriyenko <denys@konsulko.com>

* Move into recipes-extended
* Shorten SUMMARY and don't empty DESCRIPTION
* Move patch into correct dir, don't alter FILESEXTRAPATHS
* Update patch to remove fuzz
* Set PV to a numeric value
* Don't hardcode /usr when passing to CMake
* No need for empty do_install:append

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../0001-so-version.patch                     | 20 +++++++++++++------
 .../sysrepo}/sysrepo-plugins-common_git.bb    | 19 +++++-------------
 2 files changed, 19 insertions(+), 20 deletions(-)
 rename meta-arago-extras/{recipes-sysrepo =3D> recipes-extended/sysrepo}=
/sysrepo-plugins-common/0001-so-version.patch (44%)
 rename meta-arago-extras/{recipes-sysrepo/sysrepo-plugins-common =3D> re=
cipes-extended/sysrepo}/sysrepo-plugins-common_git.bb (41%)

diff --git a/meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/000=
1-so-version.patch b/meta-arago-extras/recipes-extended/sysrepo/sysrepo-p=
lugins-common/0001-so-version.patch
similarity index 44%
rename from meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/0001=
-so-version.patch
rename to meta-arago-extras/recipes-extended/sysrepo/sysrepo-plugins-comm=
on/0001-so-version.patch
index 5e2fc3a5..ef82fb7a 100644
--- a/meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/0001-so-ve=
rsion.patch
+++ b/meta-arago-extras/recipes-extended/sysrepo/sysrepo-plugins-common/0=
001-so-version.patch
@@ -1,15 +1,23 @@
+From 3e2db769c1579010cb83d90f4a63ed256ddda4b8 Mon Sep 17 00:00:00 2001
+From: Ravi Gunasekaran <r-gunasekaran@ti.com>
+Date: Tue, 27 Jun 2023 17:20:59 +0000
+Subject: [PATCH] so version
=20
 Upstream-Status: Inappropriate [arago specific]
=20
+---
+ CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index fd64b80..910510d 100644
+index dc4e5d4..5b04b51 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -23,6 +23,7 @@ include_directories(${LIBYANG_INCLUDE_DIRS})
+@@ -37,6 +37,7 @@ include_directories(${LIBYANG_INCLUDE_DIRS})
  include_directories(${SYSREPO_INCLUDE_DIRS})
-
+=20
  add_library(${PROJECT_NAME} SHARED ${SRPC_SOURCES})
 +set_target_properties(${PROJECT_NAME} PROPERTIES VERSION 1.0.0 SOVERSIO=
N 1)
-
- install(
-     TARGETS ${PROJECT_NAME}
+=20
+ # project version
+ set_target_properties(${PROJECT_NAME}
diff --git a/meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/sys=
repo-plugins-common_git.bb b/meta-arago-extras/recipes-extended/sysrepo/s=
ysrepo-plugins-common_git.bb
similarity index 41%
rename from meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/sysr=
epo-plugins-common_git.bb
rename to meta-arago-extras/recipes-extended/sysrepo/sysrepo-plugins-comm=
on_git.bb
index 23d42fcc..f398a3e2 100644
--- a/meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/sysrepo-pl=
ugins-common_git.bb
+++ b/meta-arago-extras/recipes-extended/sysrepo/sysrepo-plugins-common_g=
it.bb
@@ -1,26 +1,17 @@
-SUMMARY =3D "Set of utilities/functionalities which can be used for easi=
er build of sysrepo plugins."
-DESCRIPTION =3D ""
+SUMMARY =3D "Common utilities/functionalities for sysrepo plugins"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df91d5dfaae99cc1943a8eca222caf=
a5c"
=20
-SRC_URI =3D "gitsm://github.com/telekom/sysrepo-plugins-common.git;proto=
col=3Dhttps;branch=3Ddevel "
-SRC_URI +=3D " file://0001-so-version.patch "
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}:"
+SRC_URI =3D "gitsm://github.com/telekom/sysrepo-plugins-common.git;proto=
col=3Dhttps;branch=3Ddevel"
+SRC_URI +=3D "file://0001-so-version.patch"
=20
-PV =3D "dev+git"
+PV =3D "0.1+git"
 SRCREV =3D "20885de0d3bb95a05610fdb3a0f83d8f7c370fad"
=20
 S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D "libyang sysrepo"
=20
-FILES:${PN} +=3D ""
-
 inherit cmake pkgconfig
=20
-# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
-EXTRA_OECMAKE =3D " -DCMAKE_INSTALL_PREFIX:PATH=3D/usr "
-
-do_install:append () {
-    true
-}
+EXTRA_OECMAKE =3D "-DCMAKE_INSTALL_PREFIX:PATH=3D${prefix}"
--=20
2.25.1


