Return-Path: <h-gou@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 41535520DF
	for <meta-arago@arago-project.org>;
	Wed, 18 Sep 2019 21:54:38 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8ILrURE053640
	for <meta-arago@arago-project.org>; Wed, 18 Sep 2019 16:53:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568843610;
	bh=T3s5IewFUTjgCKj9ouquAsBF7NTiUJ/dYfa9z6HvV/c=;
	h=From:To:CC:Subject:Date;
	b=d4XeFaArb1hfVlelbSz0j10IeSDn/k5yMqP/JgO6acAZ9NAcohKHLQI62QpbPp6L1
	A8wDWhpt2XPj2JmCCINfJh6oBTOsp/YYMwYxaYczdD4iFqPPXJ1hGtI+r7KCSKA4uO
	vD0rg0A9OxWE540ZSTodmL6o6MXvQVfgjrzAlffs=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8ILrUNm022264
	for <meta-arago@arago-project.org>; Wed, 18 Sep 2019 16:53:30 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 18 Sep 2019 16:53:26 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 18 Sep 2019 16:53:30 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8ILrTcw087816;
	Wed, 18 Sep 2019 16:53:30 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 18 Sep 2019 17:52:10 -0400
Message-ID: <20190918215213.12185-1-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [master/thud/ti2019.03 1/4] flatbuffers: add version 1.10.0
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
X-List-Received-Date: Wed, 18 Sep 2019 21:54:38 -0000
Content-Type: text/plain

* This is back ported from meta-openembedded master/warrior branch
* This version is required for building armnn with TensorFlow Lite parser

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../flatbuffers/flatbuffers_1.10.0.bb         | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.10.0.bb

diff --git a/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.10.0.bb b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.10.0.bb
new file mode 100644
index 00000000..452e1e65
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.10.0.bb
@@ -0,0 +1,34 @@
+SUMMARY = "Memory Efficient Serialization Library"
+HOMEPAGE = "https://github.com/google/flatbuffers"
+SECTION = "console/tools"
+LICENSE = "Apache-2.0"
+
+PACKAGE_BEFORE_PN = "${PN}-compiler"
+
+RDEPENDS_${PN}-compiler = "${PN}"
+RDEPENDS_${PN}-dev += "${PN}-compiler"
+
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a873c5645c184d51e0f9b34e1d7cf559"
+
+SRCREV = "c0698cc33f1e534bb59c455909b88cc2726089af"
+
+SRC_URI = "git://github.com/google/flatbuffers.git"
+
+# Make sure C++11 is used, required for example for GCC 4.9
+CXXFLAGS += "-std=c++11"
+BUILD_CXXFLAGS += "-std=c++11"
+
+# BUILD_TYPE=Release is required, otherwise flatc is not installed
+EXTRA_OECMAKE += "\
+    -DCMAKE_BUILD_TYPE=Release \
+    -DFLATBUFFERS_BUILD_TESTS=OFF \    
+    -DFLATBUFFERS_BUILD_SHAREDLIB=ON \
+"
+
+inherit cmake
+
+S = "${WORKDIR}/git"
+
+FILES_${PN}-compiler = "${bindir}"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


