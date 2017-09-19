Return-Path: <h-gou@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 2A40052961
	for <meta-arago@arago-project.org>;
	Wed, 20 Sep 2017 13:15:06 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8JLtvJr022015
	for <meta-arago@arago-project.org>; Tue, 19 Sep 2017 16:55:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505858157;
	bh=CaJom24h1iJWT1TZebV79YqJS/ER5LJeZFY9VG/5qho=;
	h=From:To:CC:Subject:Date;
	b=LSuq2whLMux/FyAz3JTZX9pUeP46ddNJdsTHJ64ShT8xNEyTYc/tw3pmtS5ms5CCe
	bjBshPNxPlKA558pLJQX1G6QOBApwozZz+XAwwYyPpwA4FFCQ5c56eDBB+aybA3X3L
	FV6lc5rffP8KNhJdbzvpq9Wy0JAKQmOMU6+waa9M=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8JLtqB7002101
	for <meta-arago@arago-project.org>; Tue, 19 Sep 2017 16:55:52 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 19 Sep 2017 16:55:51 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 19 Sep 2017 16:55:52 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8JLtpBB012034;
	Tue, 19 Sep 2017 16:55:51 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Sep 2017 17:55:47 -0400
Message-ID: <1505858148-5618-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk] [PATCH 1/2] uio-test-pruss: add support for k2g-evm
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
X-List-Received-Date: Wed, 20 Sep 2017 13:15:06 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-ti/uio-test-pruss/uio-test-pruss_git.bbappend | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/recipes-ti/uio-test-pruss/uio-test-pruss_git.bbappend b/recipes-ti/uio-test-pruss/uio-test-pruss_git.bbappend
index 7297c8b..e6c92c9 100644
--- a/recipes-ti/uio-test-pruss/uio-test-pruss_git.bbappend
+++ b/recipes-ti/uio-test-pruss/uio-test-pruss_git.bbappend
@@ -1,6 +1,10 @@
-PR_append = ".tisdk0"
+PR_append = ".tisdk1"
 
 PV = "1.0.2.0"
 
 # Corresponds to version 01.00.02.00
 UIO_TEST_PRUSS_SRCREV = "e52a7b099d7203ca52519650df51419e9fef7e0c"
+
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g-evm"
+
+DEVICE_NAME_append_k2g-evm = "k2g"
-- 
1.9.1


