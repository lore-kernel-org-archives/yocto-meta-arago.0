Return-Path: <yuanzhao@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 5489B5298D
	for <meta-arago@arago-project.org>;
	Tue,  4 Dec 2018 20:49:17 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wB4Kn6q8074282
	for <meta-arago@arago-project.org>; Tue, 4 Dec 2018 14:49:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543956546;
	bh=xlitWPnsrjIRYhkoSRbvI+xhawadVON0WsvHD8Q93n0=;
	h=From:To:CC:Subject:Date;
	b=M1miKVAa8gJwKJ5PJ/wuZzEORu/9FXeY+6+E6DVWcNp2RLMsRSOXbYaDEX+B3gZcl
	P+uQ6wZz6TgX+wDO2tJoApIPKcYnNRaCGvcPeoHjMrp39ax3bzy2A+qaKZLuGgiByW
	yzEJ8mJxbO9Sy9gfY3yG55BqTbxmQDKjY6bcMp38=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wB4Kn6ru032973
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 4 Dec 2018 14:49:06 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 4 Dec 2018 14:49:06 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 4 Dec 2018 14:49:06 -0600
Received: from sdomc-build0.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wB4Kn5R9002664;
	Tue, 4 Dec 2018 14:49:05 -0600
From: Yuan Zhao <yuanzhao@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 4 Dec 2018 14:48:33 -0600
Message-ID: <20181204204833.27940-1-yuanzhao@ti.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v2] tidl-api: update to version 1.2.0
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
X-List-Received-Date: Tue, 04 Dec 2018 20:49:18 -0000
Content-Type: text/plain

- Minimized TIDL API/OpenCL dispatch overhead using multiple execution
  contexts on devices.  Added MNIST example for demonstration.
- Execution graph generation with timestamps.
- Python 3 bindings for TIDL API.
- Add a top level license file.

Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
---
 meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc         | 6 +++---
 meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb      | 2 ++
 meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb | 2 ++
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
index fb37a249..1b1167ec 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
@@ -1,11 +1,11 @@
-PV = "1.1.0.1"
+PV = "1.2.0"
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
index 47e98ef9..fbea9aa8 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
@@ -11,6 +11,8 @@ PR = "${INC_PR}.0"
 COMPATIBLE_MACHINE = "am57xx-evm|am57xx-hs-evm"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+inherit python3native
+
 DEPENDS = "opencv \
            opencl \
            opencl-monitor \
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


