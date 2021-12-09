Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.15055.1639072533889654793
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 09:55:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=spvzi/bo;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: yogeshs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1B9HtWPb040768;
	Thu, 9 Dec 2021 11:55:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1639072532;
	bh=D6xRld85q8+gwdyh9hA0iP0JD5Jfn+zLMG/FDypkiNw=;
	h=From:To:Subject:Date;
	b=spvzi/bok2F+v+N5R49Tufrr3XGK063TnGTPIzHb+yj/jBxpHx/YCAxuSprjQa3gA
	 0gqfCdPUEp4F96zTRl3rAiYV4ByHVG51O8CA5KTcJ66XJtjksqTWSU65lXzHG6yJg9
	 aP8BAbb5eYD3KA+70xxh6L/QxzK9Vd+hpcAb2rfY=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1B9HtW79021958
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Dec 2021 11:55:32 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 9
 Dec 2021 11:55:32 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 9 Dec 2021 11:55:32 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1B9HtVun066589;
	Thu, 9 Dec 2021 11:55:31 -0600
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [tisdk-build-scripts][PATCH] config-build-env: Change oe-layersetup clone path from http to git.
Date: Thu, 9 Dec 2021 17:55:31 +0000
Message-ID: <20211209175531.26728-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

We are observing lot of failure using http withing firewall:

fatal: unable to access
'http://git.ti.com/git/arago-project/oe-layersetup.git/': The requested
URL returned error: 502

Moving to git path that is used in yocto recipes

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 lib/oesdk/config-build-env | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/oesdk/config-build-env b/lib/oesdk/config-build-env
index 7f914ba..6fe3a8a 100644
--- a/lib/oesdk/config-build-env
+++ b/lib/oesdk/config-build-env
@@ -1,6 +1,6 @@
 #!/bin/bash
 
-TI_SDK_OELAYER_SETUP="http://git.ti.com/git/arago-project/oe-layersetup.git"
+TI_SDK_OELAYER_SETUP="git://git.ti.com/arago-project/oe-layersetup.git"
 
 # This script is intended to be called only from the top-level build-oesdk.sh
 # script which parses the configuration file and sets necessary variables.
-- 
2.17.1

