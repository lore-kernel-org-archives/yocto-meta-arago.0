Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E9CC27C6E
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 01:20:48 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.2184.1718414439066242450
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 14 Jun 2024 18:20:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=I0pGNdNZ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45F1Kc21033765;
	Fri, 14 Jun 2024 20:20:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718414438;
	bh=hZXyFEfHzgAzwwllbgJr/zw962CHYYsvX99CUkIQzUg=;
	h=From:To:Subject:Date;
	b=I0pGNdNZKB5q4SPd2JlhUiN9i6DReCg3lLw5otHHkRvQRBSbIkvFYVkQW+9LwjsJY
	 ateP6EwwLRd18dVLSyq8c53rze7hv04eaq0eyWyDkj14BMuDcs4VlU8KG3EGabnjmf
	 +oDWYWD2qtmJh6QL2+q7Txx9BKigTGWwTyo2Jot4=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45F1KcHD006300
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 14 Jun 2024 20:20:38 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 14
 Jun 2024 20:20:37 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 14 Jun 2024 20:20:37 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45F1Kblt105142;
	Fri, 14 Jun 2024 20:20:37 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sII5t-0000UY-If; Fri, 14 Jun 2024 20:20:37 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v2] packagegroup-arago-qte*: Remove final webkit entries
Date: Fri, 14 Jun 2024 20:20:37 -0500
Message-ID: <20240615012037.1848-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 15 Jun 2024 01:20:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15393

With the removal of the matrix-gui package the full dependency on
qtwebkit was removed, but there were remnant pieces of qtwebkit sub
packages that were still causing it to be built.  This patch removes
the final vestiges of qtwebkit from Arago.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Accidentally sent the first patch with the lines commented
    out instead of removed.

 .../recipes-core/packagegroups/packagegroup-arago-qte.bb   | 4 ----
 .../packagegroup-arago-qte-toolchain-target.bb             | 7 -------
 2 files changed, 11 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
index 129838cc..8ea830fd 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
@@ -6,9 +6,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
-WEBKIT = "qtwebkit-qmlplugins"
-WEBKIT:armv5 = ""
-
 RDEPENDS:${PN} = "\
     qtbase-plugins \
     qtdeclarative-qmlplugins \
@@ -23,7 +20,6 @@ RDEPENDS:${PN} = "\
     qtgraphicaleffects-qmlplugins \
     qtvirtualkeyboard-plugins \
     qtvirtualkeyboard-qmlplugins \
-    ${WEBKIT} \
     liberation-fonts \
     qtconnectivity \
     qtconnectivity-qmlplugins \
diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
index 0380f3a6..793fcd8f 100644
--- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
@@ -7,12 +7,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
-WEBKIT = " \
-        qtwebkit-mkspecs \
-        qtwebkit-dev \
-"
-WEBKIT:armv5 = ""
-
 RDEPENDS:${PN} += " \
         packagegroup-arago-standalone-sdk-target \
         libsqlite3-dev \
@@ -33,7 +27,6 @@ RDEPENDS:${PN} += " \
         qtsensors-dev \
         qtsvg-dev \
         qtxmlpatterns-dev \
-        ${WEBKIT} \
         ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "qtwebengine-mkspecs qtwebengine-dev", "", d)} \
         qtserialport-mkspecs \
         qtserialport-dev  \
-- 
2.17.1


