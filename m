Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id C4B7352960
	for <meta-arago@arago-project.org>;
	Fri, 10 Mar 2017 21:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E029720BAB;
	Fri, 10 Mar 2017 21:10:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id WfC9AE3iF4Mx; Fri, 10 Mar 2017 21:10:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C568120BBE;
	Fri, 10 Mar 2017 21:10:13 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 4A2721623BB;
	Fri, 10 Mar 2017 16:10:12 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 10 Mar 2017 16:10:10 -0500
Message-Id: <1489180211-138519-6-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1489180211-138519-1-git-send-email-denis@denix.org>
References: <1489180211-138519-1-git-send-email-denis@denix.org>
Subject: [PATCH 5/6] ti-wifi-utils: moved to meta-ti as wl18xx-calibrator, remove here
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
X-List-Received-Date: Fri, 10 Mar 2017 21:10:15 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroup-arago-tisdk-connectivity.bb       |  2 +-
 .../ti-wifi-utils/ti-wifi-utils-wl18xx.bb          | 34 ----------------------
 2 files changed, 1 insertion(+), 35 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index 7e95940..92e5c73 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -20,7 +20,7 @@ WLAN_COMMON = "\
     wpa-supplicant-wl18xx \
     crda \
     hostap-daemon-wl18xx \
-    ti-wifi-utils-wl18xx \
+    wl18xx-calibrator \
     wl18xx-target-scripts \
 "
 
diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx.bb b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx.bb
deleted file mode 100644
index 1d452f5..0000000
--- a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils-wl18xx.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-DESCRIPTION = "The calibrator and other useful utilities for TI wireless solution based on wl12xx driver"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4725015cb0be7be389cf06deeae3683d"
-
-DEPENDS = "libnl"
-RDEPENDS_${PN} = "wl18xx-firmware"
-
-PV = "R8.6+git${SRCPV}"
-
-PR = "r5"
-
-#Tag: R8.6
-SRCREV = "cf8965aad73764022669647fa33852558a657930"
-SRC_URI = "git://git.ti.com/wilink8-wlan/18xx-ti-utils.git \
-"
-
-PROVIDES += "ti-wifi-utils"
-RPROVIDES_${PN} += "ti-wifi-utils"
-RREPLACES_${PN} +=  "ti-wifi-utils"
-RCONFLICTS_${PN} +=  "ti-wifi-utils"
-
-S = "${WORKDIR}/git"
-
-export CROSS_COMPILE = "${TARGET_PREFIX}"
-
-EXTRA_OEMAKE = 'CFLAGS="${CFLAGS} -I${STAGING_INCDIR}/libnl3/ -DCONFIG_LIBNL32 " \
-		LDFLAGS="${LDFLAGS} -L${STAGING_LIBDIR}" \
-		CC="${CC}" \
-		NLVER=3'
-
-do_install() {
-    install -d ${D}${bindir}
-    install -m 0755 calibrator ${D}${bindir}/
-}
-- 
2.7.4


