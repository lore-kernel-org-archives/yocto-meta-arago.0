Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.712.1645744161385653997
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 24 Feb 2022 15:09:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=DS480qXw;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21ON9JaP017044;
	Thu, 24 Feb 2022 17:09:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1645744159;
	bh=Ic7EBzp6hcA7i0g2dPgyKSRne/p1RXJBq/wxttdny/o=;
	h=From:To:Subject:Date;
	b=DS480qXwnoygZ2Y15gzgGBU5krJ00Vvb6omM+FHvpRKKQliZxlPDj3Ub4BQvnar18
	 YoA24TXNYaJ7BqV0hVRPibF4MiHBxDa+mcUVK5Gixfx0vfeXnOxU6o7OxuqOTYi9dt
	 Vs0cuz4RgF+vCXLcooFpGfgQKUr+eJFiNB94lj1c=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21ON9JsI105964
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Feb 2022 17:09:19 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 24
 Feb 2022 17:09:19 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 24 Feb 2022 17:09:19 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21ON9JCj083413;
	Thu, 24 Feb 2022 17:09:19 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nNNEd-0004jU-6Q; Thu, 24 Feb 2022 17:09:19 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/dunfell][PATCH] ltp-ddt: Bump to 08.02.00.004 release
Date: Thu, 24 Feb 2022 17:09:19 -0600
Message-ID: <20220224230919.18153-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Updated the ltp-ddt version for 08.02.00.004

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
index 34f4533b..a0d4abbf 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
@@ -11,10 +11,10 @@ PROVIDES += "ltp"
 DEPENDS += "alsa-lib"
 
 PE = "1"
-PR = "r5"
+PR = "r6"
 PV_append = "+git${SRCPV}"
 
-SRCREV = "f0cfba630340c4efa114285ea7a6d896861dd9c7"
+SRCREV = "cffe09d8c521f91a73ba0f09dbbb680c27dfbfa4"
 BRANCH ?= "master"
 
 SRC_URI_remove = "git://github.com/linux-test-project/ltp.git;protocol=https;branch=master"
-- 
2.17.1

