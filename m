Return-Path: <h-gou@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id C1CE3529F4
	for <meta-arago@arago-project.org>;
	Wed, 21 Aug 2019 22:59:20 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7LMwLqZ085977
	for <meta-arago@arago-project.org>; Wed, 21 Aug 2019 17:58:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1566428301;
	bh=HsSRMVuUOlPCR/H5ANfduRZfi426EiBg4/q1+1PBeAo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=EqyHSkSwMjx34Ixt/8caPPxECTKKY2hNyWd9tunLtoy9kB8EevZNpp+D4BUCIu9K3
	FcL9nE8nkARhs833/GTAAjuGJD8oEeoCbIvTX+2WeDDJGZ1Xe28ET7mB31fcBEPGt8
	Kewe9t9a35MQVv68YPUmsF0/p4pzfzbO2eNHENag=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7LMwLjf053808
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 21 Aug 2019 17:58:21 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 21 Aug 2019 17:58:21 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 21 Aug 2019 17:58:20 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7LMwJCf074536;
	Wed, 21 Aug 2019 17:58:20 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 21 Aug 2019 18:58:04 -0400
Message-ID: <20190821225807.22947-5-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821225807.22947-1-a0271529@ti.com>
References: <20190821225807.22947-1-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [PATCH 4/7] tensorflow-lite-*: add other dependencies for tensorflow-lite 1.12
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
X-List-Received-Date: Wed, 21 Aug 2019 22:59:22 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../tensorflow-lite/tensorflow-lite-absl_git.bb  | 16 ++++++++++++++++
 .../tensorflow-lite-farmhash_git.bb              | 14 ++++++++++++++
 .../tensorflow-lite/tensorflow-lite-fft2d_1.0.bb | 14 ++++++++++++++
 .../tensorflow-lite-gemmlowp_git.bb              | 16 ++++++++++++++++
 .../tensorflow-lite-neon-2-sse_git.bb            | 14 ++++++++++++++
 5 files changed, 74 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-absl_git.bb
 create mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-farmhash_git.bb
 create mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-fft2d_1.0.bb
 create mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-gemmlowp_git.bb
 create mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-neon-2-sse_git.bb

diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-absl_git.bb b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-absl_git.bb
new file mode 100644
index 00000000..8d02958a
--- /dev/null
+++ b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-absl_git.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Abseil C++ Common Libraries"
+HOMEPAGE = "https://github.com/abseil/abseil-cpp"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=917cc5763a741e915bf7f2cc55830c17"
+
+SRC_URI = "git://github.com/abseil/abseil-cpp.git"
+SRCREV  = "48cd2c3f351ff188bc85684b84a91b6e6d17d896"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+do_install() {
+    install -d ${D}${datadir}/absl
+    cp -r ${S}/absl ${D}${datadir}/absl
+}
diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-farmhash_git.bb b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-farmhash_git.bb
new file mode 100644
index 00000000..cd0bb14c
--- /dev/null
+++ b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-farmhash_git.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "FarmHash, a family of hash functions"
+HOMEPAGE = "https://github.com/google/farmhash"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7dfaa79e2b070897e495fec386e3acfc"
+
+SRC_URI = "git://github.com/google/farmhash.git"
+SRCREV  = "816a4ae622e964763ca0862d9dbd19324a1eaf45"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+    install -d ${D}${datadir}/farmhash
+    cp -r ${S}/src ${D}${datadir}/farmhash
+}
diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-fft2d_1.0.bb b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-fft2d_1.0.bb
new file mode 100644
index 00000000..5a01a2b2
--- /dev/null
+++ b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-fft2d_1.0.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "General Purpose FFT (Fast Fourier/Cosine/Sine Transform) Package"
+LICENSE = "FFT-License"
+LIC_FILES_CHKSUM = "file://readme.txt;beginline=140;endline=145;md5=62461d28fdc0c056c098f3fb2f015799"
+
+SRC_URI = "https://mirror.bazel.build/www.kurims.kyoto-u.ac.jp/~ooura/fft.tgz;downloadfilename=${BP}.tgz"
+SRC_URI[md5sum] = "4255dd8a74949d123216b1ab91520469"
+SRC_URI[sha256sum] = "52bb637c70b971958ec79c9c8752b1df5ff0218a4db4510e60826e0cb79b5296"
+
+S = "${WORKDIR}/fft"
+
+do_install() {
+    install -d ${D}${datadir}/fft2d
+    cp -r ${S}/* ${D}${datadir}/fft2d
+}
diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-gemmlowp_git.bb b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-gemmlowp_git.bb
new file mode 100644
index 00000000..9ce38486
--- /dev/null
+++ b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-gemmlowp_git.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "gemmlowp: a small self-contained low-precision GEMM library"
+HOMEPAGE = "https://github.com/google/gemmlowp"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI = "git://github.com/google/gemmlowp.git"
+SRCREV  = "38ebac7b059e84692f53e5938f97a9943c120d98"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+    install -d ${D}${datadir}/gemmlowp
+    cp -r ${S}/* ${D}${datadir}/gemmlowp
+}
+
+INSANE_SKIP_${PN} = "file-rdeps"
diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-neon-2-sse_git.bb b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-neon-2-sse_git.bb
new file mode 100644
index 00000000..a93bf1fd
--- /dev/null
+++ b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-neon-2-sse_git.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Header file simplifying ARM->IA32 porting"
+HOMEPAGE = "https://github.com/intel/ARM_NEON_2_x86_SSE"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b4fdfcb48f273d192333c498d75fa26f"
+
+SRC_URI = "git://github.com/intel/ARM_NEON_2_x86_SSE.git"
+SRCREV  = "3057bb91b99bae9c7fbdf8710c032d462ca10051"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+    install -d ${D}${datadir}/neon-2-sse
+    cp -r ${S}/*.h ${D}${datadir}/neon-2-sse
+}
-- 
2.17.1


