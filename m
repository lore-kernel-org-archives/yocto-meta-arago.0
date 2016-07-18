Return-Path: <j-stiffler@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by arago-project.org (Postfix) with ESMTPS id 5033C52AB2
	for <meta-arago@arago-project.org>;
	Mon, 18 Jul 2016 16:21:38 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u6IGLco3007756
	for <meta-arago@arago-project.org>; Mon, 18 Jul 2016 11:21:38 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u6IGLbZJ012716
	for <meta-arago@arago-project.org>; Mon, 18 Jul 2016 11:21:37 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 18 Jul 2016 11:21:37 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u6IGLbCl008780;	Mon, 18 Jul 2016 11:21:37 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 18 Jul 2016 12:20:58 -0400
Message-ID: <1468858859-8074-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/2] libarch: extend to dra7xx SOCs
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
X-List-Received-Date: Mon, 18 Jul 2016 16:21:38 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-ti/libarch/libarch.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/libarch/libarch.inc b/meta-arago-extras/recipes-ti/libarch/libarch.inc
index 159d889..7d59276 100644
--- a/meta-arago-extras/recipes-ti/libarch/libarch.inc
+++ b/meta-arago-extras/recipes-ti/libarch/libarch.inc
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://src/ti/libarch/docs/LibArch_1.0.0_manifest.html;md5=b
 SRC_URI = "git://git.ti.com/library-architecture/libarch.git;protocol=git;branch=${BRANCH}"
 SRCREV = "cb6d785e95cd390c6388853a4f1e99a302e5a58f"
 
-COMPATIBLE_MACHINE = "k2hk-evm|am57xx"
+COMPATIBLE_MACHINE = "k2hk-evm|dra7xx"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 S = "${WORKDIR}/git"
@@ -28,5 +28,5 @@ export XDAIS_DIR = "${XDAIS_INSTALL_DIR}"
 export FC_DIR = "${FC_INSTALL_DIR}"
 export PDK_DIR = "${PDK_INSTALL_DIR}"
 
-TARGET_am57xx-evm = "SOC_AM572x"
+TARGET_dra7xx = "SOC_AM572x"
 TARGET_k2hk-evm   = "SOC_K2H"
-- 
2.7.4


