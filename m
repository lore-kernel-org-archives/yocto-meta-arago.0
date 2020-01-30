Return-Path: <>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 6B37552975
	for <meta-arago@arago-project.org>;
	Thu, 30 Jan 2020 21:39:38 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00ULbkoD009533
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2020 15:37:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580420266;
	bh=gBnqisp3F4jGY5HoCcv7aVH+zniEnOv6u7HdGw9kohI=;
	h=From:To:CC:Subject:Date;
	b=ClqRn/KEN0lZnwsIY4Fm4Yc/Gub4WWUIM0kJY9zsQZO6/YFpuDQl4kMFiyvWEI35S
	TNqROcWdx40YILDF8xKD+Z0oYl4NxwFGYodKyik2VxIxICYIkLH+iAu3jC25q/xQ//
	OLbW4VuLxf1dT4HpFFbtM/ggifO5pJiyGjEK6+O4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00ULbkFs020629
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2020 15:37:46 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 30 Jan 2020 15:37:46 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 30 Jan 2020 15:37:46 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00ULbkHd013355;
	Thu, 30 Jan 2020 15:37:46 -0600
Received: from localhost ([10.250.70.160])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	00ULbh318929; Thu, 30 Jan 2020 15:37:44 -0600 (CST)
From: "Andrew F. Davis" <afd@ti.com>
To: Denys Dmytriyenko <denys@ti.com>
Date: Thu, 30 Jan 2020 16:37:43 -0500
Message-ID: <20200130213743.18487-1-afd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [master][PATCH] Revert "HACK: packagegroup-*-console: disable ltrace for now, breaks with latest toolchain"
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
X-List-Received-Date: Thu, 30 Jan 2020 21:39:38 -0000
Content-Type: text/plain

This reverts commit c193654a0cd6d07c8855afb784cba9387b97a523.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-console.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
index faff560a..4d0bbdde 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
@@ -52,14 +52,11 @@ ARAGO_UTILS = "\
     usbutils \
     i2c-tools \
     strace \
+    ltrace \
     ${@bb.utils.contains('MACHINE_FEATURES', 'pci', 'pciutils', '',d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi-utils', '',d)} \
     "
 
-# ARAGO_UTILS - ltrace fails with __cxa_demangle for now
-#    ltrace 
-
-
 ARAGO_SDK_PREREQ = "\
     zlib \
     libpng \
-- 
2.17.1


