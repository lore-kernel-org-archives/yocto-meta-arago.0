Return-Path: <praneeth@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 52CEF52CA7
	for <meta-arago@arago-project.org>;
	Tue, 13 Apr 2021 04:46:48 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13D4lCIL035340;
	Mon, 12 Apr 2021 23:47:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618289232;
	bh=eCZ3mbzzp8QGsCssq1RddZNP+QSDVxRAFgroFIlTuXQ=;
	h=From:To:CC:Subject:Date;
	b=GKHAuiuXQ2oSTjh6+Usp3fMTssdjVs8YwHtM4Jo856obWZA9qQKOlTjnMkrdl4CXs
	e5o55tywxEND/bfbvHCL2oTdhGlhU19xBNsDiAwASI52+POQQeehL9gCBV+QWs6BI+
	EXObygCNeBaQurMOPS1k5ePF7BEUQyMHrKQdgqI4=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13D4lCnI110289
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 Apr 2021 23:47:12 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Mon, 12 Apr 2021 23:47:11 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Mon, 12 Apr 2021 23:47:12 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13D4lBeu075603;
	Mon, 12 Apr 2021 23:47:11 -0500
From: <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
Date: Mon, 12 Apr 2021 23:47:09 -0500
Message-ID: <20210413044711.12576-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell/master PATCH 1/3] Revert "branding-core-next: explicitly select latest versions"
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
X-List-Received-Date: Tue, 13 Apr 2021 04:46:49 -0000
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

This reverts commit 3d919caf87700d348e86d841b8e8b425c165c0e1.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 .../conf/distro/include/branding-core-next.inc            | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-core-next.inc b/meta-arago-distro/conf/distro/include/branding-core-next.inc
index f453b3c6..a2667a70 100644
--- a/meta-arago-distro/conf/distro/include/branding-core-next.inc
+++ b/meta-arago-distro/conf/distro/include/branding-core-next.inc
@@ -2,10 +2,10 @@
 
 require branding-core.inc
 
-PREFERRED_VERSION_linux-ti-staging = "5.10%"
-PREFERRED_VERSION_linux-ti-staging-rt = "5.10%"
-PREFERRED_VERSION_linux-ti-staging-systest = "5.10%"
-PREFERRED_VERSION_u-boot-ti-staging = "2021.01%"
+PREFERRED_VERSION_linux-ti-staging = ""
+PREFERRED_VERSION_linux-ti-staging-rt = ""
+PREFERRED_VERSION_linux-ti-staging-systest = ""
+PREFERRED_VERSION_u-boot-ti-staging = ""
 
 # Auto rev important packages to pick up latest
 SRCREV_pn-linux-ti-staging = "${AUTOREV}"
-- 
2.17.1


