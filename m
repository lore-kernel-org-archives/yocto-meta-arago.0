Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id CC096529A6
	for <meta-arago@arago-project.org>;
	Mon, 19 May 2014 19:20:57 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4JJKvnC012754
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 14:20:57 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4JJKvAR017482
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 14:20:57 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 19 May 2014 14:20:56 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s4JJK8CB001355;	Mon, 19 May 2014 14:20:55 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 May 2014 14:20:04 -0500
Message-ID: <1400527207-17021-17-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1400527207-17021-1-git-send-email-Chase.Maupin@ti.com>
References: <1400527207-17021-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 16/19] packagegroup-arago-tisdk-addons: Add libdrm components
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Mon, 19 May 2014 19:20:58 -0000
Content-Type: text/plain

* Add the components for libdrm support for kms

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../packagegroup-arago-tisdk-addons-sdk-target.bb  |    4 ++--
 .../packagegroup-arago-tisdk-addons.bb             |    1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index f069840..19ecf06 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,12 +1,12 @@
 DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
-PR = "r3"
+PR = "r4"
 
 inherit packagegroup
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-UTILS = ""
+UTILS = "libdrm-dev"
 
 UTILS_append_omap3 = " canutils-dev"
 UTILS_append_ti33x = " canutils-dev"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 859a223..6fe9d41 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -17,6 +17,7 @@ UTILS = " \
     dropbear \
     openssh-sftp-server \
     ptpd \
+    libdrm-kms \
 "
 
 UTILS_UBOOT_FW = "u-boot-fw-utils"
-- 
1.7.9.5


