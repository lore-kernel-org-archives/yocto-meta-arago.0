Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.7618.1646281897458812284
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 02 Mar 2022 20:31:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=j4sWQqUD;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2234VaIB037620;
	Wed, 2 Mar 2022 22:31:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1646281896;
	bh=RfmvuALFBzWS08WZscLFlLCAHhxwKSPq09yq3g/hXyk=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=j4sWQqUDYVKwr1Ju71VXbtnxDrfALttXbONqkvw4AUavBtTvRoXfDlRWAhz9GhF3r
	 O3TzWyEx0DZ5YhK1sKEPNhtDhpQPoEwXCYTTmIe8iiN/whkdo8p6vedQiGKsePTnWY
	 coRyUKZDPfEVpVEick7thUQAoCZZSqZxDRmu0JYA=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2234Vagx045863
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 2 Mar 2022 22:31:36 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 2
 Mar 2022 22:31:36 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 2 Mar 2022 22:31:36 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2234VaJP041551;
	Wed, 2 Mar 2022 22:31:36 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nPd7n-0006IC-5G; Wed, 02 Mar 2022 22:31:35 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][dunfell][PATCH 2/2] optee-test: update to 3.12.0
Date: Wed, 2 Mar 2022 22:31:32 -0600
Message-ID: <20220303043132.13539-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220303043132.13539-1-reatmon@ti.com>
References: <20220303043132.13539-1-reatmon@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-security/optee/optee-test_git.bbappend         | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 meta-arago-distro/recipes-security/optee/optee-test_git.bbappend

diff --git a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
new file mode 100644
index 00000000..4bfcc89f
--- /dev/null
+++ b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
@@ -0,0 +1,7 @@
+
+PR_append = ".arago0"
+
+PV = "3.12.0+git${SRCPV}"
+
+SRCREV = "7be42398e8848f09995abf8a9e9d8bb8840cc19a"
+
-- 
2.17.1

