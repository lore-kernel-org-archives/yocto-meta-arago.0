Return-Path: <x0211375@psplinux052>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id BFABA52A85
	for <meta-arago@arago-project.org>;
	Fri,  6 Dec 2013 09:56:29 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rB69uT4a016518
	for <meta-arago@arago-project.org>; Fri, 6 Dec 2013 03:56:29 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB69uTq4023703
	for <meta-arago@arago-project.org>; Fri, 6 Dec 2013 03:56:29 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 6 Dec 2013 03:56:28 -0600
Received: from psplinux052 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB69uRgF021605;
	Fri, 6 Dec 2013 03:56:28 -0600
Received: from x0211375 by psplinux052 with local (Exim 4.76)	(envelope-from
	<x0211375@psplinux052>)	id 1Vos95-0004t0-Hi;
	Fri, 06 Dec 2013 15:26:27 +0530
From: Rajasekar <x0211375@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 6 Dec 2013 15:26:25 +0530
Message-ID: <1386323785-18741-1-git-send-email-x0211375@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Rajasekar <x0211375@ti.com>, Deepak M <x0171695@ti.com>
Subject: [PATCH 1/2] am438x : Added machine config for am438x EPOS machine
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
X-List-Received-Date: Fri, 06 Dec 2013 09:56:30 -0000
Content-Type: text/plain

Modified the machine name and description. Modified the
machine name as "AM438x EVM" and Modified the description
as "Machine configuration for TI AM438x EPOS EVM"

Signed-off-by: Deepak M <x0171695@ti.com>
Signed-off-by: Rajasekar <x0211375@ti.com>
---
 conf/machine/am438x-epos-evm.conf |   36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 conf/machine/am438x-epos-evm.conf

diff --git a/conf/machine/am438x-epos-evm.conf b/conf/machine/am438x-epos-evm.conf
new file mode 100644
index 0000000..6af97cf
--- /dev/null
+++ b/conf/machine/am438x-epos-evm.conf
@@ -0,0 +1,36 @@
+#@TYPE: Machine
+#@NAME: AM438x EVM
+#@DESCRIPTION: Machine configuration for TI AM438x EPOS EVM
+
+require conf/machine/include/ti43x.inc
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
+UBOOT_MACHINE = "am43xx_epos_hs_evm"
+PPA_PROJ = "hyperseam"
+PPA_PROC = "AM43XX"
+
+STAGING_STARTERWARE_DIR = "${STAGING_DIR_HOST}/usr/src/starterware-src"
-- 
1.7.9.5


