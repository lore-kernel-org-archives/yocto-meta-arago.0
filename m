Return-Path: <qsu@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 22C66529D5
	for <meta-arago@arago-project.org>;
	Mon, 27 Aug 2018 15:55:19 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7RFtBvK004808
	for <meta-arago@arago-project.org>; Mon, 27 Aug 2018 10:55:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535385311;
	bh=jIhgbQS6cOMbYD+kTXIlVT9nzxMqJ906RyOcTAetfCI=;
	h=From:To:CC:Subject:Date;
	b=wcfZ4xWuheFTZKrZwg6nQbZJ7vW3JUvbetn/+aF9vvAYT13FLkH1b6tsgJHjDszOP
	gVUKPlDe+1LZ7SyuX2to7likdSTpggEQcWt/16jksl71rBJqLZyucNSfdDDBw/8c38
	acbCZEF5UquC6nRsLnWzpME51zmeWosAUxwSzvWg=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7RFtB9c021394
	for <meta-arago@arago-project.org>; Mon, 27 Aug 2018 10:55:11 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 27 Aug 2018 10:55:11 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 27 Aug 2018 10:55:10 -0500
Received: from UDA0216595.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7RFtA7M028510;
	Mon, 27 Aug 2018 10:55:10 -0500
From: Qin Su <qsu@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 27 Aug 2018 11:55:08 -0400
Message-ID: <1535385308-26032-1-git-send-email-qsu@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] arm-compute-library: Machine Learning library for ARM.
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
X-List-Received-Date: Mon, 27 Aug 2018 15:55:19 -0000
Content-Type: text/plain

The ARM Computer Vision and Machine Learning library is a set of functions
optimised for both ARM CPUs and GPUs using SIMD technologies.

Signed-off-by: Qin Su <qsu@ti.com>
---
 .../arm-compute-library/arm-compute-library.bb     | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library.bb

diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library.bb b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library.bb
new file mode 100644
index 0000000..b26ab8b
--- /dev/null
+++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library.bb
@@ -0,0 +1,42 @@
+DESCRIPTION = "The ARM Computer Vision and Machine Learning library is a set of functions optimised for both ARM CPUs and GPUs."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e2c93841b20cd522af621cabaea3aef8"
+
+SRC_URI = " \
+    git://github.com/ARM-software/ComputeLibrary.git \
+"
+
+SRC_URI[md5sum] = "d84471fbefd077bac76ea188f633a640"
+SRC_URI[sha256sum] = "b92ab52a0e3253e5f5f67b12bd5e8ca4bfb49a3f88ec823c858063aebb1f3aae"
+
+SRCREV = "e2542c9f35ca427286822cd0c9296f49914f78b0"
+
+S = "${WORKDIR}/git"
+
+do_compile_prepend() {
+    unset CC CXX
+}
+do_install_prepend() {
+    unset CC CXX
+}
+
+inherit scons
+
+EXTRA_OESCONS = "arch=armv7a extra_cxx_flags="-fPIC" benchmark_tests=1 validation_tests=0 neon=1 openmp=1 opencl=0"
+
+LIBS += "-larmpl_lp64_mp"
+
+do_install() {
+    #which install
+
+    install -d ${D}/usr/lib
+    cp -rf ${S}/build/*.so ${D}/usr/lib
+    install -d ${D}${datadir}/${PN}
+    cp -rf ${S}/. ${D}${datadir}/${PN}
+}
+
+INSANE_SKIP_${PN}-dev = "dev-elf"
+
+PACKAGES =+ "${PN}-source"
+FILES_${PN}-source = "${datadir}/${PN}"
+
-- 
1.9.1


