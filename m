Return-Path: <x0211375@psplinux052>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 1F7AC52A85
	for <meta-arago@arago-project.org>;
	Fri,  6 Dec 2013 09:56:48 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rB69uln8015742
	for <meta-arago@arago-project.org>; Fri, 6 Dec 2013 03:56:47 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB69ulF6003849
	for <meta-arago@arago-project.org>; Fri, 6 Dec 2013 03:56:47 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 6 Dec 2013 03:56:47 -0600
Received: from psplinux052 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB69ukrZ025708;
	Fri, 6 Dec 2013 03:56:46 -0600
Received: from x0211375 by psplinux052 with local (Exim 4.76)	(envelope-from
	<x0211375@psplinux052>)	id 1Vos9N-0004tm-Ts;
	Fri, 06 Dec 2013 15:26:45 +0530
From: Rajasekar <x0211375@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 6 Dec 2013 15:26:43 +0530
Message-ID: <1386323803-18796-1-git-send-email-x0211375@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Deepak M <x0171695@ti.com>, Rajasekar <x0211375@ti.com>
Subject: [PATCH 2/2] am43xx: Added machine config for am437x HS evm
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
X-List-Received-Date: Fri, 06 Dec 2013 09:56:48 -0000
Content-Type: text/plain

From: Deepak M <x0171695@ti.com>

Signed-off-by: Deepak M <x0171695@ti.com>
Signed-off-by: Rajasekar <x0211375@ti.com>
---
 conf/machine/am437x-hs-evm.conf |   39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 conf/machine/am437x-hs-evm.conf

diff --git a/conf/machine/am437x-hs-evm.conf b/conf/machine/am437x-hs-evm.conf
new file mode 100644
index 0000000..1b38d09
--- /dev/null
+++ b/conf/machine/am437x-hs-evm.conf
@@ -0,0 +1,39 @@
+#@TYPE: Machine
+#@NAME: AM43xx EVM
+#@DESCRIPTION: Machine configuration for the TI AM43xx EVM
+
+require conf/machine/include/ti43x.inc
+
+# Use built-in LCD by default
+XSERVER += "xf86-input-tslib"
+GUI_MACHINE_CLASS = "smallscreen"
+MACHINE_FEATURES += "touchscreen"
+
+IMAGE_FSTYPES += "ubi tar.gz"
+
+SERIAL_CONSOLE = "115200 ttyO0"
+
+# UBI information.  Note that this is board and kernel specific.  Changes
+# in your kernel port may require changes in these variables.  For more
+# details about this board please see
+# http://processors.wiki.ti.com/index.php/UBIFS_Support
+
+# do ubiattach /dev/ubi_ctrl -m 7 -O 2048
+# From dmesg:
+# UBI: smallest flash I/O unit:    2048
+# UBI: logical eraseblock size:    126976 bytes
+# from ubiattach stdout:
+# UBI device number 0, total 1988 LEBs
+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 3836"
+
+# do ubiattach /dev/ubi_ctrl -m 7 -O 2048
+# from dmesg:
+# UBI: smallest flash I/O unit:    2048
+# UBI: physical eraseblock size:   131072 bytes (128 KiB)
+# UBI: sub-page size:              512
+# UBI: VID header offset:          2048 (aligned 2048)
+UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512 -O 2048"
+
+UBOOT_MACHINE = "am43xx_hs_evm"
+PPA_PROJ = "default"
+PPA_PROC = "AM43XX"
-- 
1.7.9.5


