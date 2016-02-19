Return-Path: <jake@udd0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 35A4152ADD
	for <meta-arago@arago-project.org>;
	Fri, 19 Feb 2016 19:43:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1JJh2bN010042
	for <meta-arago@arago-project.org>; Fri, 19 Feb 2016 13:43:02 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1JJh216022405
	for <meta-arago@arago-project.org>; Fri, 19 Feb 2016 13:43:02 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 19 Feb 2016 13:43:01 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1JJh1p1002863;
	Fri, 19 Feb 2016 13:43:02 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aWqxB-0006ev-Lm; Fri, 19 Feb 2016 14:43:01 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 19 Feb 2016 14:42:58 -0500
Message-ID: <1455910978-25530-8-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455910978-25530-1-git-send-email-j-stiffler@ti.com>
References: <1455910978-25530-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 7/7] ti-tisdk-makefile: Add openmpacc-examples target
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
X-List-Received-Date: Fri, 19 Feb 2016 19:43:04 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ti-tisdk-makefile/Makefile_openmpacc-examples  | 32 ++++++++++++++++++++++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |  7 ++++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_openmpacc-examples

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_openmpacc-examples b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_openmpacc-examples
new file mode 100644
index 0000000..e1842ba
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_openmpacc-examples
@@ -0,0 +1,32 @@
+# OpenMP Accelerator Examples build targets
+openmpacc-examples:
+	@echo ================================================
+	@echo     Building the OpenMP Accelerator Examples
+	@echo ================================================
+	@cd example-applications; cd `find . -name "*openmpacc-examples*"`; . $(ENV_SETUP); make TARGET_ROOTDIR=$(SDK_PATH_TARGET) TI_OCL_CGT_INSTALL=$(SDK_PATH_TARGET)/usr/share/ti/cgt-c6x
+
+openmpacc-examples_install:
+	@echo ==================================================
+	@echo     Installing the OpenMP Accelerator Examples
+	@echo ==================================================
+	@if [ ! -d $(DESTDIR) ] ; then \
+		echo "The extracted target filesystem directory doesn't exist."; \
+		echo "Please run setup.sh in the SDK's root directory and then try again."; \
+		exit 1; \
+	fi
+	@cd example-applications; \
+	cd `find . -name "*openmpacc-examples*"`; \
+	for example in `find . -executable -not \( -type d -o -iname 'make*' \)`; do \
+		install -d $(DESTDIR)/usr/share/ti/examples/openmpacc/`dirname $${example}` ; \
+		install -m 755 $${example} $(DESTDIR)/usr/share/ti/examples/openmpacc/`dirname $${example}` ; \
+		if [ -f `dirname $${example}`/*.out ]; then \
+			install -m 755 `dirname $${example}`/*.out $(DESTDIR)/usr/share/ti/examples/openmpacc/`dirname $${example}` ; \
+		fi \
+	done
+
+openmpacc-examples_clean:
+	@echo ==================================================
+	@echo     Cleaning the OpenMP Accelerator Examples
+	@echo ==================================================
+	@cd example-applications; cd `find . -name "*openmpacc-examples*"`; . $(ENV_SETUP); make TARGET_ROOTDIR=$(SDK_PATH_TARGET) clean
+
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index b762b0e..bcd78ba 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -44,9 +44,10 @@ SRC_URI = "\
     file://Makefile_pru-icss \
     file://Makefile_qt-opencv-opencl-opengl-multithreaded \
     file://Makefile_ipsecmgr-mod \
+    file://Makefile_openmpacc-examples \
 "
 
-PR = "r67"
+PR = "r68"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
@@ -101,6 +102,7 @@ MAKEFILES_append_dra7xx = " cryptodev \
                             debugss-module-drv \
                             gdbserverproxy-module-drv \
                             opencl-examples \
+                            openmpacc-examples \
                             qt-opencv-opencl-opengl-multithreaded \
 "
 
@@ -130,16 +132,19 @@ MAKEFILES_append_keystone = " u-boot-spl \
 MAKEFILES_append_k2hk-evm = " opencl-examples \
                               gdbserverproxy-module-drv \
                               debugss-module-drv \
+                              openmpacc-examples \
 "
 
 MAKEFILES_append_k2l-evm = " opencl-examples \
                              gdbserverproxy-module-drv \
                              debugss-module-drv \
+                             openmpacc-examples \
 "
 
 MAKEFILES_append_k2e-evm = " opencl-examples \
                              gdbserverproxy-module-drv \
                              debugss-module-drv \
+                             openmpacc-examples \
 "
 
 # Use ARCH format expected by the makefile
-- 
1.9.1


