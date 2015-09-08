Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id 45C33529FA
	for <meta-arago@arago-project.org>;
	Tue,  8 Sep 2015 15:55:34 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NUD00IDK88156M0@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 08 Sep 2015 10:55:18 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=ff-B7xzCdYMA:10 a=sozttTNsAAAA:8
	a=s0xFg_XHMkChdAgMgMIA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id E2ED4161BD6;	Tue,
	8 Sep 2015 11:55:12 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 08 Sep 2015 11:55:12 -0400
Message-id: <1441727712-28199-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] cryptodev-module: update for changed variable syntax
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
X-List-Received-Date: Tue, 08 Sep 2015 15:55:35 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-kernel/cryptodev/cryptodev-module_1.6.bbappend            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_1.6.bbappend b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_1.6.bbappend
index 24c99ed..0a3d1be 100644
--- a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_1.6.bbappend
+++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_1.6.bbappend
@@ -1,6 +1,6 @@
-PR_append = "-arago5"
+PR_append = "-arago6"
 
-module_autoload_cryptodev = "cryptodev"
+KERNEL_MODULE_AUTOLOAD += "cryptodev"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-- 
2.2.0


