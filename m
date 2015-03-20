Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id 3ADAF5297F
	for <meta-arago@arago-project.org>;
	Fri, 20 Mar 2015 18:46:06 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.236]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NLI00MY3XGOAB80@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 20 Mar 2015 13:46:05 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Pd9IXZlY c=1 sm=1 tr=0	a=SSUdfGXV8XCffJJ8+gLrig==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=emO1SXQWCLwA:10
	a=sozttTNsAAAA:8	a=W--Un5LiRJA9Z7BpoZoA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 6F99C200EC;	Fri,
	20 Mar 2015 14:45:55 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 20 Mar 2015 14:45:55 -0400
Message-id: <1426877155-32294-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] tisdk-image: use more generic TARGET_SYS, as Linaro has empty TARGET_VENDOR
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
X-List-Received-Date: Fri, 20 Mar 2015 18:46:06 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/tisdk-image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index 747670f..ebd01eb 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -238,7 +238,7 @@ echo "
 # Create the target side toolchain components table.  These are components on
 # the host but intended for the target.
 sw_manifest_toolchain_target() {
-    opkg_dir="${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}/sysroots/*-oe-linux-gnueabi*/var/lib/opkg/info"
+    opkg_dir="${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}/sysroots/*-linux-gnueabi*/var/lib/opkg/info"
 
 echo "
 <h2><u>GPLv3 Development Libraries Installed on Host</u></h2>
-- 
2.2.0


