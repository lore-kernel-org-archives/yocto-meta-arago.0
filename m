Return-Path: <h-gou@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id B384752A0C
	for <meta-arago@arago-project.org>;
	Mon, 19 Mar 2018 18:37:05 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2JIa7WC026080
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 13:36:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521484567;
	bh=wYhI977c9kFSMcWJwEGQRAoTPy9YKbd+2Gw34mTG0VA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=e2VCMY2FBrW3k3I+J2r+3VxsFj9hi6+YBNg1ySVCqu/GZnK4X1kyPchD2m0NJORTJ
	2nKMpiiZ5JwSFAve0eCn33h7VC6tRMIgmDDVfJrj5jaZTPs/sIgAlpMbIthxGHobGN
	sjKQL7V6q9qMWVoBexp9ozSfHpw72kQ79OSZEopY=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JIa6Um014790
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 13:36:07 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 19 Mar 2018 13:36:06 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 19 Mar 2018 13:36:06 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JIa4SB009580;
	Mon, 19 Mar 2018 13:36:06 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 Mar 2018 14:35:39 -0400
Message-ID: <1521484541-8104-5-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521484541-8104-1-git-send-email-a0271529@ti.com>
References: <1521484541-8104-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 4/6] [PATCH] ti-tisdk-makefile: add tiovx-app-host
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
X-List-Received-Date: Mon, 19 Mar 2018 18:37:06 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../ti-tisdk-makefile/Makefile_tiovx-app-host      | 34 ++++++++++++++++++++++
 .../ti-tisdk-makefile_1.0.bbappend                 |  5 +++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_tiovx-app-host

diff --git a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_tiovx-app-host b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_tiovx-app-host
new file mode 100644
index 0000000..998368b
--- /dev/null
+++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_tiovx-app-host
@@ -0,0 +1,34 @@
+# tiovx-app-host build targets
+tiovx-app-host:
+	@echo =====================================
+	@echo     Building TIOVX Host Application
+	@echo =====================================
+	@cd example-applications; cd `find . -name "*tiovx-app-host*"`; . $(ENV_SETUP); make \
+		TARGET_ROOTDIR=$(SDK_PATH_TARGET) \
+	 	GCCLINARO=$(LINUX_DEVKIT_PATH)/sysroots/x86_64-arago-linux/usr \
+		TIOVXPATH=$(SDK_PATH_TARGET)/usr/include/VX \
+		IPCPATH=$(SDK_PATH_TARGET)/usr/share/ti/ti-ipc-tree \
+		SDKPLATFORMIFPATH=$(SDK_PATH_TARGET)/usr/share/ti/ti-tiovx-lib-tree/sys-iface \
+		PROC_LIST='host khronos_example'
+
+tiovx-app-host_install:
+	@echo =======================================
+	@echo     Installing TIOVX Host Application
+	@echo =======================================
+	@if [ ! -d $(DESTDIR) ] ; then \
+		echo "The extracted target filesystem directory doesn't exist."; \
+		echo "Please run setup.sh in the SDK's root directory and then try again."; \
+		exit 1; \
+	fi
+	@cd example-applications; \
+	cd `find . -name "*tiovx-app-host*"`; \
+	install -m 0755 host/bin/debug/app_host $(DESTDIR)/usr/bin/tiovx-app_host; \
+	install -m 0755 khronos_example/bin/debug/opticalflow $(DESTDIR)/usr/bin/tiovx-opticalflow
+
+tiovx-app-host_clean:
+	@echo =======================================
+	@echo     Cleaning TIOVX Host Application
+	@echo =======================================
+	@cd example-applications; cd `find . -name "*tiovx-app-host*"`; . $(ENV_SETUP); \
+	make PROC_LIST='host khronos_example' clean
+
diff --git a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
index e609aae..d6a7d3d 100644
--- a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
+++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk51"
+PR_append = ".tisdk52"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -8,6 +8,7 @@ SRC_URI_append = "\
     file://Makefile_jailhouse \
     file://Makefile_evse-hmi \
     file://Makefile_protection-relays-hmi \
+    file://Makefile_tiovx-app-host \
 "
 
 SRC_URI_append_omap-a15 = " file://Makefile_big-data-ipc-demo"
@@ -46,6 +47,8 @@ MAKEFILES_append_am57xx-evm = " jailhouse"
 
 MAKEFILES_append_k2g = " pru-icss"
 
+MAKEFILES_append_dra7xx = " tiovx-app-host"
+
 MAKEFILES_remove_ti33x = "${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'ti-sgx-ddk-km', d)}"
 MAKEFILES_remove_ti43x = "${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'ti-sgx-ddk-km', d)}"
 
-- 
1.9.1


