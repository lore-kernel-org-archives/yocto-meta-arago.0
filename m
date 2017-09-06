Return-Path: <h-gou@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 0AF23529D3
	for <meta-arago@arago-project.org>;
	Wed,  6 Sep 2017 19:52:07 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v86Jq7xo011314
	for <meta-arago@arago-project.org>; Wed, 6 Sep 2017 14:52:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504727528;
	bh=qca9kFXOzUKbf5hdC7gN1gGHJEdYPMA1svno0hqOZUE=;
	h=From:To:CC:Subject:Date;
	b=qZvR3f7o1RcWViLw51w3T/jbzB+iz5q+nzE3yMg9LWhDdL9gjSzH0cjG8Bx5cNXo+
	9QqNlVmeGsf/PRXWmHN6wLXEwqppnjaz4FpDfVR/P+AZ91QBz7A0wNtGhfLB4DHwxu
	e/r1xcVzBdg5ZXdG1gyw1udrplv7i23bppsFbs2A=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v86Jq7NX015812
	for <meta-arago@arago-project.org>; Wed, 6 Sep 2017 14:52:07 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 6 Sep 2017 14:52:07 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 6 Sep 2017 14:52:07 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v86Jq799008367;
	Wed, 6 Sep 2017 14:52:07 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 6 Sep 2017 15:51:55 -0400
Message-ID: <1504727515-29423-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk][PATCH] uio-test-pruss: upstreamed to meta-ti
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
X-List-Received-Date: Wed, 06 Sep 2017 19:52:08 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-ti/uio-test-pruss/uio-test-pruss_git.bbappend | 17 -----------------
 1 file changed, 17 deletions(-)
 delete mode 100644 recipes-ti/uio-test-pruss/uio-test-pruss_git.bbappend

diff --git a/recipes-ti/uio-test-pruss/uio-test-pruss_git.bbappend b/recipes-ti/uio-test-pruss/uio-test-pruss_git.bbappend
deleted file mode 100644
index 1a680a8..0000000
--- a/recipes-ti/uio-test-pruss/uio-test-pruss_git.bbappend
+++ /dev/null
@@ -1,17 +0,0 @@
-PR_append = ".tisdk0"
-
-PV = "1.0.1.0"
-
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
-
-DEVICE_NAME_append_ti33x = "am33xx"
-DEVICE_NAME_append_ti43x = "am43xx"
-
-UIO_TEST_PRUSS_GIT_URI = "git://git.ti.com/processor-sdk/uio-test-pruss.git"
-UIO_TEST_PRUSS_GIT_PROTOCOL = "git"
-SRC_URI = "${UIO_TEST_PRUSS_GIT_URI};protocol=${UIO_TEST_PRUSS_GIT_PROTOCOL};branch=${BRANCH}"
-
-# Corresponds to version 01.00.01.00
-UIO_TEST_PRUSS_SRCREV = "72f7454c2460bd7d52dab70631b38bf5d3585542"
-
-SRCREV = "${UIO_TEST_PRUSS_SRCREV}"
-- 
1.9.1


