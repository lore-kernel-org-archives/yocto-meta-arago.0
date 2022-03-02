Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.1635.1646247661809347344
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 02 Mar 2022 11:01:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=lggFPp1p;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: a-m1@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 222J0vSX018062;
	Wed, 2 Mar 2022 13:00:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1646247657;
	bh=K0yDxJm7HGgzcMyxqh0B9NHnfHN51bMTAi1kaNGf8zg=;
	h=From:To:CC:Subject:Date;
	b=lggFPp1psxPAe1FJtgVUt7d75rvxcX/CSgUvFhimUM7pVIReyVG27dVQksKXQ1X3M
	 o68X8wkF30j4PNTSSSBG/M8bRCLj6H826l5VLoXMugGtWwl8UZ5lrgXqpOfm1ztKHq
	 ahujk2QJ/cftmk7Ufme4tlEkqfjmDNMrAYzpUl+0=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 222J0vWq041587
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 2 Mar 2022 13:00:57 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 2
 Mar 2022 13:00:57 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 2 Mar 2022 13:00:57 -0600
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 222J0sS2009797;
	Wed, 2 Mar 2022 13:00:55 -0600
From: "Aparna M" <a-m1@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <denis@denix.org>,
        <reatmon@ti.com>
CC: <nikhil.nd@ti.com>, <devarsht@ti.com>
Subject: [meta-arago][dunfell][PATCH] ti-tisdk-setup: Fixup to bump up PR
Date: Thu, 3 Mar 2022 00:30:38 +0530
Message-ID: <20220302190038.4028-1-a-m1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Bump up PR corresponding to latest SRCREV update

Signed-off-by: Aparna M <a-m1@ti.com>
---
 .../recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
index 2e35f6e2..14fd3fc1 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Package containing scripts to setup the development host and targ
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://setup.sh;beginline=3;endline=31;md5=fc4b04a33df6d892c9f4d4a9d92b945e"
 
-PR = "r46"
+PR = "r47"
 
 BRANCH ?= "master"
 SRCREV = "22f4e5af1894a60d9e7d04caf83f26a556c14eca"
-- 
2.17.1

