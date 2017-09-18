Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id C91F152AF5
	for <meta-arago@arago-project.org>;
	Mon, 18 Sep 2017 21:35:48 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8ILZcf1002496
	for <meta-arago@arago-project.org>; Mon, 18 Sep 2017 16:35:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505770538;
	bh=hncbGNfmkPD1U9ve1LEXsD0/yY33K31yvxwjdvLXPis=;
	h=From:To:CC:Subject:Date;
	b=rXzw76Qz+oMejtKBpYLONafTOjyPPZaeybbzDFr0CSSGcrvrUF9gs2psJAGUqnWd/
	oC+tRDnMAh2xDLf+ierr2/XdTna1NpVfflK/nJMbWR997rTwG9Ruo2TklWenQyJwnJ
	EmrHsMdAVcdKG0s6LcGUkStuNTfsYsxkQKWSGKlM=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8ILZX1Y017883
	for <meta-arago@arago-project.org>; Mon, 18 Sep 2017 16:35:33 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 18 Sep 2017 16:35:33 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 18 Sep 2017 16:35:33 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8ILZXxl012419;
	Mon, 18 Sep 2017 16:35:33 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 18 Sep 2017 17:35:31 -0400
Message-ID: <1505770531-13163-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk PATCH] hyplnk-lld: Updating to version 2.1.0.7
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
X-List-Received-Date: Mon, 18 Sep 2017 21:35:49 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/hyplnk-lld/hyplnk-lld-2.1.0.7.inc       | 6 ++++++
 recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bbappend | 2 ++
 recipes-bsp/hyplnk-lld/hyplnk-lld_git.bbappend      | 2 ++
 3 files changed, 10 insertions(+)
 create mode 100644 recipes-bsp/hyplnk-lld/hyplnk-lld-2.1.0.7.inc
 create mode 100644 recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bbappend
 create mode 100644 recipes-bsp/hyplnk-lld/hyplnk-lld_git.bbappend

diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld-2.1.0.7.inc b/recipes-bsp/hyplnk-lld/hyplnk-lld-2.1.0.7.inc
new file mode 100644
index 0000000..6fc64dd
--- /dev/null
+++ b/recipes-bsp/hyplnk-lld/hyplnk-lld-2.1.0.7.inc
@@ -0,0 +1,6 @@
+# Following commit corresponds to tag DEV.HYPLNK_LLD.02.01.00.07
+HYPLNK_SRCREV = "7799dd3b1ef425494bf52534adebb915f6566885"
+
+PV = "2.1.0.7"
+INC_PR = "r0"
+
diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bbappend b/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bbappend
new file mode 100644
index 0000000..2f8a18f
--- /dev/null
+++ b/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bbappend
@@ -0,0 +1,2 @@
+require hyplnk-lld-2.1.0.7.inc
+
diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bbappend b/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bbappend
new file mode 100644
index 0000000..2f8a18f
--- /dev/null
+++ b/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bbappend
@@ -0,0 +1,2 @@
+require hyplnk-lld-2.1.0.7.inc
+
-- 
1.9.1


