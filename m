Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46626C36000
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 18:37:32 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.60687.1742236647138959331
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 11:37:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qQoCJi2f;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52HIbPRk2410301
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Mar 2025 13:37:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742236646;
	bh=9KwX+SV0XTmuSCRKqQr4JKkHfijSAKHBO7QD+ThDiN8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=qQoCJi2fpm/8S++V/R1XcbN60iDq4tBrBbFvvHUvhkMCCsdiUEcQQp0X+b2izsRWL
	 Ko2j9uaHfZndgSgeODQ9Z+aGyGOt+8EH4UaULUhFnb4QoJGg8wFLJBX7n1bGWMkvIu
	 SdrPXM/2EvNMb4elmPlQviGLYAM8IHMuJILzuHlk=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52HIbPQ8092943
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Mar 2025 13:37:25 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Mar 2025 13:37:25 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Mar 2025 13:37:25 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HIbPlj000477;
	Mon, 17 Mar 2025 13:37:25 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tuFL3-0008Eq-GY; Mon, 17 Mar 2025 13:37:25 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH 08/14] sysrepo-plugins-common: move and clean up
Date: Mon, 17 Mar 2025 13:37:18 -0500
Message-ID: <20250317183724.31563-10-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250317183724.31563-1-reatmon@ti.com>
References: <20250317183724.31563-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 17 Mar 2025 18:37:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16067

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
 .../0001-so-version.patch                     |  0
 .../sysrepo/sysrepo-plugins-common_git.bb     | 17 ++++++++++++
 .../sysrepo-plugins-common_git.bb             | 26 -------------------
 3 files changed, 17 insertions(+), 26 deletions(-)
 rename meta-arago-extras/{recipes-sysrepo => recipes-extended/sysrepo}/sysrepo-plugins-common/0001-so-version.patch (100%)
 create mode 100644 meta-arago-extras/recipes-extended/sysrepo/sysrepo-plugins-common_git.bb
 delete mode 100644 meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/sysrepo-plugins-common_git.bb

diff --git a/meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/0001-so-version.patch b/meta-arago-extras/recipes-extended/sysrepo/sysrepo-plugins-common/0001-so-version.patch
similarity index 100%
rename from meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/0001-so-version.patch
rename to meta-arago-extras/recipes-extended/sysrepo/sysrepo-plugins-common/0001-so-version.patch
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


