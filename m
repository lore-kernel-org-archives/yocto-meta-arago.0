Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id A3BFD529B6
	for <meta-arago@arago-project.org>;
	Fri, 20 Apr 2018 14:39:24 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3KEdLMF024522
	for <meta-arago@arago-project.org>; Fri, 20 Apr 2018 09:39:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1524235161;
	bh=cUDBvC5n9TvzcaS40sTy93bvwC2MkSenOBH6+elFwKQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=QGHIERxNjk5MSnILhvYKwZOsMdbTEdDMDkkHYy/9p3E4gBsq6fvtGPiDTP5O4YJvS
	ELeMbGSc3nEQF0cVvognpushFR4ibVq0nDPaMFRWSauDx2oGv/vM+Qe1Fm3XgB8s/J
	Mz5cdEzsF2FwmbQuhUEjKpOkEsvqe6rtGsBZZL6k=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3KEdLcF026336
	for <meta-arago@arago-project.org>; Fri, 20 Apr 2018 09:39:21 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 20 Apr 2018 09:39:21 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 20 Apr 2018 09:39:21 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3KEdK4x002328;
	Fri, 20 Apr 2018 09:39:21 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 20 Apr 2018 10:28:58 -0400
Message-ID: <1524234540-28454-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1524234540-28454-1-git-send-email-j-stiffler@ti.com>
References: <1524234540-28454-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 3/5] opencl-monitor-rtos: fix installation to sysroot
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
X-List-Received-Date: Fri, 20 Apr 2018 14:39:26 -0000
Content-Type: text/plain

* Install relative to ${D}
* Add files to a package
* Add missing dependency

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb
index 8add3ef..62e7131 100644
--- a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb
@@ -20,6 +20,7 @@ DEPENDS = " ti-llvm3.6-native \
             ti-framework-components \
             libaet \
             openmp-rtos \
+            gcc-arm-none-eabi-native \
 "
 
 COMPATIBLE_MACHINE = "omap-a15"
@@ -55,10 +56,10 @@ export GDB_SERVER_DIR = "${STAGING_DIR_TARGET}/usr/share/ti/gdbc6x"
 export AET_DIR = "${STAGING_DIR_TARGET}/usr/share/ti/ctoolslib/aet"
 export X86_LLVM_DIR = "${STAGING_DIR_NATIVE}/usr"
 export XDCPATH = "${S};${IPC_DIR}/packages;${BIOS_DIR}/packages;${EDMA3LLD_DIR}/packages;${FC_DIR}/packages;${XDAIS_DIR}/packages"
-export DESTDIR="${OCL_RTOS_INSTALL_DIR}/ti-opencl-rtos-${RELEASE_TARGET}-${PV}/packages/ti/opencl"
+export DESTDIR="${D}${OCL_RTOS_INSTALL_DIR_RECIPE}/ti-opencl-rtos-${RELEASE_TARGET}-${PV}/packages/ti/opencl"
 
 do_install() {
     oe_runmake install
-    install -d ${DESTDIR}/platforms/am57x_rtos
-    cp -r ${S}/../packages/ti/opencl/platforms/am57x_rtos/* ${DESTDIR}/platforms/am57x_rtos/
 }
+
+FILES_${PN} += "${OCL_RTOS_INSTALL_DIR_RECIPE}"
-- 
2.7.4


