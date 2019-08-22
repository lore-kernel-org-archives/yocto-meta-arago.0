Return-Path: <h-gou@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 8B37B5298D
	for <meta-arago@arago-project.org>;
	Thu, 22 Aug 2019 20:46:42 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7MKjg5A106448
	for <meta-arago@arago-project.org>; Thu, 22 Aug 2019 15:45:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1566506742;
	bh=+TO/qbHaAfWPFvj97uX7499WxY/5GsKPhR9m6TzS9b4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=OsrHxf1v0/ut9ZwrlrT15VtF1Xv0f7aVi8sYVj6+5XfRm5KB1cFCaxUP75a+ET3Qm
	NY+W/RvK2SFy1sQYbvUhzm7DxCxyfBzzKd5P0K3HCxxsMnTetRJg6z6bztnQGW0XBh
	u0ePYh0Yyqz0UVQG04wQ6OU7zp7Xk4kB2XOYhtNE=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7MKjgRL020924
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 22 Aug 2019 15:45:42 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 22 Aug 2019 15:45:42 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 22 Aug 2019 15:45:42 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7MKjfTC117764;
	Thu, 22 Aug 2019 15:45:41 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Aug 2019 16:45:38 -0400
Message-ID: <20190822204539.6115-2-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822204539.6115-1-a0271529@ti.com>
References: <20190822204539.6115-1-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 2/3] tensorflow-lite: install minimal and benchmark_model examples, and all .a files
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
X-List-Received-Date: Thu, 22 Aug 2019 20:46:43 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../tensorflow-lite/tensorflow-lite_1.12.bb        | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/recipes-support/tensorflow-lite/tensorflow-lite_1.12.bb b/recipes-support/tensorflow-lite/tensorflow-lite_1.12.bb
index ebd175e..38df078 100644
--- a/recipes-support/tensorflow-lite/tensorflow-lite_1.12.bb
+++ b/recipes-support/tensorflow-lite/tensorflow-lite_1.12.bb
@@ -35,7 +35,7 @@ SRC_URI = "git://github.com/tensorflow/tensorflow.git;branch=r1.12;protocol=http
 
 SRCREV = "5b900cfe4b3b848f577315a0dde09a729f770e95"
 
-PR = "r1"
+PR = "r2"
 
 S = "${WORKDIR}/git"
 
@@ -94,7 +94,7 @@ do_compile() {
 
 do_install() {
     install -d ${D}${libdir}
-    install -m 0644 ${S}/tensorflow/contrib/lite/tools/make/gen/${TARGET_OS}_${TUNE_ARCH}/lib/libtensorflow-lite.a ${D}${libdir}/
+    install -m 0644 ${S}/tensorflow/contrib/lite/tools/make/gen/${TARGET_OS}_${TUNE_ARCH}/lib/*.a ${D}${libdir}/
     install -d ${D}${includedir}/tensorflow/contrib/lite
     install -m 0644 ${S}/tensorflow/contrib/lite/*.h ${D}${includedir}/tensorflow/contrib/lite/
     install -d ${D}${includedir}/tensorflow/contrib/lite/c
@@ -114,6 +114,16 @@ do_install() {
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


