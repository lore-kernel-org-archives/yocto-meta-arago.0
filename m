Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.23642.1636989570165536184
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 15 Nov 2021 07:19:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=TtoJVBnR;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AFFJR97108363;
	Mon, 15 Nov 2021 09:19:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1636989567;
	bh=k1pl5rcgCs+mxZzBeGlNjhMSvVqqIYr8bVVVzithmPg=;
	h=From:To:Subject:Date;
	b=TtoJVBnRsGrahKaCUPK/uccQ0fbl3xNYcYg+VLMLCxnXtd8qtgEDpI5WEuTG1YqXZ
	 CZiqpfgtMP62NH/vDHdNuHRz/aYQOCY03afu4vtEwc1ySieBSn4tRbNz6660jFvEJf
	 bRXDyK5wsYMr2DxFj9VxorG8amDdcfszbMPre63M=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AFFJRZT037333
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 15 Nov 2021 09:19:27 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 15
 Nov 2021 09:19:27 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 15 Nov 2021 09:19:27 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AFFJRRd057777;
	Mon, 15 Nov 2021 09:19:27 -0600
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [tisdk-build-scripts][PATCH] machine-specific-functions: Add am64x hs platform
Date: Mon, 15 Nov 2021 15:19:27 +0000
Message-ID: <20211115151927.34299-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Add am64x hs platform for Jenkin build

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 lib/oesdk/machine-specific-functions | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/oesdk/machine-specific-functions b/lib/oesdk/machine-specific-functions
index e4349e7..51cc0a3 100644
--- a/lib/oesdk/machine-specific-functions
+++ b/lib/oesdk/machine-specific-functions
@@ -25,7 +25,7 @@ parse_machines() {
                 CORTEX_MACHINES="$CORTEX_MACHINES"" $m"
                 ARCHS="$ARCHS""\n""CORTEX"
                 ;;
-            am64xx-evm | am64xx-sk | am65xx-evm | am65xx-hs-evm | j7-evm | j7-hs-evm | j7200-evm )
+            am64xx-evm | am64xx-hs-evm | am65xx-evm | am65xx-hs-evm | j7-evm | j7-hs-evm | j7200-evm )
                 AARCH64_MACHINES="$AARCH64_MACHINES"" $m"
                 ARCHS="$ARCHS""\n""AARCH64"
                 ;;
-- 
2.17.1

