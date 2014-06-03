Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTP id 537A852AA6
	for <meta-arago@arago-project.org>;
	Tue,  3 Jun 2014 02:30:24 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N6K00KZFMY2PV00@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 02 Jun 2014 21:30:07 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id A3A6B20329; Mon,
	02 Jun 2014 22:29:49 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 02 Jun 2014 22:29:41 -0400
Message-id: <1401762581-31370-6-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
In-reply-to: <1401762581-31370-1-git-send-email-denis@denix.org>
References: <1401762581-31370-1-git-send-email-denis@denix.org>
Subject: [PATCH 5/5] tisdk-rootfs-image: use correct packagegroup for Qt4/Qt5
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
X-List-Received-Date: Tue, 03 Jun 2014 02:30:25 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
index 1bc6a36..0d7810a 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
@@ -5,7 +5,7 @@ require arago-base-tisdk-image.bb
 IMAGE_INSTALL += "\
     packagegroup-arago-test \
     ${@base_contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-graphics','',d)} \
-    packagegroup-arago-tisdk-qte \
+    ${@base_contains('QT_PROVIDER','qt5','packagegroup-arago-tisdk-qt5','packagegroup-arago-tisdk-qte',d)} \
     packagegroup-arago-tisdk-addons \
     packagegroup-arago-tisdk-connectivity \
     packagegroup-arago-tisdk-crypto \
-- 
1.9.2


