Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by arago-project.org (Postfix) with ESMTP id 48BC052986
	for <meta-arago@arago-project.org>;
	Tue, 12 Nov 2013 19:39:43 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MW600DE319MCCC0@vms173003.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 12 Nov 2013 13:39:27 -0600 (CST)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 1361420033; Tue,
	12 Nov 2013 14:39:22 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 12 Nov 2013 14:39:20 -0500
Message-id: <1384285160-20212-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] arago-arm*: update with required KERNEL_IMAGETYPE and UBOOT_LOADADDR vars
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
X-List-Received-Date: Tue, 12 Nov 2013 19:39:43 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/machine/arago-armv5.conf | 3 +++
 meta-arago-distro/conf/machine/arago-armv7.conf | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta-arago-distro/conf/machine/arago-armv5.conf b/meta-arago-distro/conf/machine/arago-armv5.conf
index 65d9993..e5eea16 100644
--- a/meta-arago-distro/conf/machine/arago-armv5.conf
+++ b/meta-arago-distro/conf/machine/arago-armv5.conf
@@ -7,6 +7,9 @@ include conf/machine/include/tune-arm926ejs.inc
 
 IMAGE_FSTYPES = "tar.gz"
 
+KERNEL_IMAGETYPE = "zImage"
+UBOOT_LOADADDRESS = "0"
+
 SERIAL_CONSOLE = ""
 SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS1 115200;ttyS2 115200;ttyO0 115200;ttyO1 115200;ttyO2"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
diff --git a/meta-arago-distro/conf/machine/arago-armv7.conf b/meta-arago-distro/conf/machine/arago-armv7.conf
index 1964dd3..4b8aa38 100644
--- a/meta-arago-distro/conf/machine/arago-armv7.conf
+++ b/meta-arago-distro/conf/machine/arago-armv7.conf
@@ -7,6 +7,9 @@ include conf/machine/include/tune-cortexa8.inc
 
 IMAGE_FSTYPES = "tar.gz"
 
+KERNEL_IMAGETYPE = "zImage"
+UBOOT_LOADADDRESS = "0"
+
 SERIAL_CONSOLE = ""
 SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS1 115200;ttyS2 115200;ttyO0 115200;ttyO1 115200;ttyO2"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
-- 
1.8.3.2


