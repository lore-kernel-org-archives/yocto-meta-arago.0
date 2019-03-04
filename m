Return-Path: <yuanzhao@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id ED99452960
	for <meta-arago@arago-project.org>;
	Mon,  4 Mar 2019 22:50:55 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x24MonuZ073359
	for <meta-arago@arago-project.org>; Mon, 4 Mar 2019 16:50:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551739849;
	bh=3SvdynWlN9UTMM6DV7BKzvLjwVdyC+A9O38eQO7ky/k=;
	h=From:To:CC:Subject:Date;
	b=pQ3loJVfZt0Ybu88J5fJB56CNr9VWs+6YvyJ+eaA4YQ4HPSAP0YABlRYgopLqy9Tf
	pkaSdYrZ8/dbSXP6SJpVQU60tO+V6GhzY+Vs6sUoJdB1SIXRixg9vqEJvyppHg1BRr
	T2jJsms3dQwu1uPPAspx77Nx45H48D0PGL48MRZA=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x24MonRZ069346
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 4 Mar 2019 16:50:49 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 4 Mar 2019 16:50:48 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 4 Mar 2019 16:50:48 -0600
Received: from sdomc-build0.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x24Mom8S011730;
	Mon, 4 Mar 2019 16:50:48 -0600
From: Yuan Zhao <yuanzhao@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 4 Mar 2019 16:50:38 -0600
Message-ID: <20190304225038.110745-1-yuanzhao@ti.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] ocl: update version to 01.01.18.00
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
X-List-Received-Date: Mon, 04 Mar 2019 22:50:56 -0000
Content-Type: text/plain

- Runtime support update for TIDL API 01.03.00
- Update OpenCL TIDL firmware to 01.01.18.00

Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
---
 meta-arago-extras/recipes-ti/ocl/ocl.inc               | 6 +++---
 meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extras/recipes-ti/ocl/ocl.inc
index 96d1836f..21247177 100644
--- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
+++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
@@ -1,6 +1,6 @@
 # patch version at the end needs to be in double digits
-PV = "1.1.17.01"
-INC_PR = "r1"
+PV = "1.1.18.00"
+INC_PR = "r0"
 
 LIC_FILES_CHKSUM = "file://../debian/copyright;md5=2e3965a73a8a49c23836467266120dff"
 
@@ -10,7 +10,7 @@ OCL_GIT_URI = "git://git.ti.com/opencl/ti-opencl.git"
 OCL_GIT_PROTOCOL = "git"
 OCL_GIT_BRANCH = "master"
 
-OCL_SRCREV = "61d9dbae3ee40f8023ec624601c2a0cc9e80220f"
+OCL_SRCREV = "a50d8b41cc30bdf4faf1998ec3fc7d0a3093b795"
 
 BRANCH = "${OCL_GIT_BRANCH}"
 SRC_URI = "${OCL_GIT_URI};protocol=${OCL_GIT_PROTOCOL};branch=${BRANCH}"
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
index a47d9128..a9ec413a 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
@@ -3,7 +3,7 @@ SUMMARY = "OpenCL TIDL firmware for AM57xx"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=082a028431c455252c1e1d3d1021d382"
 
-PV = "01.01.17.01"
+PV = "01.01.18.00"
 PR = "r0"
 
 require recipes-ti/includes/arago-paths.inc
@@ -15,7 +15,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 GIT_URI      = "git://git.ti.com/opencl/opencl-firmware.git"
 GIT_PROTOCOL = "git"
 BRANCH       = "master"
-SRCREV       = "2f1715affab9ef4debf02769cf113dc1922cf75f"
+SRCREV       = "3b98f405d98416a66678dec01d8f7ef244f379b6"
 
 SRC_URI      = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
 
-- 
2.14.1


