Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id C7AC7529EF
	for <meta-arago@arago-project.org>;
	Wed, 21 Aug 2019 18:49:21 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7LImMC6044383
	for <meta-arago@arago-project.org>; Wed, 21 Aug 2019 13:48:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1566413302;
	bh=quWTwJqMQ5ImG5Q18Z4fP1eye/go97VXYncLINCX3Po=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=IAT6smjZcXK+W0IbOgbPB/ZrMhiGTQdoW+hNHCD0O9voRZCpVgn4FLyDvb4hvnmdm
	5nIqKC2cUXwiybNYIrtmnpQ2BE+lKJqsmDo07Tx1kas9Vrax5kjFmw013wNU/8vZy4
	QuKcKdo5z/UoIKEsq7jTZ2J/Lv1VVTlFJfCxxwA0=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7LImMAF065422
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 21 Aug 2019 13:48:22 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 21 Aug 2019 13:48:21 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 21 Aug 2019 13:48:21 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7LImK3T110312;
	Wed, 21 Aug 2019 13:48:21 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 21 Aug 2019 14:31:43 -0400
Message-ID: <1566412303-27982-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566412303-27982-1-git-send-email-j-stiffler@ti.com>
References: <1566412303-27982-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH 3/3] ti-tisdk-makefile: add jailhouse target
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
X-List-Received-Date: Wed, 21 Aug 2019 18:49:22 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ti-tisdk-makefile/Makefile_jailhouse           | 44 ++++++++++++++++++++++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |  6 +++
 2 files changed, 50 insertions(+)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_jailhouse

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_jailhouse b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_jailhouse
new file mode 100644
index 0000000..f5367c8
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_jailhouse
@@ -0,0 +1,44 @@
+# jailhouse module
+JH_ARCH = "__KERNEL_ARCH__"
+JH_PLATFORM = "__JH_PLATFORM__"
+
+jailhouse_config:
+	@echo =====================================
+	@echo      Configuring jailhouse
+	@echo =====================================
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -name "jailhouse*" -type d`; \
+	cp -v ./ci/jailhouse-config-$(JH_PLATFORM).h ./include/jailhouse/config.h
+
+jailhouse: linux jailhouse_config
+	@echo =====================================
+	@echo      Building jailhouse
+	@echo =====================================
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -name "jailhouse*" -type d`; \
+	make ARCH=$(JH_ARCH) KDIR=${LINUXKERNEL_INSTALL_DIR}
+
+jailhouse_clean:
+	@echo =====================================
+	@echo      Cleaning jailhouse
+	@echo =====================================
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -name "jailhouse*" -type d`; \
+	make ARCH=$(JH_ARCH) KDIR=${LINUXKERNEL_INSTALL_DIR} clean
+
+jailhouse_distclean: jailhouse_clean
+	@echo =====================================
+	@echo      Distclean jailhouse
+	@echo =====================================
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -name "jailhouse*" -type d`; \
+	rm -vf ./hypervisor/include/jailhouse/config.h
+
+jailhouse_install:
+	@echo ================================
+	@echo      Installing jailhouse
+	@echo ================================
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -name "jailhouse*" -type d`; \
+	make ARCH=$(JH_ARCH) KDIR=${LINUXKERNEL_INSTALL_DIR} DESTDIR=$(DESTDIR) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) prefix=/usr install
+
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 271218f..99f6523 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -52,6 +52,7 @@ SRC_URI = "\
     file://Makefile_mmwavegesture-hmi \
     file://Makefile_pdm-anomaly-detection \
     file://Makefile_ti-ipc \
+    file://Makefile_jailhouse \
 "
 
 PR = "r100"
@@ -186,6 +187,7 @@ MAKEFILES_append_k3 = " u-boot-spl \
 			mmwavegesture-hmi \
                         pdm-anomaly-detection \
                         ti-ipc \
+                        jailhouse \
 "
 
 MAKEFILES_append_am65xx = " \
@@ -244,6 +246,9 @@ IPC_TOOLS_PATHS_append_omap-a15 = " ${IPC_TOOLS_PATHS_C66} ${IPC_TOOLS_PATHS_M4}
 IPC_TOOLS_PATHS_append_omapl138 = " ${IPC_TOOLS_PATHS_C674}"
 IPC_TOOLS_PATHS_append_k3 = "${IPC_TOOLS_PATHS_R5F}"
 
+# Populate Jailhouse config header
+JH_PLATFORM = "${MACHINE}"
+JH_PLATFORM_k3 = "k3"
 
 # If it's not defined at all, like for zImage case
 UBOOT_LOADADDRESS ?= "0"
@@ -310,6 +315,7 @@ do_install () {
     sed -i -e "s/__BOOT_MONITOR_MAKE_TARGET__/${BOOT_MONITOR_MAKE_TARGET}/g" ${D}/Makefile
     sed -i -e "s/__PRU_ICSS_INSTALL_TARGET__/${PRU_ICSS_INSTALL_TARGET}/g" ${D}/Makefile
     sed -i -e "s/__IPC_TOOLS_PATHS__/${IPC_TOOLS_PATHS}/g" ${D}/Makefile
+    sed -i -e "s/__JH_PLATFORM__/${JH_PLATFORM}/" ${D}/Makefile
     sed -i -e "s/__TISDK_VERSION__/${TISDK_VERSION}/g" ${D}/Makefile
 
     cat ${D}/Makefile | grep "__DTB_DEPEND__" > /dev/null
-- 
2.7.4


