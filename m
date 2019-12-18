Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 5698C529D1
	for <meta-arago@arago-project.org>;
	Wed, 18 Dec 2019 17:52:02 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBIHoPLn118145
	for <meta-arago@arago-project.org>; Wed, 18 Dec 2019 11:50:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576691425;
	bh=sFq3dIBChJaolL6Ig3ocUWrSOcp1RF3I+X/yUdaPxFM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=eJTki4IJvZqdoy0loa4s4BXwTOt8z+FkIYMjMRlnEps3WnmGwYQPvcatnEq8mvxMM
	3Hk5++R0BZHMu44Z3vS8BWhzDod5M+Vef3MlcuTvEKoCpL9TbHsxw7B7m6aiJ14B+e
	UwVMjLl3NVi39yUiFKf1YwN40USLWI2HabZXC3As=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBIHoPLJ110747
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 18 Dec 2019 11:50:25 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 18 Dec 2019 11:50:24 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Wed, 18 Dec 2019 11:50:24 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBIHoNfo112296;
	Wed, 18 Dec 2019 11:50:24 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 18 Dec 2019 12:31:13 -0500
Message-ID: <1576690275-13499-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576690275-13499-1-git-send-email-j-stiffler@ti.com>
References: <1576690275-13499-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com
Subject: [meta-processor-sdk][PATCH 3/5] neo-ai-dlr-demo: add standalone demo
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
X-List-Received-Date: Wed, 18 Dec 2019 17:52:04 -0000
Content-Type: text/plain

Show how to build a neo-ai-dlr application by extracting this demo
out of the neo-ai-dlr sources.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../neo-ai-dlr/neo-ai-dlr-demo/Makefile.build      | 24 +++++++++++++
 .../neo-ai-dlr/neo-ai-dlr-demo/makefile            | 11 ++++++
 recipes-support/neo-ai-dlr/neo-ai-dlr-demo_git.bb  | 42 ++++++++++++++++++++++
 3 files changed, 77 insertions(+)
 create mode 100644 recipes-support/neo-ai-dlr/neo-ai-dlr-demo/Makefile.build
 create mode 100644 recipes-support/neo-ai-dlr/neo-ai-dlr-demo/makefile
 create mode 100644 recipes-support/neo-ai-dlr/neo-ai-dlr-demo_git.bb

diff --git a/recipes-support/neo-ai-dlr/neo-ai-dlr-demo/Makefile.build b/recipes-support/neo-ai-dlr/neo-ai-dlr-demo/Makefile.build
new file mode 100644
index 0000000..1a9c19e
--- /dev/null
+++ b/recipes-support/neo-ai-dlr/neo-ai-dlr-demo/Makefile.build
@@ -0,0 +1,24 @@
+-include ../../Rules.make
+
+ENV_SETUP ?= ../../linux-devkit/environment-setup
+DESTDIR ?=
+
+all: release
+
+release:
+	@. ${ENV_SETUP}; \
+	make
+
+clean:
+	@. ${ENV_SETUP}; \
+        make clean
+
+install:
+	@if [ ! -d $(DESTDIR) ] ; then \
+		echo "The extracted target filesystem directory doesn't exist."; \
+		echo "Please run setup.sh in the SDK's root directory and then try again."; \
+		exit 1; \
+	fi
+	@install -d ${DESTDIR}/usr/share/dlr/demos
+	@cp -Prf ${DESTDIR}/usr/share/dlr/demos/run_mobilenet_cv_mt ${DESTDIR}/usr/share/dlr/demos/run_mobilenet_cv_mt.dyn
+	@echo "Dynamically linked run_mobilenet_cv_mt.dyn installed."
diff --git a/recipes-support/neo-ai-dlr/neo-ai-dlr-demo/makefile b/recipes-support/neo-ai-dlr/neo-ai-dlr-demo/makefile
new file mode 100644
index 0000000..84461b3
--- /dev/null
+++ b/recipes-support/neo-ai-dlr/neo-ai-dlr-demo/makefile
@@ -0,0 +1,11 @@
+PHONY: all
+CXXFLAGS =-funroll-loops -O3 -DNDEBUG 
+all: neo-ai-dlr-demo
+LIBS = -ldlr -lpthread -lopencv_highgui -lopencv_imgcodecs -lopencv_videoio -lopencv_imgproc -lopencv_core -lrt -ldl 
+
+neo-ai-dlr-demo: run_mobilenet_cv_mt.cc
+	$(CXX) $(CXXFLAGS) run_mobilenet_cv_mt.cc -o run_mobilenet_cv_mt.dyn $(LIBS)
+
+clean:
+	rm -rf run_mobilenet_cv_mt.dyn
+
diff --git a/recipes-support/neo-ai-dlr/neo-ai-dlr-demo_git.bb b/recipes-support/neo-ai-dlr/neo-ai-dlr-demo_git.bb
new file mode 100644
index 0000000..4cccf0e
--- /dev/null
+++ b/recipes-support/neo-ai-dlr/neo-ai-dlr-demo_git.bb
@@ -0,0 +1,42 @@
+SUMMARY = "Predictive maintenance demo for anomaly detection using Recurrent Neural Network (RNN)"
+LICENSE = "Apache-2.0" 
+LIC_FILES_CHKSUM = "file://../git/LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
+
+PV = "1.0"
+PR = "r1"
+
+BRANCH-NEO-AI-DLR = "dev"
+SRC_URI = "git://github.com/TexasInstruments/neo-ai-dlr;protocol=https;branch=${BRANCH-NEO-AI-DLR};name=neo-ai-dlr \
+           file://makefile;subdir=demosrc \
+           file://Makefile.build;subdir=demosrc \
+          "
+
+SRCREV_neo-ai-dlr = "40394be2e39eaa6248f9bf0a1143692083c0e3d2"
+
+S = "${WORKDIR}/demosrc"
+
+DEPENDS += " opencv neo-ai-dlr "
+
+do_patch_extra() {
+   install -m 644 ${WORKDIR}/git/demo/cv/run_mobilenet_cv_mt.cc ${S}/.
+   install -m 644 ${WORKDIR}/git/LICENSE ${S}/.
+}
+addtask patch_extra after do_patch before do_create_srcipk
+
+do_compile() {
+  cd ${S}
+  make 
+}
+
+do_install() {
+   install -d ${D}${datadir}/dlr/demos
+   install -m 644 ${S}/run_mobilenet_cv_mt.cc ${D}${datadir}/dlr/demos/.
+   install -m 644 ${S}/makefile ${D}${datadir}/dlr/demos/.
+   install -m 644 ${S}/Makefile.build ${D}${datadir}/dlr/demos/.
+   install -m 755 ${S}/run_mobilenet_cv_mt.dyn ${D}${datadir}/dlr/demos/.
+}
+
+CREATE_SRCIPK = "1"
+SRCIPK_INSTALL_DIR = "example-applications/${PN}-${PV}"
+
+FILES_${PN} += " ${datadir}/dlr/demos "
-- 
2.7.4


