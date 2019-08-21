Return-Path: <h-gou@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 96A825298D
	for <meta-arago@arago-project.org>;
	Wed, 21 Aug 2019 22:59:20 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7LMwK71112280
	for <meta-arago@arago-project.org>; Wed, 21 Aug 2019 17:58:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1566428300;
	bh=RNwXLVEkLretVb6G9p5IaNOQEQ24rPqTlHOcy/HiyrI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=p5v0QKuGLVm1qIEVoMfB5hGfmKP8vmJ3jy/RTg2Z6RZER4Dtk1SKKC6uvgP8W149L
	6DGQjK3BdOqbxix0TD6b806nCQ/jx5XkCpkuwZksSbdgjJaSwyfK2a8zSpi0o5sHBz
	JI7d89Un3y4eAiuwEo/ALi4u29GVzdfVqaSbmLJs=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7LMwKku080621
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 21 Aug 2019 17:58:20 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 21 Aug 2019 17:58:20 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 21 Aug 2019 17:58:20 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7LMwJCd074536;
	Wed, 21 Aug 2019 17:58:20 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 21 Aug 2019 18:58:02 -0400
Message-ID: <20190821225807.22947-3-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821225807.22947-1-a0271529@ti.com>
References: <20190821225807.22947-1-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [PATCH 2/7] flatbuffers: add version 1.10.0 needed by tensorflow-lite
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


