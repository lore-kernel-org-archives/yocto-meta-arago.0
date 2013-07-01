Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by arago-project.org (Postfix) with ESMTP id 1AFE452990
	for <meta-arago@arago-project.org>;
	Mon,  1 Jul 2013 16:31:00 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MP9002XAN6TSNY1@vms173001.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 01 Jul 2013 11:30:44 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 0153B20101; Mon,
	01 Jul 2013 12:30:29 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 01 Jul 2013 12:30:12 -0400
Message-id: <1372696212-29133-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.2.1
In-reply-to: <1372696212-29133-1-git-send-email-denis@denix.org>
References: <1372696212-29133-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] arago-test-image: fixes for RAMDISK usage
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
X-List-Received-Date: Mon, 01 Jul 2013 16:31:00 -0000

From: Denys Dmytriyenko <denys@ti.com>

* Build tar.gz and ext2.gz - good for RAMDISK/SD/NFS
* Relax compatibility list to be generic
* Remove large multimedia packagegroup to better fit into RAM

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Cc: Carlos Hernandez <ceh@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-test-image.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-test-image.bb b/meta-arago-distro/recipes-core/images/arago-test-image.bb
index 49e5a8d..403041f 100644
--- a/meta-arago-distro/recipes-core/images/arago-test-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-test-image.bb
@@ -5,14 +5,13 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 
 require arago-image.inc
 
-COMPATIBLE_MACHINE = "omap3|dm365|omapl138|ti813x|ti814x|ti816x|omap4|ti33x"
+IMAGE_FSTYPES = "tar.gz ext2.gz"
 
 IMAGE_INSTALL += "\
     packagegroup-arago-base \
     packagegroup-arago-console \
     packagegroup-arago-base-tisdk \
     packagegroup-arago-tisdk-crypto \
-    packagegroup-arago-tisdk-multimedia \
     packagegroup-arago-tisdk-addons \
     packagegroup-arago-test \
     packagegroup-arago-test-addons \
-- 
1.8.2.1


