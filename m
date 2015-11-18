Return-Path: <jake@udd0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id A792B52A81
	for <meta-arago@arago-project.org>;
	Wed, 18 Nov 2015 19:31:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id tAIJVmou029218
	for <meta-arago@arago-project.org>; Wed, 18 Nov 2015 13:31:48 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAIJVmsb020220
	for <meta-arago@arago-project.org>; Wed, 18 Nov 2015 13:31:48 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 18 Nov 2015 13:31:48 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAIJVmh2005578;
	Wed, 18 Nov 2015 13:31:48 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1Zz8SK-0005fa-6K; Wed, 18 Nov 2015 14:31:48 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 18 Nov 2015 14:31:45 -0500
Message-ID: <1447875105-21755-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1447875105-21755-1-git-send-email-j-stiffler@ti.com>
References: <1447875105-21755-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] ti-tisdk-makefile: Specify devicetree for k2g-evm
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
X-List-Received-Date: Wed, 18 Nov 2015 19:31:50 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb           | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 914d184..024e3cd 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -44,7 +44,7 @@ SRC_URI = "\
     file://Makefile_pru-icss \
 "
 
-PR = "r60"
+PR = "r61"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
@@ -162,6 +162,7 @@ KERNEL_DEVICETREE_dra7xx = "dra7-evm.dtb dra72-evm.dtb am57xx-beagle-x15.dtb am5
 KERNEL_DEVICETREE_k2hk-evm = "k2hk-evm.dtb"
 KERNEL_DEVICETREE_k2e-evm = "k2e-evm.dtb"
 KERNEL_DEVICETREE_k2l-evm = "k2l-evm.dtb"
+KERNEL_DEVICETREE_k2g-evm = "k2g-evm.dtb"
 
 DEFCONFIG = "tisdk_${MACHINE}_defconfig"
 
-- 
1.9.1


