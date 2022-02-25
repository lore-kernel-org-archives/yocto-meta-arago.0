Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.202.1645826344229032253
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 25 Feb 2022 13:59:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=iDIIlQYM;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: yogeshs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21PLwxun092417;
	Fri, 25 Feb 2022 15:58:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1645826339;
	bh=AUt4k/10BZnGkhyeKd/XALn94XDfjtc+wu3Pe/BXC10=;
	h=From:To:Subject:Date;
	b=iDIIlQYMzUegR0CmQQR1hEYhyBG+GhY2/eg5k4qTPbsP2YNkSA0oKe0JGVUn30vY7
	 3uHeVitV/ZGU7Pe/Pz1YX4cZdq4MUyWOMLe8la1RAYsscjzs0wfB+ZwXlaHKCUSkKd
	 uKT6m48E/nQNgLWcMvsoemacCfxkeWssMlKRPCpI=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21PLwxAR063049
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Feb 2022 15:58:59 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 25
 Feb 2022 15:58:59 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 25 Feb 2022 15:58:59 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21PLwxKS045919;
	Fri, 25 Feb 2022 15:58:59 -0600
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/dunfell][PATCH] packagegroup-arago-base-tisdk: Fix issue with optee pkgs not being included
Date: Fri, 25 Feb 2022 21:58:59 +0000
Message-ID: <20220225215859.23939-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

In core-sdk 7.1 meta-ti OPTEEMACHINE description was updated to use combined
OPTEE_MACHINE and OPTEE_FLAVOR.

8ac0c757 conf/machine: pass OPTEEFLAVOR via OPTEEMACHINE as
<mach>-<flavor>

This caused the OPTEEMACHINE check to fail that was used to add
optee-client and optee-test. Fixing the issue by using
OPTEEOUTPUTMACHINE since it still uses ti/k3 as parameter.

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 .../packagegroups/packagegroup-arago-base-tisdk.bb            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
index e0d33bbb..551e0230 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Additional packages beyond console packages shared by TI SDKs"
 LICENSE = "MIT"
-PR = "r22"
+PR = "r23"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -26,5 +26,5 @@ RDEPENDS_${PN} = "\
     nfs-utils-client \
     cifs-utils \
     phytool \
-    ${@bb.utils.contains_any('OPTEEMACHINE', 'ti k3', "${OPTEE_PKGS}", "", d)} \
+    ${@bb.utils.contains_any('OPTEEOUTPUTMACHINE', 'ti k3', "${OPTEE_PKGS}", "", d)} \
 "
-- 
2.17.1

