Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id D0B81529AF
	for <meta-arago@arago-project.org>;
	Tue, 19 Mar 2013 15:14:14 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2JFEDbm020729
	for <meta-arago@arago-project.org>; Tue, 19 Mar 2013 10:14:13 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2JFEC5K005786
	for <meta-arago@arago-project.org>;
	Tue, 19 Mar 2013 20:44:12 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 19 Mar 2013 20:44:12 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2JFE4lR023952;
	Tue, 19 Mar 2013 20:44:11 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Mar 2013 10:14:00 -0500
Message-ID: <1363706042-10182-5-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1363706042-10182-1-git-send-email-Chase.Maupin@ti.com>
References: <1363706042-10182-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 5/7] sdk packagegroups: Add support for omap5 devices
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
X-List-Received-Date: Tue, 19 Mar 2013 15:14:15 -0000
Content-Type: text/plain

* Add support for omap5 devices to the packagegroups used in the
  SDK

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../packagegroups/packagegroup-arago-base-tisdk.bb |    2 +-
 .../packagegroup-arago-tisdk-amsdk-sdk-host.bb     |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
index 87e98bf..505bb53 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
@@ -15,7 +15,7 @@ RDEPENDS_${PN} = "\
     iptables \
     iperf \
     psplash \
-    u-boot \
+    ${PREFERRED_PROVIDER_virtual/bootloader} \
     arago-gpl-notice \
     nfs-utils-client \
     "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
index 0ac8d9d..3c1c121 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional scripts and applications into the SDK"
 LICENSE = "MIT"
-PR = "r4"
+PR = "r5"
 
 inherit packagegroup
 
@@ -12,6 +12,7 @@ U-BOOT_SRC = "${PREFERRED_PROVIDER_virtual/bootloader}-src"
 KERNEL_SRC = "${PREFERRED_PROVIDER_virtual/kernel}-src"
 
 TOOLS = "pinmux-utility"
+TOOLS_omap-a15 = ""
 TOOLS_am37x-evm_append = " flash-utility"
 TOOLS_am3517-evm_append = " flash-utility"
 
-- 
1.7.0.4


