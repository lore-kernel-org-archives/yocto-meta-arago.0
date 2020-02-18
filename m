Return-Path: <afd@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 7245052994
	for <meta-arago@arago-project.org>;
	Tue, 18 Feb 2020 16:39:56 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01IGbweI129974
	for <meta-arago@arago-project.org>; Tue, 18 Feb 2020 10:37:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582043878;
	bh=gtW0TWGY8cQDh6Z2fflSAxcDr6jMQIbF6PHQRzpNlDE=;
	h=From:To:CC:Subject:Date;
	b=MPhkcm5jxCgqlIKLW1P5BLfxLrz+nBNyYwzeBFiE4RLaKwP4YzpYRyh50t++Gneon
	qcsyRczHopbvGL2V8wIcpvJ5NHKD9bOdyy11a7MuYbjDJGRjosGwMmaDHMIquPe+jL
	oIg6xGgI2Ahfq0uqz5nn9BVlk/8qDkJ4VhZSSbKA=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01IGbv5N050143
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 18 Feb 2020 10:37:58 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 18 Feb 2020 10:37:57 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Tue, 18 Feb 2020 10:37:57 -0600
Received: from ula0226330.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01IGbvID112479;
	Tue, 18 Feb 2020 10:37:57 -0600
From: "Andrew F. Davis" <afd@ti.com>
To: Denys Dmytriyenko <denys@ti.com>
Date: Tue, 18 Feb 2020 11:37:57 -0500
Message-ID: <20200218163757.17157-1-afd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [zeus/master][PATCH] kmscube: Drop local kmscube and use latest upstream
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
X-List-Received-Date: Tue, 18 Feb 2020 16:39:56 -0000
Content-Type: text/plain

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 .../recipes-graphics/kmscube/kmscube_1.0.0.bb | 23 -------------------
 1 file changed, 23 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb

diff --git a/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
deleted file mode 100644
index 782d21a9..00000000
--- a/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "Demo application to showcase 3D graphics on SGX using kms and gbm"
-HOMEPAGE = "http://git.ti.com"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=e760965096e52da8f3969dd53b6bf158"
-
-DEPENDS = "libdrm virtual/libgbm virtual/egl virtual/libgles2"
-
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k3"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-inherit autotools pkgconfig
-
-PR = "r14"
-SRCREV = "7bc7ff6c4ead19761003ed4a08d00ce64effe38b"
-
-SRC_URI = "git://git.ti.com/glsdk/kmscube.git;protocol=git"
-
-SRC_URI_append = " \
-"
-
-S = "${WORKDIR}/git"
-
-INSANE_SKIP_kmscube += "dev-deps"
-- 
2.17.1


