Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.6772.1645798347710414263
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 25 Feb 2022 06:12:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=w+tARe4m;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: a-m1@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21PECLrv092213;
	Fri, 25 Feb 2022 08:12:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1645798341;
	bh=DwxBMJesAfqlTGZ/R0gdMkkCld1av9Ab4sqMpRqm/hM=;
	h=From:To:CC:Subject:Date;
	b=w+tARe4mm/NxRXzfAfw8hXMemFNMLUry0G9AEFUN2rOfv/yZP7kZr5iXk6ZN5BIlr
	 57uYkzzXxiXBP2lmqJylgK187u03ID2Mk88KcdgDyCEUe2yW0X3zNX3Hr7C4mTPDeI
	 6M/3d6kXrwgj56TQ4vQTqdfFabl6Z+WsV6cWBJm4=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21PECLuf120088
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Feb 2022 08:12:21 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 25
 Feb 2022 08:12:21 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 25 Feb 2022 08:12:20 -0600
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21PECIYW100397;
	Fri, 25 Feb 2022 08:12:19 -0600
From: "Aparna M" <a-m1@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <denis@denix.org>,
        <reatmon@ti.com>
CC: <nikhil.nd@ti.com>, <devarsht@ti.com>
Subject: [meta-arago][dunfell][PATCH] ti-tisdk-setup: Update SRCREV to latest
Date: Fri, 25 Feb 2022 19:41:25 +0530
Message-ID: <20220225141125.15517-1-a-m1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Update SRCREV to include updates to create-sdcard.sh, uboot setup env
scripts and tftp support for HS EVMs.

Signed-off-by: Aparna M <a-m1@ti.com>
---
 .../recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
index 886a8b55..2e35f6e2 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://setup.sh;beginline=3;endline=31;md5=fc4b04a33df6d892c
 PR = "r46"
 
 BRANCH ?= "master"
-SRCREV = "42a8379fda829f34c374ddfca0242a479a84d454"
+SRCREV = "22f4e5af1894a60d9e7d04caf83f26a556c14eca"
 SRC_URI = "git://arago-project.org/git/projects/tisdk-setup-scripts.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git/"
-- 
2.17.1

