Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82D00C27C7B
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 01:14:58 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.1968.1718414097815524266
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 14 Jun 2024 18:14:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Kpa2rzRV;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45F1Eump115377;
	Fri, 14 Jun 2024 20:14:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718414096;
	bh=D1MNo6gUmeLkXHzWJ1x/0aM+Qc2QguMZQGBTqUkYSnw=;
	h=From:To:Subject:Date;
	b=Kpa2rzRV0Sdm8OxZvS/oNpCiMH0z4+kT+fbEjVoHnCVtxFm/8z+x27KV9aKYWJjJL
	 /u0rPSjYoTqvzC+ySTquMvIzUmpGcjq+AhIwtBfZG5rNbgzilb5Nx9qPTt/MfT1GkD
	 EUZnARSCG3HG+5uTZqAjg86INuWN2Ktwgbw5N//w=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45F1EuEs129586
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 14 Jun 2024 20:14:56 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 14
 Jun 2024 20:14:56 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 14 Jun 2024 20:14:56 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45F1EuKV097720;
	Fri, 14 Jun 2024 20:14:56 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sII0N-0000Iz-WE; Fri, 14 Jun 2024 20:14:56 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] packagegroup-arago-qte*: Remove final webkit entries
Date: Fri, 14 Jun 2024 20:14:55 -0500
Message-ID: <20240615011455.1133-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 15 Jun 2024 01:14:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15392

With the removal of the matrix-gui package the full dependency on
qtwebkit was removed, but there were remnant pieces of qtwebkit sub
packages that were still making it be built.  This patch removes the
final vestiges of qtwebkit from Arago.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-qte.bb | 3 ++-
 .../packagegroup-arago-qte-toolchain-target.bb           | 9 +++++----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
index 129838cc..7584de2d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
@@ -6,7 +6,8 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
-WEBKIT = "qtwebkit-qmlplugins"
+#WEBKIT = "qtwebkit-qmlplugins"
+WEBKIT = ""
 WEBKIT:armv5 = ""
 
 RDEPENDS:${PN} = "\
diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
index 0380f3a6..39b8ad5e 100644
--- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
@@ -7,10 +7,11 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
-WEBKIT = " \
-        qtwebkit-mkspecs \
-        qtwebkit-dev \
-"
+#WEBKIT = " \
+#        qtwebkit-mkspecs \
+#        qtwebkit-dev \
+#"
+WEBKIT = ""
 WEBKIT:armv5 = ""
 
 RDEPENDS:${PN} += " \
-- 
2.17.1


