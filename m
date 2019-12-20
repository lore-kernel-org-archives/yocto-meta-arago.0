Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id D06A4529DC
	for <meta-arago@arago-project.org>;
	Fri, 20 Dec 2019 16:11:36 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBKG9wuW092193
	for <meta-arago@arago-project.org>; Fri, 20 Dec 2019 10:09:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576858198;
	bh=EhkqWrsoHymm+j5CZ7mEJmYPhEHGj1aMO7gtsomPU5g=;
	h=From:To:CC:Subject:Date;
	b=FzaJ2UEvNxcnoiuUYpC+M/gcDWiX2k8E6icFPWW7rhZ3/MCQ6qRddaXPSRVXtbqVX
	3iK49Bx09r782YZ4+Y64VhywdAILdaW9leHQ8kFSKl4o8CuoBgU/YtByQAKi1+G7O/
	0s9G93fnkp5SMmEj8WK/3dW8sBYl5qNpk0Z3VIgw=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBKG9wDo093478
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 20 Dec 2019 10:09:58 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 20 Dec 2019 10:09:58 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 20 Dec 2019 10:09:58 -0600
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBKG9wvV114649;
	Fri, 20 Dec 2019 10:09:58 -0600
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 20 Dec 2019 15:51:10 +0000
Message-ID: <20191220155111.12841-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [RFC][PATCH 1/2] packagegroup-*-addons: don't install valgrind in rootfs by default
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
X-List-Received-Date: Fri, 20 Dec 2019 16:11:37 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons.bb             | 1 -
 .../recipes-core/packagegroups/packagegroup-ti-world.bb          | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 86913bd5..967fc5db 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -23,7 +23,6 @@ UTILS = " \
     libdrm-kms \
     kms++ \
     kms++-python \
-    ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} \
     stream \
     strongswan \
     kexec \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ti-world.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-ti-world.bb
index 00a97470..efc2b553 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ti-world.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-ti-world.bb
@@ -44,4 +44,5 @@ RDEPENDS_${PN} = "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', "${CHROMIUM}", '', d)} \
     ${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'qt-opencv-opencl-opengl-multithreaded-dev', '', d)} \
     ${DEVTOOLS} \
+    ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} \
 "
-- 
2.17.1


