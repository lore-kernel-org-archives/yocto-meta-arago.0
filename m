Return-Path: <jake@udd0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id EC67952AB4
	for <meta-arago@arago-project.org>;
	Tue,  3 Nov 2015 19:56:37 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA3Jubrb008384
	for <meta-arago@arago-project.org>; Tue, 3 Nov 2015 13:56:37 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA3JubPc025188
	for <meta-arago@arago-project.org>; Tue, 3 Nov 2015 13:56:37 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 3 Nov 2015 13:56:37 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA3JuaQn016095;
	Tue, 3 Nov 2015 13:56:36 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1Zthh6-0004Vb-Ko; Tue, 03 Nov 2015 14:56:36 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 3 Nov 2015 14:56:30 -0500
Message-ID: <1446580592-17255-9-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446580592-17255-1-git-send-email-j-stiffler@ti.com>
References: <1446580592-17255-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 08/10] ti-tisdk-makefile: Add boot-monitor target
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
X-List-Received-Date: Tue, 03 Nov 2015 19:56:40 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ti-tisdk-makefile/Makefile_boot-monitor        | 30 ++++++++++++++++++++++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |  5 +++-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_boot-monitor

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_boot-monitor b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_boot-monitor
new file mode 100644
index 0000000..74c7935
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_boot-monitor
@@ -0,0 +1,30 @@
+boot-monitor:
+	@echo ================================
+	@echo      Building boot-monitor
+	@echo ================================
+	@cd board-support; \
+	cd `find . -maxdepth 1 -name "boot-monitor*"`; \
+	make __BOOT_MONITOR_MAKE_TARGET__
+
+boot-monitor_clean:
+	@echo ================================
+	@echo      Cleaning boot-monitor
+	@echo ================================
+	@cd board-support; \
+	cd `find . -maxdepth 1 -name "boot-monitor*"`; \
+	make clean
+
+boot-monitor_install:
+	@echo ================================
+	@echo      Installing boot-monitor
+	@echo ================================
+	@if [ ! -d $(DESTDIR) ] ; then \
+		echo "The extracted target filesystem directory doesn't exist."; \
+		echo "Please run setup.sh in the SDK's root directory and then try again."; \
+		exit 1; \
+	fi
+	@cd board-support; \
+	cd `find . -maxdepth 1 -name "boot-monitor*"`; \
+	install -d $(DESTDIR)/boot; \
+	install -m 0644 ./skern-__BOOT_MONITOR_MAKE_TARGET__.bin $(DESTDIR)/boot
+
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index e32b978..a5f0c11 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -38,9 +38,10 @@ SRC_URI = "\
     file://Makefile_gdbserverproxy-module-drv \
     file://Makefile_omapdrm-pvr \
     file://Makefile_opencl-examples \
+    file://Makefile_boot-monitor \
 "
 
-PR = "r56"
+PR = "r57"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
@@ -109,6 +110,7 @@ MAKEFILES_append_am180x-evm = " pru \
 
 MAKEFILES_append_keystone = " u-boot-spl \
                               linux-dtbs \
+                              boot-monitor \
                               cmem-mod \
                               cryptodev \
                               ti-crypto-examples \
@@ -199,6 +201,7 @@ do_install () {
     sed -i -e "s/__PVR_NULLDRM__/${PVR_NULLDRM}/" ${D}/Makefile
     sed -i -e "s/__PLATFORM_DEBUGSS__/${PLATFORM_DEBUGSS}/g" ${D}/Makefile
     sed -i -e "s/__PLATFORM_GDBSERVERPROXY__/${PLATFORM_GDBSERVERPROXY}/g" ${D}/Makefile
+    sed -i -e "s/__BOOT_MONITOR_MAKE_TARGET__/${BOOT_MONITOR_MAKE_TARGET}/g" ${D}/Makefile
 
     cat ${D}/Makefile | grep "__DTB_DEPEND__" > /dev/null
 
-- 
1.9.1


