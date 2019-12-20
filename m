Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id AB926529DC
	for <meta-arago@arago-project.org>;
	Fri, 20 Dec 2019 20:28:00 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBKKQMvK105665
	for <meta-arago@arago-project.org>; Fri, 20 Dec 2019 14:26:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576873582;
	bh=AqzV1imU/XmF2Q3Mrb/7atH/7Y+XvGTXwHqg3JNiRm0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=L5pDqsgTxk7lNqJiHSHI9c6Hbhi4vyhzaiMcSA8d3c1P0DtOrYsHh6uG7CNwJShPU
	/vE8aNVEg73TaJq4YtACPzSIHsUnAw7WiZPDZEXuW3jZcNFhi8EsJwOF7cAGmuC1nd
	VoROpdKwxaeVVlHCn/7wxEDt7vnOB07w7w7jeNoQ=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBKKQMqN125486
	for <meta-arago@arago-project.org>; Fri, 20 Dec 2019 14:26:22 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 20 Dec 2019 14:26:22 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 20 Dec 2019 14:26:22 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBKKQLtS043367;
	Fri, 20 Dec 2019 14:26:22 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 20 Dec 2019 15:07:18 -0500
Message-ID: <1576872438-22238-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576872438-22238-1-git-send-email-j-stiffler@ti.com>
References: <1576872438-22238-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [RFC 3/3] opencl-examples: improve packaging
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
X-List-Received-Date: Fri, 20 Dec 2019 20:28:01 -0000
Content-Type: text/plain

* Split examples into those that require runtime compilation of
  kernels (opencl-examples-runtime) and those that use prebuilt
  kernels (opencl-examples-offline).
* Retain opencl-examples as the package to bring in all examples.
* Adjust package dependencies accordingly.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-ti/ocl/opencl-examples_git.bb          | 42 +++++++++++++++++++---
 1 file changed, 37 insertions(+), 5 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
index 4732c73..fe09b90 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
@@ -16,12 +16,27 @@ OCL_PERSISTENT_DEPENDS = "ti-xdctools-native ti-ipc-rtos ti-sysbios"
 
 DEPENDS_append_dra7xx = " ${OCL_PERSISTENT_DEPENDS}"
 
-RDEPENDS_${PN} += " opencl-runtime"
-RDEPENDS_${PN}-dev += " libgomp-dev"
+PACKAGES =+ "${PN}-runtime ${PN}-runtime-dbg ${PN}-offline ${PN}-offline-dbg"
+
+RDEPENDS_${PN} = "${PN}-runtime ${PN}-offline"
+RDEPENDS_${PN}-dev += "libgomp-dev"
+RDEPENDS_${PN}-offline += "opencl"
+RDEPENDS_${PN}-runtime += "opencl-runtime"
 
 S = "${WORKDIR}/git/opencl_example_src"
 B = "${S}"
 
+OCL_RUNTIME_COMPILE_EXAMPLE_LIST = " \
+    ccode \
+    null \
+    ooo_callback \
+    simple \
+    vecadd \
+    vecadd_openmp \
+    vecadd_openmp_t \
+    vecadd_subdevice \
+"
+
 OCL_EXAMPLE_LIST = " abort_exit \
                      buffer \
                      ccode \
@@ -100,12 +115,29 @@ do_install() {
     done
 }
 
-FILES_${PN} += "\
-    ${datadir}/ti/examples/opencl \
+# First package the examples which require run-time kernel compilation.
+FILES_${PN}-runtime += "\
+    ${@' '.join(['${datadir}/ti/examples/opencl/' + example for example in d.getVar('OCL_RUNTIME_COMPILE_EXAMPLE_LIST').split()])} \
+"
+
+FILES_${PN}-runtime-dbg += "\
+    ${@' '.join(['${datadir}/ti/examples/opencl/' + example + '/.debug' for example in d.getVar('OCL_RUNTIME_COMPILE_EXAMPLE_LIST').split()])} \
+"
+
+# Remaining examples will fall through to the "offline" package.
+FILES_${PN}-offline += "\
+    ${datadir}/ti/examples/opencl/ \
 "
 
-FILES_${PN}-dbg += "\
+FILES_${PN}-offline-dbg += "\
     ${datadir}/ti/examples/opencl/*/.debug \
 "
 
+# Add makefiles to dev package
+FILES_${PN}-dev = "${datadir}/ti/examples/opencl/Makefile \
+                   ${datadir}/ti/examples/opencl/make.inc"
+
+ALLOW_EMPTY_${PN} = "1"
 INSANE_SKIP_${PN} = "arch ldflags textrel staticdev"
+INSANE_SKIP_${PN}-offline = "arch ldflags textrel staticdev"
+INSANE_SKIP_${PN}-runtime = "arch ldflags textrel staticdev"
-- 
2.7.4


