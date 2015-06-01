Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 411CF52AAC
	for <meta-arago@arago-project.org>;
	Mon,  1 Jun 2015 18:55:59 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t51ItvRr001992
	for <meta-arago@arago-project.org>; Mon, 1 Jun 2015 13:55:57 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t51Itv4Q028900
	for <meta-arago@arago-project.org>; Mon, 1 Jun 2015 13:55:57 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 1 Jun 2015 13:55:57 -0500
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t51ItuMP009802;	Mon, 1 Jun 2015 13:55:57 -0500
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1YzUsO-0005eN-ML;
	Mon, 01 Jun 2015 14:55:56 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 1 Jun 2015 14:55:50 -0400
Message-ID: <1433184950-16151-6-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1433184950-16151-1-git-send-email-j-stiffler@ti.com>
References: <1433184950-16151-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] ti-tisdk-makefile: Add gdbserverproxy-module-drv makefile fragment
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
X-List-Received-Date: Mon, 01 Jun 2015 18:56:00 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../Makefile_gdbserverproxy-module-drv             |   29 ++++++++++++++++++++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    8 +++++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_gdbserverproxy-module-drv

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_gdbserverproxy-module-drv b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_gdbserverproxy-module-drv
new file mode 100644
index 0000000..eabca44
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_gdbserverproxy-module-drv
@@ -0,0 +1,29 @@
+gdbserverproxy-module-drv: linux
+	@echo ==============================================
+	@echo      Building gdbserverproxy-module-drv
+	@echo ==============================================
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -name "gdbserverproxy*"`; \
+	make ARCH=arm KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR) PLATFORM=__PLATFORM_GDBSERVERPROXY__
+
+gdbserverproxy-module-drv_clean:
+	@echo ==============================================
+	@echo      Cleaning gdbserverproxy-module-drv
+	@echo ==============================================
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -name "gdbserverproxy*"`; \
+	make ARCH=arm KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR) PLATFORM=__PLATFORM_GDBSERVERPROXY__ clean
+
+gdbserverproxy-module-drv_install:
+	@echo ==============================================
+	@echo      Installing gdbserverproxy-module-drv
+	@echo ==============================================
+	@if [ ! -d $(DESTDIR) ] ; then \
+		echo "The extracted target filesystem directory doesn't exist."; \
+		echo "Please run setup.sh in the SDK's root directory and then try again."; \
+		exit 1; \
+	fi
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -name "gdbserverproxy*"`; \
+	make ARCH=arm  KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR)  INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) PLATFORM=__PLATFORM_GDBSERVERPROXY__ modules_install
+
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index aaaa173..4decc71 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -37,9 +37,10 @@ SRC_URI = "\
     file://Makefile_sgx-modules \
     file://Makefile_cmem-mod \
     file://Makefile_debugss-module-drv \
+    file://Makefile_gdbserverproxy-module-drv \
 "
 
-PR = "r47"
+PR = "r48"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
@@ -87,6 +88,7 @@ MAKEFILES_append_ti43x = " u-boot-spl \
 
 MAKEFILES_append_dra7xx = " cryptodev \
                             debugss-module-drv \
+                            gdbserverproxy-module-drv \
 "
 
 MAKEFILES_append_omap-a15 = " u-boot-spl \
@@ -110,6 +112,9 @@ PLATFORM_SGX_ti43x = "ti43xx"
 PLATFORM_DEBUGSS = ""
 PLATFORM_DEBUGSS_dra7xx = "DRA7xx_PLATFORM"
 
+PLATFORM_GDBSERVERPROXY = ""
+PLATFORM_GDBSERVERPROXY_dra7xx = "DRA7xx_PLATFORM"
+
 KERNEL_BUILD_CMDS = "${@base_conditional('KERNEL_IMAGETYPE','uImage','LOADADDR=${UBOOT_LOADADDRESS} uImage','zImage',d)}"
 
 KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335x-boneblack.dtb"
@@ -167,6 +172,7 @@ do_install () {
 
     sed -i -e "s/__PLATFORM_SGX__/${PLATFORM_SGX}/" ${D}/Makefile
     sed -i -e "s/__PLATFORM_DEBUGSS__/${PLATFORM_DEBUGSS}/g" ${D}/Makefile
+    sed -i -e "s/__PLATFORM_GDBSERVERPROXY__/${PLATFORM_GDBSERVERPROXY}/g" ${D}/Makefile
 
     cat ${D}/Makefile | grep "__DTB_DEPEND__" > /dev/null
 
-- 
1.7.9.5


