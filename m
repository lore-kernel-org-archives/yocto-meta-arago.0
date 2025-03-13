Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D713C35FF9
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 10:40:40 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.11387.1741862431514401071
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 13 Mar 2025 03:40:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ivxXGWKt;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52DAeU7A1850186
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 13 Mar 2025 05:40:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741862430;
	bh=ya/CROSd5vmEuZUKCPxnOaJuD6R/i+OSQmNZA2lp2xA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ivxXGWKti1rqZ8ogCabngW0+uvQz/hH54CNCAxwK7IYicM+bWsme+jinYeHZDD1Lt
	 49OZuclgqoXTnXekY6edLV7CPmIMpZMJ/Ev3KW1aZTUakU5au+S1cOQ/xiHdo7yqBx
	 /9KhwUzXN3mjYwSdhB2KZhlHR28dj2BcwOH1NuJY=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52DAeUMs070409;
	Thu, 13 Mar 2025 05:40:30 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Mar 2025 05:40:30 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Mar 2025 05:40:30 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52DAeUCf015590;
	Thu, 13 Mar 2025 05:40:30 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tsfzK-0003v5-AK; Thu, 13 Mar 2025 05:40:30 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 07/13] sysrepo-plugins-common: move and clean up
Date: Thu, 13 Mar 2025 05:40:23 -0500
Message-ID: <20250313104029.14977-8-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250313104029.14977-1-reatmon@ti.com>
References: <20250313104029.14977-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 13 Mar 2025 10:40:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16019

From: Denys Dmytriyenko <denys@konsulko.com>

* Move into recipes-extended
* Shorten SUMMARY and don't empty DESCRIPTION
* Move patch into correct dir, don't alter FILESEXTRAPATHS
* Update patch to remove fuzz
* Set PV to a numeric value
* Don't hardcode /usr when passing to CMake
* No need for empty do_install:append

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../0001-so-version.patch                     | 23 ++++++++++++++++
 .../sysrepo/sysrepo-plugins-common_git.bb     | 17 ++++++++++++
 .../0001-so-version.patch                     | 15 -----------
 .../sysrepo-plugins-common_git.bb             | 26 -------------------
 4 files changed, 40 insertions(+), 41 deletions(-)
 create mode 100644 meta-arago-extras/recipes-extended/sysrepo/sysrepo-plugins-common/0001-so-version.patch
 create mode 100644 meta-arago-extras/recipes-extended/sysrepo/sysrepo-plugins-common_git.bb
 delete mode 100644 meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/0001-so-version.patch
 delete mode 100644 meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/sysrepo-plugins-common_git.bb

diff --git a/meta-arago-extras/recipes-extended/sysrepo/sysrepo-plugins-common/0001-so-version.patch b/meta-arago-extras/recipes-extended/sysrepo/sysrepo-plugins-common/0001-so-version.patch
new file mode 100644
index 00000000..fbae80c0
--- /dev/null
+++ b/meta-arago-extras/recipes-extended/sysrepo/sysrepo-plugins-common/0001-so-version.patch
@@ -0,0 +1,23 @@
+From 3e2db769c1579010cb83d90f4a63ed256ddda4b8 Mon Sep 17 00:00:00 2001
+From: Ravi Gunasekaran <r-gunasekaran@ti.com>
+Date: Tue, 27 Jun 2023 17:20:59 +0000
+Subject: [PATCH] so version
+
+Upstream-Status: Inappropriate [arago specific]
+
+---
+ CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index dc4e5d4..5b04b51 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -37,6 +37,7 @@ include_directories(${LIBYANG_INCLUDE_DIRS})
+ include_directories(${SYSREPO_INCLUDE_DIRS})
+
+ add_library(${PROJECT_NAME} SHARED ${SRPC_SOURCES})
++set_target_properties(${PROJECT_NAME} PROPERTIES VERSION 1.0.0 SOVERSION 1)
+
+ # project version
+ set_target_properties(${PROJECT_NAME}
diff --git a/meta-arago-extras/recipes-extended/sysrepo/sysrepo-plugins-common_git.bb b/meta-arago-extras/recipes-extended/sysrepo/sysrepo-plugins-common_git.bb
new file mode 100644
index 00000000..f398a3e2
--- /dev/null
+++ b/meta-arago-extras/recipes-extended/sysrepo/sysrepo-plugins-common_git.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Common utilities/functionalities for sysrepo plugins"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f91d5dfaae99cc1943a8eca222cafa5c"
+
+SRC_URI = "gitsm://github.com/telekom/sysrepo-plugins-common.git;protocol=https;branch=devel"
+SRC_URI += "file://0001-so-version.patch"
+
+PV = "0.1+git"
+SRCREV = "20885de0d3bb95a05610fdb3a0f83d8f7c370fad"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "libyang sysrepo"
+
+inherit cmake pkgconfig
+
+EXTRA_OECMAKE = "-DCMAKE_INSTALL_PREFIX:PATH=${prefix}"
diff --git a/meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/0001-so-version.patch b/meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/0001-so-version.patch
deleted file mode 100644
index 5e2fc3a5..00000000
--- a/meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/0001-so-version.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-
-Upstream-Status: Inappropriate [arago specific]
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index fd64b80..910510d 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -23,6 +23,7 @@ include_directories(${LIBYANG_INCLUDE_DIRS})
- include_directories(${SYSREPO_INCLUDE_DIRS})
-
- add_library(${PROJECT_NAME} SHARED ${SRPC_SOURCES})
-+set_target_properties(${PROJECT_NAME} PROPERTIES VERSION 1.0.0 SOVERSION 1)
-
- install(
-     TARGETS ${PROJECT_NAME}
diff --git a/meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/sysrepo-plugins-common_git.bb b/meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/sysrepo-plugins-common_git.bb
deleted file mode 100644
index 23d42fcc..00000000
--- a/meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/sysrepo-plugins-common_git.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY = "Set of utilities/functionalities which can be used for easier build of sysrepo plugins."
-DESCRIPTION = ""
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f91d5dfaae99cc1943a8eca222cafa5c"
-
-SRC_URI = "gitsm://github.com/telekom/sysrepo-plugins-common.git;protocol=https;branch=devel "
-SRC_URI += " file://0001-so-version.patch "
-FILESEXTRAPATHS:prepend := "${THISDIR}:"
-
-PV = "dev+git"
-SRCREV = "20885de0d3bb95a05610fdb3a0f83d8f7c370fad"
-
-S = "${WORKDIR}/git"
-
-DEPENDS = "libyang sysrepo"
-
-FILES:${PN} += ""
-
-inherit cmake pkgconfig
-
-# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
-EXTRA_OECMAKE = " -DCMAKE_INSTALL_PREFIX:PATH=/usr "
-
-do_install:append () {
-    true
-}
-- 
2.17.1


