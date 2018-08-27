Return-Path: <qsu@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id C2F89529D5
	for <meta-arago@arago-project.org>;
	Mon, 27 Aug 2018 15:49:24 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7RFnHcw101119
	for <meta-arago@arago-project.org>; Mon, 27 Aug 2018 10:49:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535384957;
	bh=AgphmTUJbiBZgJ+MAfAp4hNTjBkPqNHr6cr0OrHGMX4=;
	h=From:To:CC:Subject:Date;
	b=dx4CCFwmcGMVCTKOTkJH3YFT34+H1X5QpAHRaZCqgj9mXwZmt6pCabZrW7ti12LGU
	GfevnRi5cVO5CEtzM/5PT9OCcNo6ZCaUXzLtxIWynDcCxp1qQwCFfOkJYW8mPuyiXT
	gwbZCTj5aL2W2P9P2an5Y049sYG7QfDhtpfalGC8=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7RFnHLY010928
	for <meta-arago@arago-project.org>; Mon, 27 Aug 2018 10:49:17 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 27 Aug 2018 10:49:17 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 27 Aug 2018 10:49:16 -0500
Received: from UDA0216595.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7RFnGfd022309;
	Mon, 27 Aug 2018 10:49:16 -0500
From: Qin Su <qsu@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 27 Aug 2018 11:49:13 -0400
Message-ID: <1535384953-25932-1-git-send-email-qsu@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] protobuf-tidl: protobuf version 3.2.0.
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
X-List-Received-Date: Mon, 27 Aug 2018 15:49:25 -0000
Content-Type: text/plain

The version is used in generating caffe and tensorflow protobuf files for
building caffe and tensorflow network models in armnn.

Signed-off-by: Qin Su <qsu@ti.com>
---
 .../protobuf-tidl/protobuf-tidl_3.2.0.bb           | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/protobuf-tidl/protobuf-tidl_3.2.0.bb

diff --git a/meta-arago-extras/recipes-support/protobuf-tidl/protobuf-tidl_3.2.0.bb b/meta-arago-extras/recipes-support/protobuf-tidl/protobuf-tidl_3.2.0.bb
new file mode 100644
index 0000000..d67529a
--- /dev/null
+++ b/meta-arago-extras/recipes-support/protobuf-tidl/protobuf-tidl_3.2.0.bb
@@ -0,0 +1,38 @@
+SUMMARY = "Protocol Buffers - structured data serialisation mechanism"
+DESCRIPTION = "Protocol Buffers are a way of encoding structured data in an \
+efficient yet extensible format. Google uses Protocol Buffers for almost \
+all of its internal RPC protocols and file formats. This recipe is needed for \
+compatiblity with TIDL 1.1.0 release, Linux x86 version of import tool"
+
+HOMEPAGE = "https://github.com/google/protobuf"
+SECTION = "console/tools"
+LICENSE = "BSD-3-Clause"
+
+PACKAGE_BEFORE_PN = "${PN}-compiler ${PN}-lite"
+
+DEPENDS = "zlib"
+RDEPENDS_${PN}-compiler = "${PN}"
+RDEPENDS_${PN}-dev += "${PN}-compiler"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=35953c752efc9299b184f91bef540095"
+
+SRCREV = "593e917c176b5bc5aafa57bf9f6030d749d91cd5"
+
+PV = "3.2.0+git${SRCPV}"
+
+SRC_URI = "git://github.com/google/protobuf.git;branch=3.2.x"
+
+EXTRA_OECONF_class-target     = " --with-protoc=echo"
+EXTRA_OECONF_class-native     = " --with-protoc=echo"
+EXTRA_OECONF_class-native    += "CFLAGS="-m32 -DNDEBUG" CXXFLAGS="-m32 -DNDEBUG" LDFLAGS=-m32"
+
+inherit autotools-brokensep
+
+S = "${WORKDIR}/git"
+
+FILES_${PN}-compiler = "${bindir} ${libdir}/libprotoc${SOLIBS}"
+FILES_${PN}-lite = "${bindir} ${libdir}/libprotobuf-lite${SOLIBS}"
+
+MIPS_INSTRUCTION_SET = "mips"
+
+BBCLASSEXTEND = "native"
-- 
1.9.1


