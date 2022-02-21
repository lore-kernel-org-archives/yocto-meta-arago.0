Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.7007.1645416211294215992
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 20 Feb 2022 20:03:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=sA4jUe3R;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: a-m1@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21L43T6j119486
	for <meta-arago@lists.yoctoproject.org>; Sun, 20 Feb 2022 22:03:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1645416209;
	bh=kkcuHa/bLmkbAzXbZTWgsIQKzW+BHU3EXWC3OB9++K4=;
	h=From:To:CC:Subject:Date;
	b=sA4jUe3RE6WQjzM3vKJVEDGlVAmiOYRb7gmPjnVpH3oeWnvQrO3TtjaB8olirBH0C
	 xgoWR4t2UIKv2Gkoiyv5bymF/nBoL0129g327hfqFqyU+7G7ANeaJT0bDzCSZ74Ywu
	 2cbVY7YtAL19QQ9NP4vLYMbMgrtqeC3rlWoPLR9A=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21L43TLE016447
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Sun, 20 Feb 2022 22:03:29 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Sun, 20
 Feb 2022 22:03:29 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Sun, 20 Feb 2022 22:03:29 -0600
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21L43ROv047524;
	Sun, 20 Feb 2022 22:03:27 -0600
From: "Aparna M" <a-m1@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>
CC: <nikhil.nd@ti.com>, <nsekhar@ti.com>, Aparna M <a-m1@ti.com>
Subject: [meta-arago][PATCH] matrix-gui-apps-git: Update SRCREV to latest
Date: Mon, 21 Feb 2022 09:33:24 +0530
Message-ID: <20220221040324.31841-1-a-m1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Update SRCREV to latest

Signed-off-by: Aparna M <a-m1@ti.com>
---
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

