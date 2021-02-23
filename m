Return-Path: <nikhil.nd@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 605C4529D6
	for <meta-arago@arago-project.org>;
	Tue, 23 Feb 2021 15:04:25 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 11NF4a7Z107204
	for <meta-arago@arago-project.org>; Tue, 23 Feb 2021 09:04:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1614092676;
	bh=xMnnBQu2ffgVC/grUKENxdrS4/TwCKR4YrFXE5Y2KwA=;
	h=From:To:CC:Subject:Date;
	b=sOm0JAVHbNuSNc2wb3lExcaE11VQ4cvws9pmli8OrWcwvHNZxQCQA29nNz5Icq86O
	re6ownAzd/quLJ7VMlNacvUKoz/nXJVjf3A1Aaw4R5pr1YQAeHGKJDLQb5eE/YR8D8
	o2SUpJtnqubLjpPwCY8l+S0YleNYbO+GXMg0CN+s=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 11NF4aB8043949
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 23 Feb 2021 09:04:36 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Tue, 23 Feb 2021 09:04:36 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Tue, 23 Feb 2021 09:04:36 -0600
Received: from swubn03.india.englab.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 11NF4XQ1009655;
	Tue, 23 Feb 2021 09:04:34 -0600
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <meta-arago@arago-project.org>, <praneeth@ti.com>
Date: Tue, 23 Feb 2021 20:34:12 +0530
Message-ID: <20210223150412.5124-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: lokeshvutla@ti.com, nsekhar@ti.com, kishon@ti.com
Subject: [dunfell PATCH] packagegroups: tisdk-connectivity: Include TI wlan packages for k3 platforms
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Feb 2021 15:04:25 -0000
Content-Type: text/plain

Currently, the K3 platforms do not include the TI wlan related packages.
Add in the tisdk-connectivity packagegroup.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---

Notes:
    This way, all the platforms are using the same recipes and we don't
    have to maintain any new recipe just for the am64xx-sk
    
    The firmare is getting picked from the repo
    git://git.ti.com/wilink8-wlan/wl18xx_fw.git

 .../packagegroups/packagegroup-arago-tisdk-connectivity.bb       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index 11109432..056e0411 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -88,6 +88,7 @@ CONNECTIVITY_RDEPENDS_append_dra7xx = "\
 
 CONNECTIVITY_RDEPENDS_append_k3 = "\
     ${WLAN_COMMON} \
+    ${WLAN_TI} \
     ${BT_COMMON} \
 "
 
-- 
2.17.1


