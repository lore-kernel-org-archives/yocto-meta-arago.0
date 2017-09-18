Return-Path: <sam.nelson@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 4EC75529D0
	for <meta-arago@arago-project.org>;
	Mon, 18 Sep 2017 17:55:50 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8IHtoKc010699
	for <meta-arago@arago-project.org>; Mon, 18 Sep 2017 12:55:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505757350;
	bh=HiLzchymP8Es6SxOqcJ3VPmTXSRQsevVy8IysKZI8gA=;
	h=From:To:CC:Subject:Date;
	b=kzqmzz6EQldDJ1Sd9bguGG3qRN8CtD3coqXzRKyPOZIKloOFI37IWviKB327RJtZ/
	WRBS7sYFAGoevflRpLqEiEs7p4rvEjAYaTbyy3e+0AdkpOI7BklA4XYIPeF6Jxw+5B
	v2TuP6biaoa677GL4CvKL0SDyhZgzgf/njwMv2xQ=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8IHtolk019739
	for <meta-arago@arago-project.org>; Mon, 18 Sep 2017 12:55:50 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 18 Sep 2017 12:55:50 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 18 Sep 2017 12:55:50 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8IHtn2i002174;
	Mon, 18 Sep 2017 12:55:49 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 18 Sep 2017 13:55:47 -0400
Message-ID: <1505757347-17137-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk PATCH] multiprocmgr: Update to new version 3.0.4.0
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
X-List-Received-Date: Mon, 18 Sep 2017 17:55:50 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
meta-ti already has this update
Applying here as the processor SDK release needs this
---
---
 recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bbappend | 6 ++++++
 recipes-ti/multiprocmgr/multiprocmgr-test_git.bbappend | 6 ++++++
 recipes-ti/multiprocmgr/multiprocmgr_git.bbappend      | 6 ++++++
 3 files changed, 18 insertions(+)
 create mode 100644 recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bbappend
 create mode 100644 recipes-ti/multiprocmgr/multiprocmgr-test_git.bbappend
 create mode 100644 recipes-ti/multiprocmgr/multiprocmgr_git.bbappend

diff --git a/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bbappend b/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bbappend
new file mode 100644
index 0000000..ee9f453
--- /dev/null
+++ b/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bbappend
@@ -0,0 +1,6 @@
+PR_append = ".tisdk0"
+
+# The following commits correspond to DEV.MPM-3.00.04.00
+MULTIPROCMGR_SRCREV = "21579a066b469ff4620e7cff12803ae152880bb5"
+
+PV = "3.0.4.0"
diff --git a/recipes-ti/multiprocmgr/multiprocmgr-test_git.bbappend b/recipes-ti/multiprocmgr/multiprocmgr-test_git.bbappend
new file mode 100644
index 0000000..ee9f453
--- /dev/null
+++ b/recipes-ti/multiprocmgr/multiprocmgr-test_git.bbappend
@@ -0,0 +1,6 @@
+PR_append = ".tisdk0"
+
+# The following commits correspond to DEV.MPM-3.00.04.00
+MULTIPROCMGR_SRCREV = "21579a066b469ff4620e7cff12803ae152880bb5"
+
+PV = "3.0.4.0"
diff --git a/recipes-ti/multiprocmgr/multiprocmgr_git.bbappend b/recipes-ti/multiprocmgr/multiprocmgr_git.bbappend
new file mode 100644
index 0000000..ee9f453
--- /dev/null
+++ b/recipes-ti/multiprocmgr/multiprocmgr_git.bbappend
@@ -0,0 +1,6 @@
+PR_append = ".tisdk0"
+
+# The following commits correspond to DEV.MPM-3.00.04.00
+MULTIPROCMGR_SRCREV = "21579a066b469ff4620e7cff12803ae152880bb5"
+
+PV = "3.0.4.0"
-- 
1.9.1


