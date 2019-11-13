Return-Path: <h-gou@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 4213A529D4
	for <meta-arago@arago-project.org>;
	Wed, 13 Nov 2019 00:25:50 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAD0OO4H017641
	for <meta-arago@arago-project.org>; Tue, 12 Nov 2019 18:24:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573604664;
	bh=trXroV+fQVJQioapYaq/l3h5+Kv8p4i8dmMR4iCUFg8=;
	h=From:To:CC:Subject:Date;
	b=foTuKuOfpBuGWr5dP7HyYR9+d1dEPugW7PYwKerLjFgYnWwXeTfLNY4WCbVo1ZqYT
	HrkWY8DgAFyb1u/Z+GEhIKs6OekFaAP5zIiqdiSPhuMyu1FZdghePn21mMo6P3X4Kd
	rvreAeLovKe8nom+s5tHCb2HLz6aEkckKP64km1w=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAD0OODr005622
	for <meta-arago@arago-project.org>; Tue, 12 Nov 2019 18:24:24 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 12 Nov 2019 18:24:06 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Tue, 12 Nov 2019 18:24:06 -0600
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAD0ONE8056588;
	Tue, 12 Nov 2019 18:24:23 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 12 Nov 2019 19:13:47 -0500
Message-ID: <20191113001349.30916-1-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [thud/master] [PATCH 1/3] tensorflow-lite: correct typos when modifying the compilation flags
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
X-List-Received-Date: Wed, 13 Nov 2019 00:25:51 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../tensorflow-lite/tensorflow-lite_1.15.bb          | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.15.bb b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.15.bb
index 612440c3..c676177b 100644
--- a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.15.bb
+++ b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.15.bb
@@ -40,17 +40,17 @@ SRC_URI[mobilenet_v1_quant.sha256sum] = "d32432d28673a936b2d6281ab0600c71cf7226d
 
 SRCREV = "590d6eef7e91a6a7392c8ffffb7b58f2e0c8bc6b"
 
-PR = "r0"
+PR = "r1"
 
 S = "${WORKDIR}/git"
 
 DEPENDS = "zlib"
 TARGET_CFLAGS_remove = "-O2"
-TARGET_CPPLAGS_remove = "-O2"
-TARGET_CXXLAGS_remove = "-O2"
-CCFLAGS_append = " -O3 -DNDEBUG -fPIC -DGEMMLOWP_ALLOW_SLOW_SCALAR_FALLBACK \
+TARGET_CPPFLAGS_remove = "-O2"
+TARGET_CXXFLAGS_remove = "-O2"
+CFLAGS_append = " -O3 -DNDEBUG -fPIC -DGEMMLOWP_ALLOW_SLOW_SCALAR_FALLBACK \
     -I${STAGING_INCDIR}"
-CXXFLAGS_append = " -O3 -DNDEBUG -fPIC -DGEMMLOWP_ALLOW_SLOW_SCALAR_FALLBACK \
+CPPFLAGS_append = " -O3 -DNDEBUG -fPIC -DGEMMLOWP_ALLOW_SLOW_SCALAR_FALLBACK \
     -I${STAGING_INCDIR}"
 LDFLAGS_remove = "-Wl,-O1"
 CXXFLAGS_append = " -O3 -DNDEBUG -fPIC -DGEMMLOWP_ALLOW_SLOW_SCALAR_FALLBACK \
@@ -84,7 +84,7 @@ EXTRA_OEMAKE = "\
     'CXX=${CXX}' \
     'CPP=${CPP}' \
     'CFLAGS=${CFLAGS}' \
-    'CPPFLAGS=${CFLAGS}' \
+    'CPPFLAGS=${CPPFLAGS}' \
     'CXXFLAGS=${CXXFLAGS}' \
     'AR=${AR}' \
     'LD=${LD}' \
-- 
2.17.1


