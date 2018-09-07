Return-Path: <yuanzhao@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 2FF9352982
	for <meta-arago@arago-project.org>;
	Fri,  7 Sep 2018 20:51:12 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w87Kp4iN094003
	for <meta-arago@arago-project.org>; Fri, 7 Sep 2018 15:51:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536353464;
	bh=hX8d6/jLgkWCYnd6KVSmnDQbD7BUAmkk8VipvwDgEcM=;
	h=From:To:CC:Subject:Date;
	b=u9UTTNvp10ZoFVCscFI72/1d5xhfuVSAMxjENsh0eCZsTdp4mYiGCPgDZeY5bUtQa
	W4/8RNmoLGM/uADYpqg7BtD3Oa6wiFM5tpmKwyTB3L7dAOFwVSQEOUQEJsojxXY4xe
	z6JeHYI8Tf5UzHIWOl0KeBHWoRD0y2Y9Rk1coKQM=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w87Kp2DH029630
	for <meta-arago@arago-project.org>; Fri, 7 Sep 2018 15:51:03 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 7 Sep 2018 15:51:03 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 7 Sep 2018 15:51:03 -0500
Received: from sdomc-build0.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w87Kp3VC014497;
	Fri, 7 Sep 2018 15:51:03 -0500
From: Yuan Zhao <yuanzhao@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 7 Sep 2018 15:50:41 -0500
Message-ID: <20180907205041.85540-1-yuanzhao@ti.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] tidl-api: update to version 01.01.00.00
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
X-List-Received-Date: Fri, 07 Sep 2018 20:51:12 -0000
Content-Type: text/plain

Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
---
 meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc         | 6 +++---
 meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb      | 2 +-
 meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb | 2 +-
 meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb   | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
index f1a34eb0..97c2b68d 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
@@ -1,11 +1,11 @@
-PV = "1.0.0.2"
+PV = "1.1.0.0"
 INC_PR = "r0"
 
-LIC_FILES_CHKSUM = "file://tidl_api_manifest.html;md5=ae816cc40db02fe06193212437ad00e8"
+LIC_FILES_CHKSUM = "file://tidl_api_manifest.html;md5=fb8d8b8edb866b0b233462139d1c3222"
 
 GIT_URI = "git://git.ti.com/tidl/tidl-api.git"
 GIT_PROTOCOL = "git"
 BRANCH = "master"
 
 SRC_URI = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
-SRCREV = "06585057d0f47bb930647123557bc5a1506dabda"
+SRCREV = "a229faf1c14ddfa48e44d271ddfad44e4e7fc033"
diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
index 9c41ef11..47e98ef9 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
@@ -1,6 +1,6 @@
 SUMMARY = "TIDL API"
 DESCRIPTION = "TIDL API header and library. Refer TIDL API User's Guide for details."
-HOMEPAGE = "http://software-dl.ti.com/mctools/docs/tidl-api/intro.html"
+HOMEPAGE = "https://downloads.ti.com/mctools/esd/docs/tidl-api/intro.html"
 LICENSE = "BSD"
 
 include tidl-api.inc
diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
index a1f3ea68..94f215c3 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
@@ -1,6 +1,6 @@
 SUMMARY = "TIDL API examples"
 DESCRIPTION = "Examples of TIDL API. Refer TIDL API User's Guide for details."
-HOMEPAGE = "http://software-dl.ti.com/mctools/docs/tidl-api/intro.html"
+HOMEPAGE = "https://downloads.ti.com/mctools/esd/docs/tidl-api/intro.html"
 LICENSE = "BSD"
 
 include tidl-api.inc
diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb
index 3c761747..9a2cff13 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb
@@ -1,6 +1,6 @@
 SUMMARY = "TIDL Network Viewer"
 DESCRIPTION = "TIDL Network viewer using dot and graphviz"
-HOMEPAGE = "http://software-dl.ti.com/mctools/docs/tidl-api/intro.html"
+HOMEPAGE = "https://downloads.ti.com/mctools/esd/docs/tidl-api/intro.html"
 LICENSE = "BSD"
 
 include tidl-api.inc
-- 
2.14.1


