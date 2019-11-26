Return-Path: <xuj@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id E0B97529C0
	for <meta-arago@arago-project.org>;
	Tue, 26 Nov 2019 01:48:17 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAQ1kmbM116724
	for <meta-arago@arago-project.org>; Mon, 25 Nov 2019 19:46:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1574732808;
	bh=2duKzW34e7dZORB3cusNw91XYX45/UbmJw4ZYG+lx8Y=;
	h=From:To:CC:Subject:Date;
	b=qYLG4d+7hExpenO3GBJ2zzDYclLgGzb8Ib+x8rIkFtSirFoBcij/JIvfypeUpHvNj
	/7TliVNh7f3sp5VUEdgqC7V+Nny38VI2FfLVx1TjFmJJn5Bl5gyfaYBg6A6kAkBUER
	wDTU0JJgE9mUp4ySnXeq4QsVZlA9qTjaQw/rKi+g=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAQ1kmue027511
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 25 Nov 2019 19:46:48 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Mon, 25 Nov 2019 19:46:48 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Mon, 25 Nov 2019 19:46:48 -0600
Received: from UDA0869574.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAQ1kmLf000937;
	Mon, 25 Nov 2019 19:46:48 -0600
From: Jianzhong Xu <xuj@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 25 Nov 2019 20:45:11 -0500
Message-ID: <20191126014511.399-1-xuj@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH] neo-ai-dlr: fix dlr runtime problem
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
X-List-Received-Date: Tue, 26 Nov 2019 01:48:18 -0000
Content-Type: text/plain

* move dlr shared library to python site-packages dlr folder
* add neo-ai-dlr-tests to target file system
* change testing scripts' path to be the same as in source code

Signed-off-by: Jianzhong Xu <xuj@ti.com>
---
 .../packagegroup-arago-tisdk-addons.bbappend          |  2 +-
 recipes-support/neo-ai/neo-ai-dlr_git.bb              | 11 ++++++-----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
index 2a298e0..aa0a182 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
@@ -17,7 +17,7 @@ EXTRA_PACKAGES_append_k3 = " watchdog"
 
 EXTRA_PACKAGES_append_omapl138 = " ccief-basic"
 
-NEO_AI_PACKAGES = "neo-ai-dlr"
+NEO_AI_PACKAGES = "neo-ai-dlr neo-ai-dlr-tests"
 NEO_AI_PACKAGES_armv5 = ""
 
 EXTRA_PACKAGES_append = " hidapi \
diff --git a/recipes-support/neo-ai/neo-ai-dlr_git.bb b/recipes-support/neo-ai/neo-ai-dlr_git.bb
index cbf4447..a895d21 100644
--- a/recipes-support/neo-ai/neo-ai-dlr_git.bb
+++ b/recipes-support/neo-ai/neo-ai-dlr_git.bb
@@ -55,16 +55,17 @@ do_install() {
     distutils3_do_install
     cd ${B}
 
-    # setup.py install some libs under datadir, but we don't need them, so remove.
-    rm ${D}${datadir}/dlr/*.so
+    # move shared library to Python search path
+    mv ${D}${libdir}/libdlr.so ${D}${PYTHON_SITEPACKAGES_DIR}/dlr
 
     # Now install python test scripts
-    install -d ${D}${datadir}/dlr/tests
-    install -m 0644 ${S}/tests/python/integration/*.py ${D}${datadir}/dlr/tests/
+    install -d ${D}${datadir}/neo-ai-dlr/tests/python/integration
+    install -m 0644 ${S}/tests/python/integration/*.py ${D}${datadir}/neo-ai-dlr/tests/python/integration
+    install -m 0644 ${S}/tests/python/integration/*.npy ${D}${datadir}/neo-ai-dlr/tests/python/integration
 }
 
 PACKAGES =+ "${PN}-tests"
-FILES_${PN}-tests = "${datadir}/dlr/tests"
+FILES_${PN}-tests = "${datadir}/neo-ai-dlr/tests"
 RDEPENDS_${PN}-tests += "${PN}"
 
 # Versioned libs are not produced
-- 
2.17.1


