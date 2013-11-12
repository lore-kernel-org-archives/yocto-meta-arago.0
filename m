Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id 3FF9452A95
	for <meta-arago@arago-project.org>;
	Tue, 12 Nov 2013 04:42:41 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MW400EMYVQKRSB0@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 11 Nov 2013 22:42:30 -0600 (CST)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 27A2C205A6; Mon,
	11 Nov 2013 23:42:20 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 11 Nov 2013 23:42:11 -0500
Message-id: <1384231333-26952-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1384231333-26952-1-git-send-email-denis@denix.org>
References: <1384231333-26952-1-git-send-email-denis@denix.org>
Subject: [PATCH 4/6] nativesdk-packagegroup-arago-qte-toolchain-host: update to support Qt4 and Qt5
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
X-List-Received-Date: Tue, 12 Nov 2013 04:42:41 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/nativesdk-packagegroup-arago-qte-toolchain-host.bb  | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-qte-toolchain-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-qte-toolchain-host.bb
index e17127d..bb8367f 100644
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-qte-toolchain-host.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-qte-toolchain-host.bb
@@ -1,6 +1,8 @@
+inherit qt-vars
+
 require nativesdk-packagegroup-arago-sdk-host.bb
 
 DESCRIPTION = "Host packages for Qt Embedded SDK"
 LICENSE = "MIT"
 
-RDEPENDS_${PN} += "qt4-tools-nativesdk"
+RDEPENDS_${PN} += "${QT_RDEPENDS_NATIVESDK_TOOLS}"
-- 
1.8.3.2


