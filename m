Return-Path: <yuanzhao@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id B78C552993
	for <meta-arago@arago-project.org>;
	Sun,  8 Dec 2019 08:30:52 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB88TJ6e063660
	for <meta-arago@arago-project.org>; Sun, 8 Dec 2019 02:29:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1575793759;
	bh=6/kXxBeM0+B1AkS0QleIWg3gs1q6ipE9HjDxtfzBDwo=;
	h=From:To:CC:Subject:Date;
	b=nqvkM15EvByF+c1i8Zx+OWAYoHxvUE1oTlHqcG2TY3FwzdSCdjAi2AMP6GekjN9G0
	B1WNX+3YQ8jSsF2N2weCHRv3tQ6ipu9QWuaOpODGZag6Cy5V1eqcap2AD3VbIYpA2+
	HDpjomKlm0LF+n2i7XUsbP2N/tCORdZ6iGmmYbCM=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB88TJkI018977
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Sun, 8 Dec 2019 02:29:19 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Sun, 8 Dec 2019 02:29:18 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Sun, 8 Dec 2019 02:29:18 -0600
Received: from sdomc-build0.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB88TIuI021101;
	Sun, 8 Dec 2019 02:29:18 -0600
From: Yuan Zhao <yuanzhao@ti.com>
To: <meta-arago@arago-project.org>
Date: Sun, 8 Dec 2019 02:29:02 -0600
Message-ID: <20191208082902.63426-1-yuanzhao@ti.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v2] tidl-api: update to version 1.4.0
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
X-List-Received-Date: Sun, 08 Dec 2019 08:30:53 -0000
Content-Type: text/plain

- Subgraph execution support.

Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
---
 meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc    | 4 ++--
 meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
index e3e124d0..116928ab 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
@@ -1,4 +1,4 @@
-PV = "1.3.3"
+PV = "1.4.0"
 INC_PR = "r0"
 
 LIC_FILES_CHKSUM = "file://license.txt;md5=e3daeabffb9fc131a73f16d16cbdb118"
@@ -8,7 +8,7 @@ GIT_PROTOCOL = "git"
 BRANCH = "master"
 
 SRC_URI = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
-SRCREV = "092a2ed047b02d9668fddebe61d4e5920bfbfb3f"
+SRCREV = "21faf4b36a0ae9ee5b5c6aaf90d067728ff4f78b"
 
 # default patchdir is ${S}
 S = "${WORKDIR}/git"
diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
index 283a18ee..a8829c1b 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
@@ -41,9 +41,11 @@ do_install() {
     install -d ${D}${TIDL_INSTALL_DIR}
     install -d ${D}${TIDL_INSTALL_DIR}/tidl_api
     install -d ${D}${TIDL_INSTALL_DIR}/viewer
+    install -d ${D}${libdir}
     cp ${CP_ARGS} ${S}/tidl_api/* ${D}${TIDL_INSTALL_DIR}/tidl_api/
     cp ${CP_ARGS} ${S}/viewer/* ${D}${TIDL_INSTALL_DIR}/viewer/
     install ${S}/readme.md ${D}${TIDL_INSTALL_DIR}/
+    cp ${CP_ARGS} ${S}/tidl_api/libtidl_*.so ${D}${libdir}
 }
 
 FILES_${PN} += "\
-- 
2.14.1


