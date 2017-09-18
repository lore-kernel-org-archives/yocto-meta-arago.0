Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 01CF552AF5
	for <meta-arago@arago-project.org>;
	Mon, 18 Sep 2017 21:21:38 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8ILLcbE018432
	for <meta-arago@arago-project.org>; Mon, 18 Sep 2017 16:21:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505769698;
	bh=hncbGNfmkPD1U9ve1LEXsD0/yY33K31yvxwjdvLXPis=;
	h=From:To:CC:Subject:Date;
	b=pi4n2Yjec+vgwu1OZkOD5gPGCcJoKmjaecgXnJbnjAn+3tOxWotnp1QhiHII9+QAY
	gs8bv61BdIeHBdzkDJisQf0q6ym9gLveZfbr/76mKUj1T/48n+MUAAA0d57QF6F59S
	mbg/4k6xumP/DjPaABJ69mDne+qijR5Grltge2jo=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8ILLcxu012181
	for <meta-arago@arago-project.org>; Mon, 18 Sep 2017 16:21:38 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 18 Sep 2017 16:21:38 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 18 Sep 2017 16:21:38 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8ILLbNc023852;
	Mon, 18 Sep 2017 16:21:37 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 18 Sep 2017 17:21:36 -0400
Message-ID: <1505769696-12646-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk PATCH] Updating to hyplnk version 2.1.0.7
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
X-List-Received-Date: Mon, 18 Sep 2017 21:21:43 -0000
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


