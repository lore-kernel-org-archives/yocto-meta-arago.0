Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id C1599529C8
	for <meta-arago@arago-project.org>;
	Tue, 24 Jun 2014 03:17:12 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7N00122L4OMZC0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 23 Jun 2014 22:17:12 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id ECB2E200BD; Mon,
	23 Jun 2014 23:17:11 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 23 Jun 2014 23:17:08 -0400
Message-id: <1403579830-27590-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
Subject: [PATCH 1/3] u-boot-am37x: remove old machine-specific bbappend
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
X-List-Received-Date: Tue, 24 Jun 2014 03:17:13 -0000

From: Denys Dmytriyenko <denys@ti.com>

Also remove left-over from previous commit with empty linux-omapl138-psp config

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-bsp/u-boot/u-boot-am37x_2012.04.01.bbappend | 4 ----
 .../linux/linux-omapl138-psp-2.6.37/am180x-evm/configs/empty          | 0
 2 files changed, 4 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot-am37x_2012.04.01.bbappend
 delete mode 100644 meta-arago-distro/recipes-kernel/linux/linux-omapl138-psp-2.6.37/am180x-evm/configs/empty

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-am37x_2012.04.01.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-am37x_2012.04.01.bbappend
deleted file mode 100644
index 580d8dc..0000000
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-am37x_2012.04.01.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-PR_append = "-arago0"
-
-UVER = "2012.04.01"
-PSPREL = "mainline"
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-omapl138-psp-2.6.37/am180x-evm/configs/empty b/meta-arago-distro/recipes-kernel/linux/linux-omapl138-psp-2.6.37/am180x-evm/configs/empty
deleted file mode 100644
index e69de29..0000000
-- 
2.0.0


