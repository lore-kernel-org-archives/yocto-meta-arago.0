Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 12DF05299F
	for <meta-arago@arago-project.org>;
	Mon, 11 Apr 2016 02:37:47 +0000 (UTC)
Received: from vz-proxy-l001.mx.aol.com ([64.236.82.158])
	by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5G00AUM7AYXV30@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Sun, 10 Apr 2016 21:37:47 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=W8DY27sA+pJ1DslXMfMu3Q==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=Dj8X1P2kUObT4IQL3KsA:9
Received: by 100.15.86.14 with SMTP id 760cc199; Mon, 11 Apr 2016 02:37:46 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 38722161F89;	Sun,
	10 Apr 2016 22:37:46 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sun, 10 Apr 2016 22:37:45 -0400
Message-id: <1460342265-10959-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] tisdk-image, meta-toolchain-arago: deprecate use of opkg-cl
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
X-List-Received-Date: Mon, 11 Apr 2016 02:37:47 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/tisdk-image.bbclass               | 2 +-
 meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index 86fbb58..a9bc0d2 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -99,7 +99,7 @@ HOST_CLEANUP_PACKAGES ?= ""
 cleanup_host_packages() {
     if [ "${HOST_CLEANUP_PACKAGES}" != "" ]
     then
-        opkg-cl ${IPKG_ARGS} --force-depends remove ${HOST_CLEANUP_PACKAGES}
+        opkg ${IPKG_ARGS} --force-depends remove ${HOST_CLEANUP_PACKAGES}
     fi
 }
 
diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index 0a94dc1..0f42484 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -126,12 +126,12 @@ cleanup_toolchain_packages() {
 		# Clean up the native side of the toolchain
 		opkg_dir="${SDK_OUTPUT}/${SDKPATHNATIVE}"
 		opkg_conf="${SDK_OUTPUT}/etc/opkg-sdk.conf"
-		opkg-cl -o $opkg_dir -f $opkg_conf --force-depends remove ${TOOLCHAIN_CLEANUP_PACKAGES}
+		opkg -o $opkg_dir -f $opkg_conf --force-depends remove ${TOOLCHAIN_CLEANUP_PACKAGES}
 
 		# Clean up the target side of the toolchain
 		opkg_dir="${SDK_OUTPUT}/${SDKTARGETSYSROOT}"
 		opkg_conf="${opkg_dir}/etc/opkg.conf"
-		opkg-cl -o $opkg_dir -f $opkg_conf --force-depends remove ${TOOLCHAIN_CLEANUP_PACKAGES}
+		opkg -o $opkg_dir -f $opkg_conf --force-depends remove ${TOOLCHAIN_CLEANUP_PACKAGES}
 
 		# Clean up empty directories from cleaned up packages
 		find ${SDK_OUTPUT} -depth -type d -empty -print0 | xargs -r0 /bin/rmdir
-- 
2.2.0


