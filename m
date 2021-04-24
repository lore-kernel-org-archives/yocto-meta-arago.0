Return-Path: <praneeth@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 8998D52AB4
	for <meta-arago@arago-project.org>;
	Sat, 24 Apr 2021 00:18:08 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13O0IZ8Z083349;
	Fri, 23 Apr 2021 19:18:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1619223515;
	bh=ywFQzVPmMuYw+1MPWHR4SvCX8X+DOhruJrot1PMJySU=;
	h=From:To:CC:Subject:Date;
	b=I6AmawtGI0LFJNCbq7xAyQpdlHiN+Qc1AMmSF4mlIiSPHu26gDhJsYggEhcaZhzUp
	1XOVSUvQjYEuRFUZzKsbDVRSig7oFGQI+LTd29e8UJu5dAqBlkqlpGoEjYZAP8sJNB
	RTtvnqRemnPndFM1CoyroKbo7R8v1Pf+fFxiFDAY=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13O0IZoh016757
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 23 Apr 2021 19:18:35 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Fri, 23 Apr 2021 19:18:35 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Fri, 23 Apr 2021 19:18:35 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13O0IYfo078961;
	Fri, 23 Apr 2021 19:18:35 -0500
From: <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
Date: Fri, 23 Apr 2021 19:18:34 -0500
Message-ID: <20210424001834.652-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [dunfell/master PATCH] ti-test: fix build errors with nested conditional operation
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
X-List-Received-Date: Sat, 24 Apr 2021 00:18:09 -0000
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

nested conditional operation like this
${@oe.utils.conditional(<condition>, ${@bb.utils.contains()}

is causing build issues on some of the older build machines like this.

Missing or unbuildable dependency chain was: ['tisdk-default-image', 'ti-test', "'',"]
ERROR: Nothing RPROVIDES ''omapdrmtest',' (but <>/ti-test.bb RDEPENDS on or otherwise requires it)
NOTE: Runtime target ''omapdrmtest',' is unbuildable, removing...
Missing or unbuildable dependency chain was: ["'omapdrmtest',"]
ERROR: Nothing RPROVIDES ''mmip',' (but <>/ti-test.bb RDEPENDS on or otherwise requires it)
NOTE: Runtime target ''mmip',' is unbuildable, removing...
Missing or unbuildable dependency chain was: ["'mmip',"]

This patch fixes such build issue.

Suggested-by: Denys Dmytriyenko <denis@denix.org>
Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 meta-arago-distro/recipes-core/packagegroups/ti-test.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
index cbc246d5..219b43b6 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
@@ -66,12 +66,14 @@ ARAGO_TI_TEST_append_ti43x = " \
     ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', 'cmem-test', d)} \
 "
 
+NOT_MAINLINE_MMIP_DEPS = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)}"
+
 ARAGO_TI_TEST_append_omap-a15 = " \
     omapconf \
     ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', " \
         ti-ipc-test \
-        ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)} \
         cmem-test \
+	${NOT_MAINLINE_MMIP_DEPS} \
     ", d)} \
 "
 
-- 
2.17.1


