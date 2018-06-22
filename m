Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id C07A952A55
	for <meta-arago@arago-project.org>;
	Fri, 22 Jun 2018 18:32:57 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w5MIWpBh036817
	for <meta-arago@arago-project.org>; Fri, 22 Jun 2018 13:32:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1529692371;
	bh=565pEoz4khwo/2I64cLdNZQNUtr2wGRZCP84up8BhN4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=kwGpbGXIN98/K8pTJQFxkOlDZmR/6aCzGRQ5kNvXm376WnhZqk4UjgBkUrPooN1f9
	U7ZdDZ3jLfqPdSJdQHKkKkYxyt2Teg4ecaFQXFavYCY27UubLchXGWFVqU+fivIAKD
	sJAUMeMs51K2SIx/TAkRd+B+eTWmB5yRwU1VORtI=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5MIWpL7015331
	for <meta-arago@arago-project.org>; Fri, 22 Jun 2018 13:32:51 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 22 Jun 2018 13:32:51 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 22 Jun 2018 13:32:51 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5MIWn0f021857;
	Fri, 22 Jun 2018 13:32:51 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 22 Jun 2018 14:21:14 -0400
Message-ID: <1529691675-25624-6-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1529691675-25624-1-git-send-email-j-stiffler@ti.com>
References: <1529691675-25624-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: ajayj@ti.com
Subject: [meta-processor-sdk][PATCH 5/6] ti-tisdk-makefile: add tidl-examples target
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
X-List-Received-Date: Fri, 22 Jun 2018 18:33:00 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ti-tisdk-makefile/Makefile_tidl-examples       | 35 ++++++++++++++++++++++
 .../ti-tisdk-makefile_1.0.bbappend                 |  8 +++--
 2 files changed, 41 insertions(+), 2 deletions(-)
 create mode 100755 recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_tidl-examples

diff --git a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_tidl-examples b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_tidl-examples
new file mode 100755
index 0000000..39cb6ba
--- /dev/null
+++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_tidl-examples
@@ -0,0 +1,35 @@
+
+
+tidl-examples:
+	@echo =====================================
+	@echo     Building TIDL Examples
+	@echo =====================================
+	@cd example-applications; cd `find . -name "*tidl-api*"`; . $(ENV_SETUP); \
+		make -C ./examples \
+		TARGET_ROOTDIR=$(SDK_PATH_TARGET) TI_OCL_CGT_INSTALL=$(SDK_PATH_TARGET)/usr/share/ti/cgt-c6x
+
+tidl-examples_install: tidl-examples
+	@echo =======================================
+	@echo     Installing TIDL Examples
+	@echo =======================================
+	@if [ ! -d $(DESTDIR) ] ; then \
+		echo "The extracted target filesystem directory doesn't exist."; \
+		echo "Please run setup.sh in the SDK's root directory and then try again."; \
+		exit 1; \
+	fi
+	@cd example-applications; \
+	cd `find . -name "*tidl-api*"`; \
+	for d in ./examples/*; \
+	do \
+		[ -f "$$d/Makefile" ] || continue; \
+		exe=$$(sed -ne 's|^EXE *= *||p' $$d/Makefile); \
+		install -d $(DESTDIR)/usr/share/ti/tidl/$$d; \
+		install -m 755 $$d/$$exe $(DESTDIR)/usr/share/ti/tidl/$$d; \
+	done
+
+tidl-examples_clean:
+	@echo =======================================
+	@echo     Cleaning TIDL Examples
+	@echo =======================================
+	@cd example-applications; cd `find . -name "*tidl-api*"`; : $(ENV_SETUP); \
+	make -C ./examples realclean
diff --git a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
index b7399c7..7247844 100644
--- a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
+++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk52"
+PR_append = ".tisdk53"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -9,6 +9,7 @@ SRC_URI_append = "\
     file://Makefile_evse-hmi \
     file://Makefile_protection-relays-hmi \
     file://Makefile_tiovx-app-host \
+    file://Makefile_tidl-examples \
 "
 
 SRC_URI_append_omap-a15 = " file://Makefile_big-data-ipc-demo"
@@ -43,7 +44,10 @@ MAKEFILES_append_ti33x = " evse-hmi \
 			   protection-relays-hmi \
 "
 
-MAKEFILES_append_am57xx-evm = " jailhouse"
+MAKEFILES_append_am57xx-evm = " jailhouse \
+                                tidl-examples \
+"
+MAKEFILES_append_am57xx-hs-evm = " tidl-examples"
 
 MAKEFILES_append_k2g = " pru-icss"
 
-- 
2.7.4


