Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 86E1452993
	for <meta-arago@arago-project.org>;
	Fri, 14 Sep 2018 18:40:01 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8EIdrTw074913
	for <meta-arago@arago-project.org>; Fri, 14 Sep 2018 13:39:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536950393;
	bh=abbl1dHGKMwa4ThQrh1ZOZX5JMnv0H2Fqz0THmy44SE=;
	h=From:To:CC:Subject:Date;
	b=U2nxJKzi/54ZwwVMUkQlYV5g6mxCHpwGlcV5ZQ+lUJF0Eu36IAbO3+LwrCQhaEW0U
	qj0fa1gFyJTEWJ8D1otUCg4ura251TSM1yh+yquGayx6MO9dpO1r+gvEGXOOur81uX
	qI4SVr4OluavhEuhGfAhIEoveWSaxtMBq0J4tQlw=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8EIdri2003760
	for <meta-arago@arago-project.org>; Fri, 14 Sep 2018 13:39:53 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 14 Sep 2018 13:39:52 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 14 Sep 2018 13:39:53 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8EIdqpW009776;
	Fri, 14 Sep 2018 13:39:52 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 14 Sep 2018 14:26:55 -0400
Message-ID: <1536949618-21293-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH v8 2/5] arm-compute-library: Machine Learning library for ARM.
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
X-List-Received-Date: Fri, 14 Sep 2018 18:40:01 -0000
Content-Type: text/plain

From: Qin Su <qsu@ti.com>

The ARM Computer Vision and Machine Learning library is a set of functions
optimised for both ARM CPUs and GPUs using SIMD technologies.

Signed-off-by: Qin Su <qsu@ti.com>
Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
Changes from v6:
* Add SUMMARY
* Add comment explaining that ARMNN expects a built source package of
  arm-compute-library.
* Install to ${datadir}/${BPN} instead of ${datadir}/${PN}
* Remove warnings by adding more INSANE_SKIPS
  - dev: dkip ldflags
  - source: skip ldflags, libdir, staticdev
* INHIBIT_DEBUG_SPLIT so that debug files are not removed from source
  package

Changes from previous versions:
* Add "_git" suffix to recipe name.
* Add version.
* Add branch option for SRC_URI.
* For installation, use install by looping over libraries.
* Remove unnecessary checksums for SRC_URI.
* Set armv7a as COMPATIBLE_MACHINE as this is hardcoded in
  EXTRA_OESCONS.

 .../arm-compute-library/arm-compute-library_git.bb | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb

diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
new file mode 100644
index 0000000..d9fa8b0
--- /dev/null
+++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
@@ -0,0 +1,48 @@
+SUMMARY = "The ARM Computer Vision and Machine Learning library"
+DESCRIPTION = "The ARM Computer Vision and Machine Learning library is a set of functions optimised for both ARM CPUs and GPUs."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e2c93841b20cd522af621cabaea3aef8"
+
+COMPATIBLE_MACHINE = "armv7a"
+
+SRC_URI = " \
+    git://github.com/ARM-software/ComputeLibrary.git;branch=${BRANCH} \
+"
+
+PV  = "18.05"
+
+BRANCH = "master"
+SRCREV = "e2542c9f35ca427286822cd0c9296f49914f78b0"
+
+S = "${WORKDIR}/git"
+
+do_compile_prepend() {
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
+    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
+
+    install -d ${D}${libdir}
+    for lib in ${S}/build/*.so
+    do
+        install -m 0644 $lib ${D}${libdir}
+    done
+
+    # Install built source package as expected by ARMNN
+    install -d ${D}${datadir}/${BPN}
+    cp $CP_ARGS ${S}/. ${D}${datadir}/${BPN}
+}
+
+INSANE_SKIP_${PN}-dev = "dev-elf ldflags"
+
+PACKAGES =+ "${PN}-source"
+FILES_${PN}-source = "${datadir}/${BPN}"
+INSANE_SKIP_${PN}-source = "ldflags libdir staticdev"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-- 
2.7.4


