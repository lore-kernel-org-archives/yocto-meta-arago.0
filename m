Return-Path: <praneeth@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id A67DD52B2B
	for <meta-arago@arago-project.org>;
	Tue, 20 Apr 2021 03:05:23 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13K35nEw058702;
	Mon, 19 Apr 2021 22:05:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618887949;
	bh=c3nOcKJMfPT24crTIKu0iY8mgYPFnXQdA/2piJ5UkZ4=;
	h=From:To:CC:Subject:Date;
	b=pFAHgOrtiBvy4unwHYpO4FErcKVpWnWqgIzczLwSrffitSOxMFwUL3ekFGrqZnOK7
	sl0XwFl02+qerMROSO1/9Gyk2/XBNA/vZZRsVlZT7/JumRtrNngfPvtr+e+qGsc3s4
	FldiC0QmeOR9ruzAmfgyp+ipyvrGIrLvt4aH4z5w=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13K35nY5076673
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Apr 2021 22:05:49 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Mon, 19 Apr 2021 22:05:49 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Mon, 19 Apr 2021 22:05:49 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13K35nnm018179;
	Mon, 19 Apr 2021 22:05:49 -0500
From: <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
Date: Mon, 19 Apr 2021 22:05:49 -0500
Message-ID: <20210420030549.16897-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell/master PATCH] ti-test: omap-a15: split package selection command to avoid build erros
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
X-List-Received-Date: Tue, 20 Apr 2021 03:05:23 -0000
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

Split the package selection option for omap-a15 based machines to avoid
the build errors like this.

ERROR: Nothing RPROVIDES '${@oe.utils.conditional('ARAGO_BRAND','
(but <>/packagegroups/ti-test.bb RDEPENDS on or otherwise requires it)

NOTE: Runtime target '${@oe.utils.conditional('ARAGO_BRAND',' is unbuildable, removing...
Missing or unbuildable dependency chain was: ["${@oe.utils.conditional('ARAGO_BRAND',"]

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 .../recipes-core/packagegroups/ti-test.bb             | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
index cbc246d5..2730c381 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
@@ -66,14 +66,9 @@ ARAGO_TI_TEST_append_ti43x = " \
     ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', 'cmem-test', d)} \
 "
 
-ARAGO_TI_TEST_append_omap-a15 = " \
-    omapconf \
-    ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', " \
-        ti-ipc-test \
-        ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)} \
-        cmem-test \
-    ", d)} \
-"
+ARAGO_TI_TEST_append_omap-a15 = "omapconf ti-ipc-test cmem-test"
+
+ARAGO_TI_TEST_append_omap-a15 = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)}"
 
 ARAGO_TI_TEST_append_k3 = " \
     k3conf \
-- 
2.17.1


