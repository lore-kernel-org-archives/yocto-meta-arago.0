Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 0D38352A5D
	for <meta-arago@arago-project.org>;
	Mon, 29 Jun 2020 15:39:24 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05TFal27008717
	for <meta-arago@arago-project.org>; Mon, 29 Jun 2020 10:36:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1593445007;
	bh=lukQu50m62WSwuAAxAfuLeeVkGTxEhTkcGqDLHmMeM0=;
	h=From:To:CC:Subject:Date;
	b=SG9UrkjQ8JniH7QkTanie0nmuZ19BGQOz8os7ncUL2uwm1NK4qQf4ItDtZ/NkCTvH
	YdwAzvwllRzm3OCPQ0pGCLZq7iPMexycXwuWCqvCAKQul3xZ6ez4WvRChLodR8dnow
	zH2rsaXWQmlBo2YNRbnkLEXv75jQhcMwXNNhHHBc=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05TFaln7046006
	for <meta-arago@arago-project.org>; Mon, 29 Jun 2020 10:36:47 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Mon, 29 Jun 2020 10:36:47 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Mon, 29 Jun 2020 10:36:47 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05TFalvc052762;
	Mon, 29 Jun 2020 10:36:47 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 29 Jun 2020 15:36:46 +0000
Message-ID: <20200629153646.10590-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] ltp-ddt: pre-create runtest/controllers file for upstream sed change
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
X-List-Received-Date: Mon, 29 Jun 2020 15:39:26 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb            | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
index ca8e82d7..85a34274 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
@@ -35,3 +35,9 @@ RDEPENDS_${PN} += "\
     serialcheck \
     memtester \
 "
+
+do_install_prepend() {
+	# Upstream ltp recipe wants to remove this test case in do_install
+	install -d ${D}${prefix}/runtest/
+	echo "memcg_stress" >> ${D}${prefix}/runtest/controllers
+}
-- 
2.17.1


