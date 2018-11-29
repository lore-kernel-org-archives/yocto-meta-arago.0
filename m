Return-Path: <yuanzhao@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 83E3F5299E
	for <meta-arago@arago-project.org>;
	Thu, 29 Nov 2018 23:09:52 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wATN9ehe026905
	for <meta-arago@arago-project.org>; Thu, 29 Nov 2018 17:09:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543532980;
	bh=uG/hGPQC5QwP8YUs6RYeNPGUR7eND1/5VAtCeh6t1u8=;
	h=From:To:CC:Subject:Date;
	b=PmQ8ebh2iletdQJ8yc4X1XCM2CNgXqaV5WDwfghg8ZQWN0oXqedhIC/1GnB/fMJl6
	emRghF2dmXcLXEmlL3M9bOTUCQnLhp39hXWQ5s0pJoLPvtQGz9UQbRzTJmLyJuitoe
	hAIr9dNFAxtte6wMA1XwgBb+mxZryWlLpfNk4IwI=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wATN9ejp091720
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 29 Nov 2018 17:09:40 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Thu, 29 Nov 2018 17:09:40 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Thu, 29 Nov 2018 17:09:39 -0600
Received: from sdomc-build0.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wATN9dtW025130;
	Thu, 29 Nov 2018 17:09:40 -0600
From: Yuan Zhao <yuanzhao@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 29 Nov 2018 17:09:28 -0600
Message-ID: <20181129230928.90335-1-yuanzhao@ti.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] tidl-api: update to version 01.02.00
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
X-List-Received-Date: Thu, 29 Nov 2018 23:09:59 -0000
Content-Type: text/plain

- Minimized TIDL API/OpenCL dispatch overhead using multiple execution
  contexts on devices.  Added MNIST example for demonstration.
- Execution graph generation with timestamps.
- Python 3 bindings for TIDL API.

Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
---
 meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc         | 6 +++---
 meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb      | 1 +
 meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb | 2 ++
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
index fb37a249..b3115c23 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
@@ -1,11 +1,11 @@
-PV = "1.1.0.1"
+PV = "01.02.00"
 INC_PR = "r0"
 
-LIC_FILES_CHKSUM = "file://tidl_api_manifest.html;md5=fb8d8b8edb866b0b233462139d1c3222"
+LIC_FILES_CHKSUM = "file://license.txt;md5=e3daeabffb9fc131a73f16d16cbdb118"
 
 GIT_URI = "git://git.ti.com/tidl/tidl-api.git"
 GIT_PROTOCOL = "git"
 BRANCH = "master"
 
 SRC_URI = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
-SRCREV = "7e9a3942ec38efd64d45e34c10cba2f2938f5618"
+SRCREV = "03978a83b03d8881261222344d1a08e0f4e2bd06"
diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
index 47e98ef9..efd705af 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
@@ -16,6 +16,7 @@ DEPENDS = "opencv \
            opencl-monitor \
            ti-cgt6x-native \
            clocl-native \
+           python3 \
 "
 
 RDEPENDS_${PN} += "opencl-runtime \
diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
index 94f215c3..2f5ca537 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
@@ -15,11 +15,13 @@ DEPENDS = "opencv \
            clocl-native \
            ti-cgt6x-native \
            tidl-api \
+           json-c \
 "
 
 RDEPENDS_${PN} += "tidl-api \
                    opencl-runtime \
                    opencv \
+                   json-c \
 "
 
 S = "${WORKDIR}/git"
-- 
2.14.1


