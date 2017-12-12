Return-Path: <gaurav@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id CE86252093
	for <meta-arago@arago-project.org>;
	Tue, 12 Dec 2017 17:09:57 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBCH9l1P002337
	for <meta-arago@arago-project.org>; Tue, 12 Dec 2017 11:09:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513098587;
	bh=3Nu5psRwJo09nSdlKrdcrgVmKaeIb6zDjqyTXS1kuPs=;
	h=From:To:CC:Subject:Date;
	b=uIWaNELL19/lwu03kPTk70WgIUkvPdDeJYjW+fI82AfWZ0IxwtxcmlJd1WXNQ1NaY
	y0MB5SjRtSdWMTGehhbM2mQZsGBLHJtmWrdUJRdoxG1nzOZKyzyB0YLLd+DJzmcjTH
	uOyIzJQBmzEYTVBhVsOhI81ZcsAzrsc/fP2YLpSw=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBCH9gI6018852
	for <meta-arago@arago-project.org>; Tue, 12 Dec 2017 11:09:42 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 12 Dec 2017 11:09:41 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 12 Dec 2017 11:09:41 -0600
Received: from sdomc-build0.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBCH9f9X028683;
	Tue, 12 Dec 2017 11:09:41 -0600
From: Gaurav Mitra <gaurav@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 12 Dec 2017 11:09:40 -0600
Message-ID: <20171212170940.5147-1-gaurav@ti.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] Patch to integrate OCL v01.01.14.08 with fix for ICD conformance with gcc7.2
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
X-List-Received-Date: Tue, 12 Dec 2017 17:09:58 -0000
Content-Type: text/plain

Signed-off-by: Gaurav Mitra <gaurav@ti.com>
---
 meta-arago-extras/recipes-ti/ocl/ocl.inc       | 4 ++--
 meta-arago-extras/recipes-ti/ocl/opencl_git.bb | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extras/recipes-ti/ocl/ocl.inc
index 9a3fb70d..ffa3cbee 100644
--- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
+++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
@@ -1,4 +1,4 @@
-PV = "1.1.14.7"
+PV = "1.1.14.8"
 INC_PR = "r0"
 
 LIC_FILES_CHKSUM = "file://../debian/copyright;md5=2e3965a73a8a49c23836467266120dff"
@@ -9,7 +9,7 @@ OCL_GIT_URI = "git://git.ti.com/opencl/ti-opencl.git"
 OCL_GIT_PROTOCOL = "git"
 OCL_GIT_BRANCH = "master"
 
-OCL_SRCREV = "2be51882b5c1f0f8a97fddcc7e8db2b09db41dfe"
+OCL_SRCREV = "caf4a0e55831ea34e3659e81877aaffde29ccfd1"
 
 BRANCH = "${OCL_GIT_BRANCH}"
 SRC_URI = "${OCL_GIT_URI};protocol=${OCL_GIT_PROTOCOL};branch=${BRANCH}"
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
index 4daef6b1..fdc822d0 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
@@ -35,6 +35,7 @@ DEPENDS_append_dra7xx   = " ti-ipc virtual/kernel"
 DEPENDS_append_keystone = " mpm-transport multiprocmgr"
 DEPENDS_remove_k2g = " libulm"
 
+RDEPENDS_${PN} += " bash"
 RDEPENDS_${PN}-dev += " ocl-gl-headers-dev opencl-monitor"
 RDEPENDS_${PN}-runtime += " ${PN} opencl-monitor clocl ti-cgt6x"
 
-- 
2.14.1


