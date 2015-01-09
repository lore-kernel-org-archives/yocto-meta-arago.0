Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 978B9529E0
	for <meta-arago@arago-project.org>;
	Fri,  9 Jan 2015 18:53:34 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NHX00D41B58YHE0@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 09 Jan 2015 12:53:33 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Kc1larcG c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=YNv0rlydsVwA:10
	a=sozttTNsAAAA:8 a=NEAV23lmAAAA:8	a=u8LHMhWqclLo0C3c8tQA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 85E2E20154;	Fri,
	9 Jan 2015 13:53:32 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 09 Jan 2015 13:53:32 -0500
Message-id: <1420829612-26594-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] u-boot, arago-prefs: move am57xx-evm to use latest mainline u-boot
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
X-List-Received-Date: Fri, 09 Jan 2015 18:53:35 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc      |  6 ++++++
 .../recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bbappend  | 14 +-------------
 2 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index ac8cbf8..94bb9da 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -83,6 +83,12 @@ PREFERRED_PROVIDER_u-boot_omap-a15 = "u-boot-ti-staging"
 
 PREFERRED_VERSION_u-boot-ti-staging = "2014.07%"
 
+# Point am57xx-evm to latest mainline
+PREFERRED_PROVIDER_virtual/bootloader_am57xx-evm = "u-boot"
+PREFERRED_PROVIDER_u-boot_am57xx-evm = "u-boot"
+
+PREFERRED_VERSION_u-boot_am57xx-evm = "2014.10+2015.01%"
+
 # Pin down udev version from oe-core, as meta-oe pulls in newer systemd-enhanced version
 PREFERRED_VERSION_udev = "182"
 PREFERRED_PROVIDER_udev = "udev"
diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bbappend
index 35ad282..6bea43f 100644
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bbappend
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bbappend
@@ -1,17 +1,5 @@
 FILESEXTRAPATHS_append := "${THISDIR}/${PN}:"
 
-PR_append = "-arago6"
+PR_append = "-arago7"
 
 UBOOT_LOCALVERSION = "-g${@d.getVar('SRCPV', True).partition('+')[2][0:7]}"
-
-# AM57x EVM is currently on a seperate git tree/branch.
-# Once the software has been integrated to the u-boot-ti-staging
-# repository these lines can be removed.
-
-OLD_BRANCH := "${BRANCH}"
-SRC_URI_am57xx-evm := "${@oe_filter_out('git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${OLD_BRANCH}','${SRC_URI}', d)}"
-
-BRANCH_am57xx-evm = "beaglex15"
-
-SRC_URI_am57xx-evm += "git://github.com/felipebalbi/u-boot.git;protocol=git;branch=${BRANCH}"
-SRC_URI_am57xx-evm += "file://0001-omap5-Add-netargs-and-netboot-option.patch"
-- 
2.2.0


