Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 679A4529BA
	for <meta-arago@arago-project.org>;
	Tue, 14 May 2019 01:46:48 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4E1kIxq103490
	for <meta-arago@arago-project.org>; Mon, 13 May 2019 20:46:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1557798378;
	bh=I5mEiNbOuxvLeW6g7tijG4BafTdvIosi6lizfsiRUKw=;
	h=From:To:Subject:Date;
	b=fl6KTWbs4qeiz5onIQaeyZsf3UrHgFV8aRhobRv7tiZkrskZdckLW9lM7FZ210Qhh
	yWa4+jnCeH6Cl3g+C/jd+YgVXYd3QLQE6/AF9LULbzB4RuzA8T41Luym08iRVR/gKY
	iGQ6rBY7lLScyO5MyPYyXYudihKYm2mZcq3ECyF0=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4E1kI48046664
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 13 May 2019 20:46:18 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 13 May 2019 20:46:17 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 13 May 2019 20:46:17 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4E1kHui023464
	for <meta-arago@arago-project.org>; Mon, 13 May 2019 20:46:17 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 13 May 2019 21:46:09 -0400
Message-ID: <20190514014609.20214-1-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH] matrix-gui-browser: HACK: do not change SRCREV
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
X-List-Received-Date: Tue, 14 May 2019 01:46:48 -0000
Content-Type: text/plain

The qtwebengine is removed at meta-arago unconditionally because version
5.11.3 does not work. The intention of this recipe is to update the
QT5_SRCREV only if sgx is not available, but the original recipe will not
work in this case. Comment out the instructions tentatively.

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-core/matrix/matrix-gui-browser_2.0.bbappend | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-core/matrix/matrix-gui-browser_2.0.bbappend b/recipes-core/matrix/matrix-gui-browser_2.0.bbappend
index 75e76a8..e45f38e 100644
--- a/recipes-core/matrix/matrix-gui-browser_2.0.bbappend
+++ b/recipes-core/matrix/matrix-gui-browser_2.0.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk0"
+PR_append = ".tisdk1"
 
 DEPENDS_remove = "\
     ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', "${QT_DEPENDS_WEBENGINE}", d)} \
@@ -8,7 +8,7 @@ DEPENDS_append = "\
     ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', " ${QT_DEPENDS_WEBKIT}", d)} \
 "
 
-QT5_WEBENGINE_SRCREV = "d3ecf8d0dff3e4f901d588ea0dfe485733dfc9dc"
-QT5_WEBKIT_SRCREV = "78ad5db716d1abc4c05abfe435f066b6b88454d5"
+#QT5_WEBENGINE_SRCREV = "d3ecf8d0dff3e4f901d588ea0dfe485733dfc9dc"
+#QT5_WEBKIT_SRCREV = "78ad5db716d1abc4c05abfe435f066b6b88454d5"
 
-QT5_SRCREV = "${@bb.utils.contains('MACHINE_FEATURES', 'sgx', "${QT5_WEBENGINE_SRCREV}", "${QT5_WEBKIT_SRCREV}", d)}"
+#QT5_SRCREV = "${@bb.utils.contains('MACHINE_FEATURES', 'sgx', "${QT5_SRCREV}", "${QT5_WEBKIT_SRCREV}", d)}"
-- 
2.17.1


