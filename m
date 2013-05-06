Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 8879152995
	for <meta-arago@arago-project.org>;
	Mon,  6 May 2013 21:30:14 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r46LUDVr024614
	for <meta-arago@arago-project.org>; Mon, 6 May 2013 16:30:13 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r46LUD0m006045
	for <meta-arago@arago-project.org>; Mon, 6 May 2013 16:30:13 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 6 May 2013 16:30:13 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r46LUAjA017561;
	Mon, 6 May 2013 16:30:12 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 6 May 2013 16:30:06 -0500
Message-ID: <1367875806-8694-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] arago.conf: Correct TOOLCHAIN_BRAND for ARM9 SOCs
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
X-List-Received-Date: Mon, 06 May 2013 21:30:14 -0000
Content-Type: text/plain

* Linaro toolchain does not support ARM9 architecture.
* Use Arago toolchain if a ARM9 based SOC_FAMILY is being built.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 3954360..048c480 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -21,7 +21,9 @@ DISTRO_FEATURES = "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbh
 
 # Toolchain should be selected by setting TOOLCHAIN_BRAND in local.conf
 # Set some sane defaults, in case someone forgets to set them in local.conf
-TOOLCHAIN_BRAND ?= "linaro"
+# ARM9 is not supported by the Linaro toolchain so default back to the Arago
+# toolchain for ARM9 based SOCs.
+TOOLCHAIN_BRAND ?= "${@bb.utils.contains('SOC_FAMILY','omapl138','arago','linaro',d)}"
 TOOLCHAIN_TYPE ?= "external"
 
 require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}-${TOOLCHAIN_BRAND}.inc
-- 
1.7.0.4


