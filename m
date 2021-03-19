Return-Path: <praneeth@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id E147A529EC
	for <meta-arago@arago-project.org>;
	Fri, 19 Mar 2021 18:12:40 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12JICvgV108493;
	Fri, 19 Mar 2021 13:12:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1616177577;
	bh=3X+OCgVrEkgtXQIlgGQIngSJhcnzC9rKgWBaJsyGegw=;
	h=From:To:CC:Subject:Date;
	b=Hnu5b6l0h9+NVH5Yk03gN1r6TsaH0w+HJbGy9iwfRGh6MB2GiyADAZhA45M43kDAC
	PTahi7u0CNWIad5qN1uvr7f/tH4A091btS1NmkzAXVd0hKbQ7dUrqqKn4eNUKoaBGH
	EoVShLu7QIgLFp5i30cTPu9QFbTO38z8qeQYD7ik=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12JICvaH118562
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 19 Mar 2021 13:12:57 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Fri, 19 Mar 2021 13:12:57 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Fri, 19 Mar 2021 13:12:57 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12JICvcp057735;
	Fri, 19 Mar 2021 13:12:57 -0500
From: <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Hari Nagalla <hnagalla@ti.com>
Date: Fri, 19 Mar 2021 13:12:57 -0500
Message-ID: <20210319181257.10173-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, denys@konsulko.com
Subject: [dunfell/master PATCH] packagegroups: tisdk-connectivity: Include BT_TI package for all platforms
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
X-List-Received-Date: Fri, 19 Mar 2021 18:12:41 -0000
Content-Type: text/plain

From: Hari Nagalla <hnagalla@ti.com>

Move BT_TI package (That consists bt_enable,bt_fw) to CONNECTIVITY_RDEPENDS.
This enables the package across all TI platforms.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
[praneeth@ti.com: addressed review comments from v1]
Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-connectivity.bb | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index 8a8189fe..1eb0e072 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -64,22 +64,17 @@ CONNECTIVITY_RDEPENDS = " \
     ${WLAN_COMMON} \
     ${WLAN_TI} \
     ${BT_COMMON} \
+    ${BT_TI} \
 "
 
 CONNECTIVITY_RDEPENDS_append_ti33x = "\
-    ${BT_TI} \
     ${DEMO_APPS} \
 "
 
 CONNECTIVITY_RDEPENDS_append_ti43x = "\
-    ${BT_TI} \
     ${DEMO_APPS} \
 "
 
-CONNECTIVITY_RDEPENDS_append_dra7xx = "\
-    ${BT_TI} \
-"
-
 RDEPENDS_${PN} = "\
     ${CONNECTIVITY_RDEPENDS} \
 "
-- 
2.17.1


