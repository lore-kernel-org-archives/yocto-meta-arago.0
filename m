Return-Path: <jake@udd0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 70E8B52AD2
	for <meta-arago@arago-project.org>;
	Tue, 15 Mar 2016 19:54:17 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2FJsH1X027692
	for <meta-arago@arago-project.org>; Tue, 15 Mar 2016 14:54:17 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2FJsHFr025391
	for <meta-arago@arago-project.org>; Tue, 15 Mar 2016 14:54:17 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 15 Mar 2016 14:54:16 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2FJsGxB027972;
	Tue, 15 Mar 2016 14:54:16 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1afv2m-0004aL-LI; Tue, 15 Mar 2016 15:54:16 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 15 Mar 2016 15:54:13 -0400
Message-ID: <1458071653-17553-9-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1458071653-17553-1-git-send-email-j-stiffler@ti.com>
References: <1458071653-17553-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Cc: xuj@ti.com
Subject: [PATCH 8/8] ti-tisdk-makefile: Add linalg-examples target
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
X-List-Received-Date: Tue, 15 Mar 2016 19:54:20 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ti-tisdk-makefile/Makefile_linalg-examples     | 39 ++++++++++++++++++++++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |  4 ++-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linalg-examples

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linalg-examples b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linalg-examples
new file mode 100644
index 0000000..19c182f
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linalg-examples
@@ -0,0 +1,39 @@
+linalg-examples:
+	@echo =====================================
+	@echo     Building the Linalg Examples
+	@echo =====================================
+	@cd example-applications; \
+	cd `find . -name "*linalg-examples*"`; \
+	. $(ENV_SETUP); \
+	make TARGET_ROOTDIR=$(SDK_PATH_TARGET) \
+		TI_OCL_CGT_INSTALL=$(SDK_PATH_TARGET)/usr/share/ti/cgt-c6x \
+		LINALG_DIR=$(SDK_PATH_TARGET)/usr/share/ti/ti-linalg-tree
+
+linalg-examples_install:
+	@echo =======================================
+	@echo     Installing the Linalg Examples
+	@echo =======================================
+	@if [ ! -d $(DESTDIR) ] ; then \
+		echo "The extracted target filesystem directory doesn't exist."; \
+		echo "Please run setup.sh in the SDK's root directory and then try again."; \
+		exit 1; \
+	fi
+	@cd example-applications; \
+	cd `find . -name "*linalg-examples*"`; \
+	for example in `find . -executable -not \( -type d -o -iname 'make*' \)`; do \
+		install -d $(DESTDIR)/usr/share/ti/examples/linalg/`dirname $${example}` ; \
+		install -m 755 $${example} $(DESTDIR)/usr/share/ti/examples/linalg/`dirname $${example}` ; \
+		if [ -f `dirname $${example}`/*.out ]; then \
+			install -m 755 `dirname $${example}`/*.out $(DESTDIR)/usr/share/ti/examples/linalg/`dirname $${example}` ; \
+		fi \
+	done
+
+linalg-examples_clean:
+	@echo =======================================
+	@echo     Cleaning the Linalg Examples
+	@echo =======================================
+	@cd example-applications; \
+	cd `find . -name "*linalg-examples*"`; \
+	. $(ENV_SETUP); \
+	make TARGET_ROOTDIR=$(SDK_PATH_TARGET) clean
+
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index a487fe4..a65918e 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -45,9 +45,10 @@ SRC_URI = "\
     file://Makefile_qt-opencv-opencl-opengl-multithreaded \
     file://Makefile_ipsecmgr-mod \
     file://Makefile_openmpacc-examples \
+    file://Makefile_linalg-examples \
 "
 
-PR = "r69"
+PR = "r70"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
@@ -133,6 +134,7 @@ MAKEFILES_append_k2hk-evm = " opencl-examples \
                               gdbserverproxy-module-drv \
                               debugss-module-drv \
                               openmpacc-examples \
+                              linalg-examples \
 "
 
 MAKEFILES_append_k2l-evm = " opencl-examples \
-- 
1.9.1


