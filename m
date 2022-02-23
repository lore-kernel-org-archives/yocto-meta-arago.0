Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.4486.1645597479497849976
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 22 Feb 2022 22:24:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=gEw2MZsc;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: a-m1@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21N6OYDH073005;
	Wed, 23 Feb 2022 00:24:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1645597474;
	bh=kqC8uWz9h48dOxI+zArhxmljaz1SD2Lef0bgHNZ6BLc=;
	h=From:To:CC:Subject:Date;
	b=gEw2MZscpEtGu0Q6bRNCZxL3ssTBFno2i+Etki0xDhqecglMlTSUQhex/uLfwBFnq
	 kiwiKMmgma/tl4e/Q7O+zFUkIjpx9hZzxNLnSN8uC4E3hKb6KivVaUoJdjHgq3Ah+I
	 HsfC+fI4rOwZtC5r42SVEba8Te+WG7JUzOvLrr+c=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21N6OYGF038790
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Feb 2022 00:24:34 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 23
 Feb 2022 00:24:34 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 23 Feb 2022 00:24:34 -0600
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21N6OV7U092385;
	Wed, 23 Feb 2022 00:24:32 -0600
From: "Aparna M" <a-m1@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <denis@denix.org>,
        <reatmon@ti.com>
CC: <nikhil.nd@ti.com>, <nsekhar@ti.com>
Subject: [meta-arago][dunfell][PATCH v2] matrix-gui-apps-git: Update SRCREV to latest
Date: Wed, 23 Feb 2022 11:54:19 +0530
Message-ID: <20220223062419.13417-1-a-m1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Update SRCREV to pick up changes to the out-of-board LED blink demo for
am64xx-evm

Signed-off-by: Aparna M <a-m1@ti.com>
---
v1 -> v2: Update commit message

 meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index fac1fc8d..d61cf748 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -4,7 +4,7 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
 
 SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
-SRCREV = "976e775a1275198d3391018ce8115a66d00120a2"
+SRCREV = "cad105b0c2b75a90f4def523b4fdbd0b6aa2fe8e"
 BRANCH = "master"
 INC_PR = "r76"
 
-- 
2.17.1

