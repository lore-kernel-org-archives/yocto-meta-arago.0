Return-Path: <j-stiffler@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id A66CF52A34
	for <meta-arago@arago-project.org>;
	Thu, 15 Jun 2017 16:01:58 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5FG1wbx015227
	for <meta-arago@arago-project.org>; Thu, 15 Jun 2017 11:01:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1497542518;
	bh=9Apm7eQAfuscD5OHAUF1LTPg9d1UjXCzsFXEf5Ja/Tc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=mBk8keapHR0zi9mD2JfEHpHlWAepsILx5GUFhZBvBWJmucKYlLRGaWIpn9RNeMKDe
	szVabVV174fUveTTQXnqQHA/zMU2FcRF7i2P+LrOaQeW5drWWAjHfSHlz13OvlMKjO
	izTethAgJycEoq8Y4kttJ9gHaw1yog5sBMMRqF34=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5FG1wsD018729
	for <meta-arago@arago-project.org>; Thu, 15 Jun 2017 11:01:58 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 15 Jun 2017 11:01:58 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v5FG1w6C020163;	Thu, 15 Jun 2017 11:01:58 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 15 Jun 2017 11:56:26 -0400
Message-ID: <1497542187-1311-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1497542187-1311-1-git-send-email-j-stiffler@ti.com>
References: <1497542187-1311-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] ocl: bump SRCREV to 1.1.13.0
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
X-List-Received-Date: Thu, 15 Jun 2017 16:01:59 -0000
Content-Type: text/plain

* New version pulls in the dependency on libjson-c

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-ti/ocl/ocl.inc       | 4 ++--
 meta-arago-extras/recipes-ti/ocl/opencl_git.bb | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extras/recipes-ti/ocl/ocl.inc
index 94e3dd8..8bd8f9e 100644
--- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
+++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
@@ -1,4 +1,4 @@
-PV = "1.1.12.0"
+PV = "1.1.13.0"
 INC_PR = "r0"
 
 LIC_FILES_CHKSUM = "file://../debian/copyright;md5=2e3965a73a8a49c23836467266120dff"
@@ -9,7 +9,7 @@ OCL_GIT_URI = "git://git.ti.com/opencl/ti-opencl.git"
 OCL_GIT_PROTOCOL = "git"
 OCL_GIT_BRANCH = "master"
 
-OCL_SRCREV = "8c0ec9c270cafaef0a56c376fc28c1b7714cb09c"
+OCL_SRCREV = "c2493c7190c7e5b4135f64d2aacc2de3ff57e0bb"
 
 BRANCH = "${OCL_GIT_BRANCH}"
 SRC_URI = "${OCL_GIT_URI};protocol=${OCL_GIT_PROTOCOL};branch=${BRANCH}"
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
index 906cad3..7203375 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
@@ -28,6 +28,7 @@ DEPENDS = " ocl-gl-headers \
             pkgconfig-native \
             libulm \
             elfutils \
+            json-c \
 "
 
 DEPENDS_append_dra7xx   = " ti-ipc virtual/kernel"
-- 
2.7.4


