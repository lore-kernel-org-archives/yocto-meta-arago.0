Return-Path: <h-gou@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id F15E95299C
	for <meta-arago@arago-project.org>;
	Wed, 18 Sep 2019 15:59:43 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8IFwajR047392
	for <meta-arago@arago-project.org>; Wed, 18 Sep 2019 10:58:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568822316;
	bh=94sqaH5dysS1SlSjPTL/0289jvpqtrNHeqhLzzur08A=;
	h=From:To:CC:Subject:Date;
	b=yt1EGKe0p9rz+E/zfU5xZNKS/XyfVB+eHUrJuzm2t1YQYoJsQ8wd0Ixm2GTODvdkA
	VApSCIFt3/R1PgXyyLIHgugyZcsTVfaEH6qeB4m37kLcRPTgGy88uKW2XBpS8CNnMs
	NW8iIWiIyhBSDZ7BOuPYjrrRo0bHBQZVHPzPGIfs=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8IFwaZs113336
	for <meta-arago@arago-project.org>; Wed, 18 Sep 2019 10:58:36 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 18 Sep 2019 10:58:32 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 18 Sep 2019 10:58:32 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8IFwXr5003038;
	Wed, 18 Sep 2019 10:58:35 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 18 Sep 2019 11:57:16 -0400
Message-ID: <20190918155718.29523-1-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 1/3] flatbuffers: add version 1.10.0
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
X-List-Received-Date: Wed, 18 Sep 2019 15:59:44 -0000
Content-Type: text/plain

* This is back ported from meta-openembedded master/warrior branch
* This version is required for building armnn with TensorFlow Lite parser

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../flatbuffers/flatbuffers_1.10.0.bb         | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 recipes-devtools/flatbuffers/flatbuffers_1.10.0.bb

diff --git a/recipes-devtools/flatbuffers/flatbuffers_1.10.0.bb b/recipes-devtools/flatbuffers/flatbuffers_1.10.0.bb
new file mode 100644
index 0000000..452e1e6
--- /dev/null
+++ b/recipes-devtools/flatbuffers/flatbuffers_1.10.0.bb
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


