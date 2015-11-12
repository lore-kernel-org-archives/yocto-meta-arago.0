Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 6981752A77
	for <meta-arago@arago-project.org>;
	Thu, 12 Nov 2015 02:04:26 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NXO00EUKJ3D8V10@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 11 Nov 2015 20:04:25 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=eIhxMilvRf8A:10 a=qtqOOiqGOCEA:10
	a=sozttTNsAAAA:8	a=vyFQFkZqqdnf2NspWiUA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id E5D09161D0C;	Wed,
	11 Nov 2015 21:04:24 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 11 Nov 2015 21:04:21 -0500
Message-id: <1447293861-3979-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1447293861-3979-1-git-send-email-denis@denix.org>
References: <1447293861-3979-1-git-send-email-denis@denix.org>
Subject: [PATCH] ti-ipc: update to 3.41.00.02-eng
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
X-List-Received-Date: Thu, 12 Nov 2015 02:04:26 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/ipc/ti-ipc_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc_git.bb b/recipes-ti/ipc/ti-ipc_git.bb
index ac899bf..e1432e0 100644
--- a/recipes-ti/ipc/ti-ipc_git.bb
+++ b/recipes-ti/ipc/ti-ipc_git.bb
@@ -6,15 +6,15 @@ LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9
 
 DEPENDS += "virtual/kernel"
 
-PV = "3.40.01.08"
+PV = "3.41.00.02"
 
-BRANCH = "3.40"
+BRANCH = "ipc-next"
 SRC_URI = "git://git.ti.com/ipc/ipcdev.git;protocol=git;branch=${BRANCH} \
            file://tiipclad-daemon.sh \
            file://0001-Add-kernel-build-dir.patch \
            "
-# Commit corresponds to 3.40.01.08
-SRCREV = "239354b731b77e30a70230ebb54a31a83fc8b12f"
+# Commit corresponds to 3.41.00.02-eng
+SRCREV = "b34c8ada4ed243cd52e504bf2c6fb3451dc730f8"
 
 S = "${WORKDIR}/git"
 
-- 
2.2.0


