Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 64A0852A2E
	for <meta-arago@arago-project.org>;
	Tue, 16 Apr 2019 17:30:01 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3GHTda3021169
	for <meta-arago@arago-project.org>; Tue, 16 Apr 2019 12:29:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1555435779;
	bh=y3YGH4/z0ymcu1E4GlVr2qvGsoWRpBp2t/6EuGaleL8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=PyCkOftYu1KDIB2Rkc0BbDSY+MOXtffhv9jjaTeN5YGQrTKpfrWr3h+khxO+34pGx
	6ofEzpuAcXjaXOwxFqZ0UT8zgTjPn0QcjgdHquOBnRm37//hMAAz+7s+aBEkN/EOCJ
	JLW426mzRQJbWBLDB8nnwx7ZtMWFxGTgVIJik6B8=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3GHTdKL049645
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 16 Apr 2019 12:29:39 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 16 Apr 2019 12:29:39 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 16 Apr 2019 12:29:39 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3GHTb62116306;
	Tue, 16 Apr 2019 12:29:39 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 16 Apr 2019 13:17:27 -0400
Message-ID: <1555435047-9643-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1555435047-9643-1-git-send-email-j-stiffler@ti.com>
References: <1555435047-9643-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com
Subject: [meta-processor-sdk][PATCH 2/2] tisdk-rootfs-image: temporarily disable ros-world
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
X-List-Received-Date: Tue, 16 Apr 2019 17:30:01 -0000
Content-Type: text/plain

* Some recipes are broken, so disable until a solution is found.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-core/images/tisdk-rootfs-image.bbappend | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/recipes-core/images/tisdk-rootfs-image.bbappend b/recipes-core/images/tisdk-rootfs-image.bbappend
index 703e453..6f6c3bc 100644
--- a/recipes-core/images/tisdk-rootfs-image.bbappend
+++ b/recipes-core/images/tisdk-rootfs-image.bbappend
@@ -1,21 +1,22 @@
-PR_append = ".tisdk5"
+PR_append = ".tisdk6"
 
+# Disable ros-world until it can be fixed
+#	packagegroup-ros-world
 IMAGE_INSTALL_append_ti43x = " \
 	packagegroup-arago-tisdk-graphics \
 	packagegroup-arago-tisdk-hmi \
-	packagegroup-ros-world \
 	packagegroup-ros-ti \
 "
+
+#	packagegroup-ros-world
 IMAGE_INSTALL_append_ti33x = " \
 	packagegroup-arago-tisdk-graphics \
 	packagegroup-arago-tisdk-hmi \
-	packagegroup-ros-world \
 	packagegroup-ros-ti \
 "
 
-
+#	packagegroup-ros-world
 IMAGE_INSTALL_append_omap-a15 = " \
 	packagegroup-arago-tisdk-hmi \
-	packagegroup-ros-world \
 	packagegroup-ros-ti \
 "
-- 
2.7.4


