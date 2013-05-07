Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 45C5C52981
	for <meta-arago@arago-project.org>;
	Tue,  7 May 2013 04:39:42 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r474ddJb015978
	for <meta-arago@arago-project.org>; Mon, 6 May 2013 23:39:39 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r474dchY012326
	for <meta-arago@arago-project.org>; Mon, 6 May 2013 23:39:39 -0500
Received: from dlelxv24.itg.ti.com (172.17.1.199) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 6 May 2013 23:39:38 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv24.itg.ti.com (8.13.8/8.13.8) with ESMTP id r474dZk1032011;
	Mon, 6 May 2013 23:39:37 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 6 May 2013 23:39:33 -0500
Message-ID: <1367901573-3289-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH v2] arago.conf: Choose the proper toolchain by default depending on SOC_FAMILY
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
X-List-Received-Date: Tue, 07 May 2013 04:39:50 -0000
Content-Type: text/plain

* Linaro toolchain does not support ARM9 architecture.
* The Arago toolchain should be used if an ARM9 based SOC_FAMILY is being built.
* Introduce a new variable TC_SANE_DEFAULT that determines which toolchain to
  use depending on the machine's SOC_FAMILY.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Changes compared to v1:
Use seperate variable TC_SANE_DEFAULT suggested by Denys.
This seperate variable avoids any Python overhead since the value is evaluated
only once.
This still allows the TOOLCHAIN_BRAND to be overridden in the local.conf file.

 meta-arago-distro/conf/distro/arago.conf |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 3954360..33adc01 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -19,9 +19,13 @@ NO32LIBS = "0"
 # Set our distro features, don't forget all the standard libc ones
 DISTRO_FEATURES = "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g ipv4 ipv6 pulseaudio ${DISTRO_FEATURES_LIBC}"
 
+# ARM9 is not supported by the Linaro toolchain so default back to the Arago
+# toolchain for ARM9 based SOCs.
+TC_SANE_DEFAULT := "${@bb.utils.contains('SOC_FAMILY','omapl138','arago','linaro',d)}"
+
 # Toolchain should be selected by setting TOOLCHAIN_BRAND in local.conf
 # Set some sane defaults, in case someone forgets to set them in local.conf
-TOOLCHAIN_BRAND ?= "linaro"
+TOOLCHAIN_BRAND ?= "${TC_SANE_DEFAULT}"
 TOOLCHAIN_TYPE ?= "external"
 
 require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}-${TOOLCHAIN_BRAND}.inc
-- 
1.7.0.4


