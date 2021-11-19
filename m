Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.2756.1637287191055722792
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 18 Nov 2021 17:59:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=jCPFA91E;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AJ1xnch029191;
	Thu, 18 Nov 2021 19:59:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1637287189;
	bh=489iG/SI1ZVuRfI0vNf/u7PiY30vJu6caenbdvWzow4=;
	h=From:To:Subject:Date;
	b=jCPFA91EhCTz3uVd9XoqEcQ9mxigtdc37cT49Efe07Up48MyJezWEukrSpR2Q7fLP
	 +Tf260n1Jxym/dHbW1wPwmZikYcBmAhugVvxapMFgGIAz4R6TGpJf6AH1ROryE2zDL
	 AmjBmH8ohFl+rL0nVLwF9Jo/hRascvrMMkqFQ/dI=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AJ1xncq047307
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 18 Nov 2021 19:59:49 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 18
 Nov 2021 19:59:49 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 18 Nov 2021 19:59:49 -0600
Received: from chasm (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AJ1xnX3069365;
	Thu, 18 Nov 2021 19:59:49 -0600
Received: from reatmon by chasm with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1mntBs-0004Qy-Kb; Thu, 18 Nov 2021 19:59:48 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/dunfell][PATCH] ltp-ddt: Bump ltp-ddt version for 08.01.00.005
Date: Thu, 18 Nov 2021 19:59:48 -0600
Message-ID: <20211119015948.17005-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Bump ltp-ddt to 08.01.00.005 release

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
index 434624ad..1b52f327 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
@@ -14,7 +14,7 @@ PE = "1"
 PR = "r4"
 PV_append = "+git${SRCPV}"
 
-SRCREV = "4548c131f8fcbe240746c6114aa0a12b61e6166b"
+SRCREV = "7e4a343637c217f20b39e9862af6d5c4f696bae2"
 BRANCH ?= "master"
 
 SRC_URI_remove = "git://github.com/linux-test-project/ltp.git;protocol=https;branch=master"
-- 
2.17.1

