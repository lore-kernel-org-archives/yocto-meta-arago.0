Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 4C26952093
	for <meta-arago@arago-project.org>;
	Wed, 20 Sep 2017 22:45:08 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8KMj7Dk001437
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 17:45:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505947507;
	bh=Wb21aL7Kk+fY3NcthgoCL+kLpvWXbsL7Ty6sItdbxtc=;
	h=From:To:CC:Subject:Date;
	b=w4EF66A2Y7R49o0mo5d/4fWDrlR9ls1x/EkAjQPOUoashnbHkMiDOT9sQ8DKNIblC
	fB1HkDMd96KNXzugU9i6ubmpatLctTdMjBghm4bdlCBVb7uAnxphIlf+qbPjp2m+DW
	e/dZbEJ8dISgnMLqQERImc5M7LnRI7pNoaoI1crk=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KMj7Fo012730
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 17:45:07 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 20 Sep 2017 17:45:07 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 20 Sep 2017 17:45:07 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KMj7cQ026594;
	Wed, 20 Sep 2017 17:45:07 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 20 Sep 2017 18:44:53 -0400
Message-ID: <1505947493-21847-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk PATCH] starterware: Updating to version 2.1.1.4
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
X-List-Received-Date: Wed, 20 Sep 2017 22:45:09 -0000
Content-Type: text/plain

---
 recipes-bsp/starterware/starterware-2.1.1.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/starterware/starterware-2.1.1.inc b/recipes-bsp/starterware/starterware-2.1.1.inc
index c5d7655..8e0b647 100644
--- a/recipes-bsp/starterware/starterware-2.1.1.inc
+++ b/recipes-bsp/starterware/starterware-2.1.1.inc
@@ -8,14 +8,14 @@ STARTERWARE_GIT_URI = "git://git.ti.com/keystone-rtos/starterware.git"
 STARTERWARE_GIT_PROTOCOL = "git"
 STARTERWARE_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.STARTERWARE.PROCSDK.02.01.01.03A"
-STARTERWARE_SRCREV = "08f65ae3d5ccd19fbaf36040a99de971b685d144"
+# Below commit ID corresponds to "DEV.STARTERWARE.PROCSDK.02.01.01.04"
+STARTERWARE_SRCREV = "03c5e4e2db71f7fac0206e17e8d00d903f15561c"
 
 BRANCH = "${STARTERWARE_GIT_BRANCH}"
 SRC_URI = "${STARTERWARE_GIT_URI};protocol=${STARTERWARE_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${STARTERWARE_SRCREV}"
-PV = "02.01.01.03A"
+PV = "02.01.01.04"
 INC_PR = "r0"
 
 S = "${WORKDIR}/git"
-- 
1.9.1


