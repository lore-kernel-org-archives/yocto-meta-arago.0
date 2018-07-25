Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id E5D26529AE
	for <meta-arago@arago-project.org>;
	Wed, 25 Jul 2018 12:05:16 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6PC5A5s056512
	for <meta-arago@arago-project.org>; Wed, 25 Jul 2018 07:05:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532520310;
	bh=pKMV9uRpdzVxRLnDn6X+XqBZWkqkIPQG0FPm+RajkUo=;
	h=From:To:CC:Subject:Date;
	b=BxAfYKar4GGjXyQhRBnMS++y5pWgkwGZDXSoP1c7Kc0QIjUbFVeuLLrzfgBFTvnln
	jonBPNN8tLIdepsyNDBiNdzaHW5v8JCNSsYl5lucC4bBA7M3SE+yh3+EyHNm+yeXbB
	7cVakAjtlK5sopSNj3b53DVWn5DdGn8OgAKs1kqw=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6PC5Ar2027146
	for <meta-arago@arago-project.org>; Wed, 25 Jul 2018 07:05:10 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 25 Jul 2018 07:05:09 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 25 Jul 2018 07:05:09 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6PC59Gs024647;
	Wed, 25 Jul 2018 07:05:09 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 25 Jul 2018 07:53:06 -0400
Message-ID: <1532519588-17585-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Djordje Senicic <x0157990@ti.com>
Subject: [meta-processor-sdk][PATCH 1/3] tidl-api: Update test video clip
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
X-List-Received-Date: Wed, 25 Jul 2018 12:05:17 -0000
Content-Type: text/plain

* Use real-life video clip and list of classes

Cc: Djordje Senicic <x0157990@ti.com>
Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/tidl-api/tidl-api-next.inc          | 3 +++
 recipes-ti/tidl-api/tidl-api_git.bbappend      | 1 +
 recipes-ti/tidl-api/tidl-examples_git.bbappend | 1 +
 recipes-ti/tidl-api/tidl-viewer_git.bbappend   | 1 +
 4 files changed, 6 insertions(+)
 create mode 100644 recipes-ti/tidl-api/tidl-api-next.inc
 create mode 100644 recipes-ti/tidl-api/tidl-api_git.bbappend
 create mode 100644 recipes-ti/tidl-api/tidl-examples_git.bbappend
 create mode 100644 recipes-ti/tidl-api/tidl-viewer_git.bbappend

diff --git a/recipes-ti/tidl-api/tidl-api-next.inc b/recipes-ti/tidl-api/tidl-api-next.inc
new file mode 100644
index 0000000..8c34699
--- /dev/null
+++ b/recipes-ti/tidl-api/tidl-api-next.inc
@@ -0,0 +1,3 @@
+PR_append = ".tisdk0"
+
+SRCREV = "06585057d0f47bb930647123557bc5a1506dabda"
diff --git a/recipes-ti/tidl-api/tidl-api_git.bbappend b/recipes-ti/tidl-api/tidl-api_git.bbappend
new file mode 100644
index 0000000..63dbd4f
--- /dev/null
+++ b/recipes-ti/tidl-api/tidl-api_git.bbappend
@@ -0,0 +1 @@
+require tidl-api-next.inc
diff --git a/recipes-ti/tidl-api/tidl-examples_git.bbappend b/recipes-ti/tidl-api/tidl-examples_git.bbappend
new file mode 100644
index 0000000..63dbd4f
--- /dev/null
+++ b/recipes-ti/tidl-api/tidl-examples_git.bbappend
@@ -0,0 +1 @@
+require tidl-api-next.inc
diff --git a/recipes-ti/tidl-api/tidl-viewer_git.bbappend b/recipes-ti/tidl-api/tidl-viewer_git.bbappend
new file mode 100644
index 0000000..63dbd4f
--- /dev/null
+++ b/recipes-ti/tidl-api/tidl-viewer_git.bbappend
@@ -0,0 +1 @@
+require tidl-api-next.inc
-- 
2.7.4


