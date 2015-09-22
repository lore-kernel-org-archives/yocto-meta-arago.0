Return-Path: <jake@udc0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id AAF4D52A86
	for <meta-arago@arago-project.org>;
	Tue, 22 Sep 2015 14:35:05 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t8MEZ4hW006943
	for <meta-arago@arago-project.org>; Tue, 22 Sep 2015 09:35:04 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8MEZ43V026158
	for <meta-arago@arago-project.org>; Tue, 22 Sep 2015 09:35:04 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 22 Sep 2015 09:35:05 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8MEZ4NE003659;
	Tue, 22 Sep 2015 09:35:04 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1ZeOeu-0003U4-7l; Tue, 22 Sep 2015 10:35:04 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 22 Sep 2015 10:34:59 -0400
Message-ID: <1442932499-13350-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1442932499-13350-1-git-send-email-j-stiffler@ti.com>
References: <1442932499-13350-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] ti-tisdk-makefile: Add opencl-example Makefile fragment
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
X-List-Received-Date: Tue, 22 Sep 2015 14:35:10 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ti-tisdk-makefile/Makefile_opencl-examples     | 32 ++++++++++++++++++++++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |  3 +-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_opencl-examples

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_opencl-examples b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_opencl-examples
new file mode 100644
index 0000000..c1cbf67
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_opencl-examples
@@ -0,0 +1,32 @@
+# OpenCL Examples build targets
+opencl-examples:
+	@echo =====================================
+	@echo     Building the OpenCL Examples
+	@echo =====================================
+	@cd example-applications; cd `find . -name "*opencl-examples*"`; . $(ENV_SETUP); make TARGET_ROOTDIR=$(SDK_PATH_TARGET) TI_OCL_CGT_INSTALL=$(SDK_PATH_TARGET)/usr/share/ti/cgt-c6x
+
+opencl-examples_install:
+	@echo =======================================
+	@echo     Installing the OpenCL Examples
+	@echo =======================================
+	@if [ ! -d $(DESTDIR) ] ; then \
+		echo "The extracted target filesystem directory doesn't exist."; \
+		echo "Please run setup.sh in the SDK's root directory and then try again."; \
+		exit 1; \
+	fi
+	@cd example-applications; \
+	cd `find . -name "*opencl-examples*"`; \
+	for example in `find . -executable -not \( -type d -o -iname 'make*' \)`; do \
+		install -d $(DESTDIR)/usr/share/ti/examples/opencl/`dirname $${example}` ; \
+		install -m 755 $${example} $(DESTDIR)/usr/share/ti/examples/opencl/`dirname $${example}` ; \
+		if [ -f `dirname $${example}`/*.out ]; then \
+			install -m 755 `dirname $${example}`/*.out $(DESTDIR)/usr/share/ti/examples/opencl/`dirname $${example}` ; \
+		fi \
+	done
+
+opencl-examples_clean:
+	@echo =======================================
+	@echo     Cleaning the OpenCL Examples
+	@echo =======================================
+	@cd example-applications; cd `find . -name "*opencl-examples*"`; . $(ENV_SETUP); make TARGET_ROOTDIR=$(SDK_PATH_TARGET) clean
+
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 2ffafec..fcca764 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -37,9 +37,10 @@ SRC_URI = "\
     file://Makefile_debugss-module-drv \
     file://Makefile_gdbserverproxy-module-drv \
     file://Makefile_omapdrm-pvr \
+    file://Makefile_opencl-examples \
 "
 
-PR = "r52"
+PR = "r53"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
-- 
1.9.1


