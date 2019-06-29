Return-Path: <g-tammana@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id A3CE35297E
	for <meta-arago@arago-project.org>;
	Sat, 29 Jun 2019 04:39:03 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5T4cJRk111090
	for <meta-arago@arago-project.org>; Fri, 28 Jun 2019 23:38:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561783099;
	bh=uc7qn4sKjWUQENEWjceYqbmYNnLYA0U3FfgI7ehW/Cs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=U9xo2Q0zBVyQbgBzo9vYC+GiK1ezCESzx7BLiW8K8YDEY6x7uWrapt+TILr42Tvm+
	1jlTfur5qGqE0YHtBESBsWBc3JZlCBanridEXJ3gnRW1olHPTkm6ujUpGiz1i56ean
	7fDIY6Qerd0t4XAGpGbPB7cAotmuRzLQR6QdgRMs=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5T4cIGC060852
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 28 Jun 2019 23:38:19 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 28 Jun 2019 23:38:18 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 28 Jun 2019 23:38:18 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5T4cIaU100948;
	Fri, 28 Jun 2019 23:38:18 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.77.97])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x5T4cIm25528; Fri, 28 Jun 2019 23:38:18 -0500 (CDT)
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Denys Dmytriyenko <denys@ti.com>
Date: Fri, 28 Jun 2019 23:39:54 -0500
Message-ID: <20190629043954.7786-3-g-tammana@ti.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190629043954.7786-1-g-tammana@ti.com>
References: <20190629043954.7786-1-g-tammana@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud][PATCH 3/3] packagegroup-*-graphics: Change gbm to virtual provider
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
X-List-Received-Date: Sat, 29 Jun 2019 04:39:04 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 .../packagegroup-arago-tisdk-graphics-sdk-target.bb             | 2 +-
 .../packagegroups/packagegroup-arago-tisdk-graphics.bb          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
index bc6215e8..cea4c7a2 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
@@ -7,7 +7,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 inherit packagegroup
 
 GRAPHICS_RDEPENDS = "\
-    libgbm-dev \
+    ${PREFERRED_PROVIDER_virtual/libgbm}-dev \
     libdrm-dev \
     wayland-dev \
     weston-dev \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index 6a603754..a44d2fc5 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -22,7 +22,7 @@ GRAPHICS_WAYLAND_append_k3 = "\
 "
 
 GRAPHICS_RDEPENDS = "\
-    libgbm \
+    ${PREFERRED_PROVIDER_virtual/libgbm} \
     ${PREFERRED_PROVIDER_virtual/egl} \
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','${PREFERRED_PROVIDER_virtual/gpudriver}','',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','glmark2','',d)} \
-- 
2.22.0


