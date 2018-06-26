Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 11A8C529CE
	for <meta-arago@arago-project.org>;
	Tue, 26 Jun 2018 19:10:56 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w5QJApLU045454
	for <meta-arago@arago-project.org>; Tue, 26 Jun 2018 14:10:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1530040251;
	bh=c3yMM0SrCh8EVZYagb16x6yy/StoEbk8R2Qs/hBbt7I=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=uHX+S1lZCu44N4ENKc0pM+TOwrvOtdj0ecyD5joFVjyyOl67Ko6e5WwzbEjUsalm/
	b1wWoN8/npIxyenmwPYgCb1LgKctEIdu1NDe83Mh6Lx73fvMPGOPYgOn8EZsP87Zpm
	BBQSGixam2mnyvwSe6rCb8AtJb69tn7SnFMGOyFA=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5QJAp1c019780
	for <meta-arago@arago-project.org>; Tue, 26 Jun 2018 14:10:51 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 26 Jun 2018 14:10:50 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 26 Jun 2018 14:10:50 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5QJAos5024654;
	Tue, 26 Jun 2018 14:10:50 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 26 Jun 2018 14:59:28 -0400
Message-ID: <1530039568-1313-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1530039568-1313-1-git-send-email-j-stiffler@ti.com>
References: <1530039568-1313-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/rocko][PATCH 2/2] ti-tisdk-makefile: add k3 support
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
X-List-Received-Date: Tue, 26 Jun 2018 19:10:57 -0000
Content-Type: text/plain

* Add only linux-dtbs and u-boot-spl for now
* Disable GUI targets
* Use KERNEL_IMAGETYPE in KERNEL_BUILD_CMD.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb   | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 4669827..f296ffa 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -59,6 +59,7 @@ MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
 
 MAKEFILES_MATRIX_GUI_keystone = ""
 MAKEFILES_MATRIX_GUI_omapl138 = ""
+MAKEFILES_MATRIX_GUI_k3 = ""
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
@@ -162,6 +163,10 @@ MAKEFILES_append_k2e = " opencl-examples \
                              openmpacc-examples \
 "
 
+MAKEFILES_append_k3 = " u-boot-spl \
+                        linux-dtbs \
+"
+
 # Use this to export kernel arch to ARCH
 #
 # We need to be very careful here. This class will also overwrite UBOOT_ARCH
@@ -169,7 +174,8 @@ MAKEFILES_append_k2e = " opencl-examples \
 inherit kernel-arch
 
 # Use ARCH format expected by the makefile
-PLATFORM_ARCH = "armv7-a"
+PLATFORM_ARCH = "${ARMPKGARCH}"
+PLATFORM_ARCH_arm = "armv7-a"
 PLATFORM_ARCH_omapl138 = "armv5te"
 
 TARGET_PRODUCT = "jacinto6evm"
@@ -193,7 +199,7 @@ PRU_ICSS_INSTALL_TARGET_omap-a15 = "pru-icss_install_am572x"
 # If it's not defined at all, like for zImage case
 UBOOT_LOADADDRESS ?= "0"
 
-KERNEL_BUILD_CMDS = "${@base_conditional('KERNEL_IMAGETYPE','uImage','LOADADDR=${UBOOT_LOADADDRESS} uImage','zImage',d)}"
+KERNEL_BUILD_CMDS = "${@base_conditional('KERNEL_IMAGETYPE','uImage','LOADADDR=${UBOOT_LOADADDRESS}','',d)} ${KERNEL_IMAGETYPE}"
 
 DEFCONFIG = "tisdk_${MACHINE}${ARAGO_KERNEL_SUFFIX}_defconfig"
 
-- 
2.7.4


