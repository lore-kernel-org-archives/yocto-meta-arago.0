Return-Path: <h-gou@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 5E832529F9
	for <meta-arago@arago-project.org>;
	Wed, 21 Aug 2019 22:59:21 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7LMwLt1112293
	for <meta-arago@arago-project.org>; Wed, 21 Aug 2019 17:58:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1566428301;
	bh=XE6mAPQ+1V8kY9S/5iQ6PZoRZllA/RLhTT7eFO/D79k=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=qZuy7DUMWSFxJ+kVo+cnqRYYX3dzIXhxwPvJgFJ4BB56/U8Wf+MX6/omdz6CT7vCB
	UEvpbWqkcR1Gq8GB5RuPMv0JRy5G3pA6T2Z2Ml8OG22HmmidYVP0QwxajbqfxsoTyY
	Bk/aVT11HD8zdzJDoyX5OpZbgY+CSS7MT/pQkNEM=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7LMwLGR080652
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 21 Aug 2019 17:58:21 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 21 Aug 2019 17:58:21 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 21 Aug 2019 17:58:21 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7LMwJCh074536;
	Wed, 21 Aug 2019 17:58:21 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 21 Aug 2019 18:58:06 -0400
Message-ID: <20190821225807.22947-7-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821225807.22947-1-a0271529@ti.com>
References: <20190821225807.22947-1-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [PATCH 6/7] tensorflow-lite: install minimal and benchmark_model examples, and all .a files
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
X-List-Received-Date: Wed, 21 Aug 2019 22:59:24 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../tensorflow-lite/tensorflow-lite_1.12.bb        | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.12.bb b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.12.bb
index b5112939..20f0ffed 100644
--- a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.12.bb
+++ b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.12.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/tensorflow/tensorflow.git;branch=r1.12;protocol=http
 
 SRCREV = "5b900cfe4b3b848f577315a0dde09a729f770e95"
 
-PR = "r1"
+PR = "r2"
 
 S = "${WORKDIR}/git"
 
@@ -51,7 +51,7 @@ do_compile() {
 
 do_install() {
     install -d ${D}${libdir}
-    install -m 0644 ${S}/tensorflow/contrib/lite/tools/make/gen/${TARGET_OS}_${TUNE_ARCH}/lib/libtensorflow-lite.a ${D}${libdir}/
+    install -m 0644 ${S}/tensorflow/contrib/lite/tools/make/gen/${TARGET_OS}_${TUNE_ARCH}/lib/*.a ${D}${libdir}/
     install -d ${D}${includedir}/tensorflow/contrib/lite
     install -m 0644 ${S}/tensorflow/contrib/lite/*.h ${D}${includedir}/tensorflow/contrib/lite/
     install -d ${D}${includedir}/tensorflow/contrib/lite/c
@@ -71,6 +71,16 @@ do_install() {
     sed -i 's:@version@:${PV}:g
         s:@libdir@:${libdir}:g
         s:@includedir@:${includedir}:g' ${D}${libdir}/pkgconfig/tensorflow-lite.pc
+    # install examples
+    install -d ${D}${datadir}/${PN}-${PV}/examples
+    install -m 0755 ${S}/tensorflow/contrib/lite/tools/make/gen/${TARGET_OS}_${TUNE_ARCH}/bin/minimal ${D}${datadir}/${PN}-${PV}/examples
+    install -m 0755 ${S}/tensorflow/contrib/lite/tools/make/gen/${TARGET_OS}_${TUNE_ARCH}/bin/benchmark_model ${D}${datadir}/${PN}-${PV}/examples
 }
 
+PACKAGES += "${PN}-examples"
+
+FILES_${PN}-examples = " \
+    ${datadir}/${PN}-${PV}/examples/minimal \
+    ${datadir}/${PN}-${PV}/examples/benchmark_model \ "
+
 ALLOW_EMPTY_${PN} = "1"
-- 
2.17.1


