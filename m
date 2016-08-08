Return-Path: <j-stiffler@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by arago-project.org (Postfix) with ESMTPS id 9F0B15298D
	for <meta-arago@arago-project.org>;
	Mon,  8 Aug 2016 13:40:10 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u78De9J6024490
	for <meta-arago@arago-project.org>; Mon, 8 Aug 2016 08:40:09 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u78De93j026555
	for <meta-arago@arago-project.org>; Mon, 8 Aug 2016 08:40:09 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 8 Aug 2016 08:40:09 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u78De8Zm002651;	Mon, 8 Aug 2016 08:40:09 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 8 Aug 2016 09:39:30 -0400
Message-ID: <1470663570-5175-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1470663570-5175-1-git-send-email-j-stiffler@ti.com>
References: <1470663570-5175-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] ti-tisdk-makefile: update defconfig name
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
X-List-Received-Date: Mon, 08 Aug 2016 13:40:11 -0000
Content-Type: text/plain

* Add ARAGO_KERNEL_SUFFIX to defconfig name

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 9184568..75f40d2 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -48,7 +48,7 @@ SRC_URI = "\
     file://Makefile_linalg-examples \
 "
 
-PR = "r72"
+PR = "r73"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
@@ -187,7 +187,7 @@ KERNEL_DEVICETREE_k2e-evm = "keystone-k2e-evm.dtb"
 KERNEL_DEVICETREE_k2g-evm = "keystone-k2g-evm.dtb"
 KERNEL_DEVICETREE_k2l-evm = "keystone-k2l-evm.dtb"
 
-DEFCONFIG = "tisdk_${MACHINE}_defconfig"
+DEFCONFIG = "tisdk_${MACHINE}${ARAGO_KERNEL_SUFFIX}_defconfig"
 
 AMSDK_DEFCONFIG = "singlecore-omap2plus_defconfig"
 
-- 
2.7.4


