Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 5FD83529C0
	for <meta-arago@arago-project.org>;
	Wed, 18 Dec 2019 20:34:11 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBIKWYiN041672
	for <meta-arago@arago-project.org>; Wed, 18 Dec 2019 14:32:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576701154;
	bh=HdrOYK7Bc4dUdnYEMmUNzQe8PzTnP8pEpb+l6MjCqrQ=;
	h=From:To:CC:Subject:Date;
	b=VREziTWCbs6Y4TgIpIWwiBQznUHaWjkSmeoWfU86ZXfti3c7FzsC/Bd1WRbfeDkYb
	SPIT1E6mZ+8dnCXpyx8E/E6lhrEGm4lSzpkf/uGYgAKRHbVDV8t0xZqtqOcgfI8TmP
	6oIkk4m9sETGq59+GWo9RxKSP9NRifbZsmzLQugw=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBIKWYrY014875
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 18 Dec 2019 14:32:34 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 18 Dec 2019 14:32:32 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Wed, 18 Dec 2019 14:32:32 -0600
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBIKWWtT007037;
	Wed, 18 Dec 2019 14:32:32 -0600
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 18 Dec 2019 20:13:50 +0000
Message-ID: <20191218201351.15055-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [RFC][PATCH 1/2] packagegroup: move qt-opencv-opencl-opengl-multithreaded-dev
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
X-List-Received-Date: Wed, 18 Dec 2019 20:34:11 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-multimedia.bb         | 1 -
 .../recipes-core/packagegroups/packagegroup-ti-world.bb          | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index 056b2c8d..4d6d14dc 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -29,7 +29,6 @@ MULTIMEDIA_append_omap-a15 = " \
 MULTIMEDIA_append_dra7xx = " \
     vis \
     hevc-arm-decoder \
-    ${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'qt-opencv-opencl-opengl-multithreaded-dev', '', d)} \
 "
 
 MULTIMEDIA_append_omap5-evm = " \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ti-world.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-ti-world.bb
index 6403bf70..36b3f66b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ti-world.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-ti-world.bb
@@ -35,4 +35,5 @@ RDEPENDS_${PN} = "\
     packagegroup-arago-tisdk-addons-extra \
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-hmi','packagegroup-arago-base-tisdk-server-extra',d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', "${CHROMIUM}", '', d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'qt-opencv-opencl-opengl-multithreaded-dev', '', d)} \
 "
-- 
2.17.1


