Return-Path: <subhajit_paul@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id B9A56520E0
	for <meta-arago@arago-project.org>;
	Tue,  2 Jul 2019 17:47:17 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x62HkWKU005604
	for <meta-arago@arago-project.org>; Tue, 2 Jul 2019 12:46:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562089592;
	bh=6JFA+fHn/IkH7SRYuIACg0ITL1IETiUfQB342x1uk4w=;
	h=From:To:CC:Subject:Date;
	b=UfR8Df4a17BEJRIIxoyBApuqzoJpxuviFeN0sWnM3hr1mPi8GGL5vWcH8IANO13Sv
	NIFM7vkXBCbQ9X4JDmN46oqmm/K36Lp9nVPMNFuowF8inVcWqNmE+S8iGXrsXoXLNr
	b9SxFGfPiyflovVL35JPbOORZDiBS6cGYgLcu6i4=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x62HkWws086174
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 2 Jul 2019 12:46:32 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 2 Jul 2019 12:46:31 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 2 Jul 2019 12:46:31 -0500
Received: from uda0132170-dell.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x62HkUoF104509;
	Tue, 2 Jul 2019 12:46:30 -0500
From: Subhajit Paul <subhajit_paul@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 2 Jul 2019 23:16:08 +0530
Message-ID: <1562089568-27949-1-git-send-email-subhajit_paul@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] cadence-mhdp-fw: fix install location for firmware
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
X-List-Received-Date: Tue, 02 Jul 2019 17:47:18 -0000
Content-Type: text/plain

Signed-off-by: Subhajit Paul <subhajit_paul@ti.com>
---
 recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb b/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
index e8d5c54..a703272 100644
--- a/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
+++ b/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
@@ -21,8 +21,8 @@ S = "${WORKDIR}/git"
 TARGET = "mhdp8546.bin"
 
 do_install() {
-	install -d ${D}${base_libdir}/firmware
-	install -m 0644 ${S}/cadence/${TARGET} ${D}${base_libdir}/firmware/${TARGET}
+	install -d ${D}${base_libdir}/firmware/cadence
+	install -m 0644 ${S}/cadence/${TARGET} ${D}${base_libdir}/firmware/cadence/${TARGET}
 }
 
 FILES_${PN} = "${base_libdir}/firmware"
-- 
2.7.4


