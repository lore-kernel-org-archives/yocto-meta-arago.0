Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.9274.1644997413330409712
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 15 Feb 2022 23:43:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ll/8npsU;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: a-m1@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21G7hWXM012280
	for <meta-arago@lists.yoctoproject.org>; Wed, 16 Feb 2022 01:43:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1644997412;
	bh=xJXWSwIeVXbplNos8bxIIiIO5PbXPX7lyKcd407zc8I=;
	h=From:To:CC:Subject:Date;
	b=ll/8npsUaVfzOdCLXjoo6+oa/XhEEADCFI52lhQ21UR9PnJyhwmVS/ga/cOlpojLk
	 KglxHcd9uHEzSSqzbn/SabX3rwvDxZJa26rzOtiTG0BhjCxzQgHQpS8zc/gaa9N8uM
	 GD/TUljmpwW2poKLG4vsRPRRwQg8eMaBB1nmrX/E=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21G7hVu8024620
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 16 Feb 2022 01:43:31 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 16
 Feb 2022 01:43:31 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 16 Feb 2022 01:43:31 -0600
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21G7hTQc045588;
	Wed, 16 Feb 2022 01:43:29 -0600
From: "Aparna M" <a-m1@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>
CC: <nikhil.nd@ti.com>, <nsekhar@ti.com>, Aparna M <a-m1@ti.com>
Subject: [meta-arago][tisdk-setup-scripts][master][PATCH] setup-host-check: Support only Ubunut 18.04 as host OS
Date: Wed, 16 Feb 2022 13:13:26 +0530
Message-ID: <20220216074326.5320-1-a-m1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Modify script to support only Ubunut 18.04 as host OS

Signed-off-by: Aparna M <a-m1@ti.com>
---
 setup-host-check.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/setup-host-check.sh b/setup-host-check.sh
index 45b4c71..1ca7c0a 100644
--- a/setup-host-check.sh
+++ b/setup-host-check.sh
@@ -39,10 +39,10 @@ echo "Verifying Linux host distribution"
 
 get_host_type host
 
-if [ "$host" != "precise" -a "$host" != "trusty" -a "$host" != "xenial"  -a "$host" != "bionic" ]; then
-    echo "Unsupported host machine, only Ubuntu 12.04 LTS, Ubuntu 14.04 LTS, Ubuntu 16.04 LTS, and Ubuntu 18.04 LTS are supported"
+if [ "$host" != "bionic" ]; then
+    echo "Unsupported host Linux. Only Ubuntu 18.04 LTS is supported"
     exit 1
 fi
-echo "Ubuntu 12.04 LTS, Ubuntu 14.04, or Ubuntu 14.04 LTS is being used, continuing.."
+echo "Ubuntu 18.04 LTS is being used, continuing.."
 echo "--------------------------------------------------------------------------------"
 echo
-- 
2.17.1

