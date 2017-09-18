Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 6543452AF5
	for <meta-arago@arago-project.org>;
	Mon, 18 Sep 2017 21:20:37 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8ILKaNF018767
	for <meta-arago@arago-project.org>; Mon, 18 Sep 2017 16:20:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505769636;
	bh=wcv7W9fzQm9R5dpfh8BnxWs6mb8/YOkGOiG7btSofwQ=;
	h=From:To:CC:Subject:Date;
	b=gX/XIawl/ide/BjDbivBLeGq3RuYHxg7JFQS4yopRrdinIUYI48+WffYYr7hyzNnz
	eURLbg7TWJU8kPho9enfa45s8OncS5F+a+JLxFPw24HElyzgVyGKvhI0mNDEdfn+JO
	TI3AkfXTXn0UjNSBDp8YW0b459zWF7TQgA97IQUg=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8ILKa8H011019
	for <meta-arago@arago-project.org>; Mon, 18 Sep 2017 16:20:36 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 18 Sep 2017 16:20:36 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 18 Sep 2017 16:20:36 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8ILKZ79018477;
	Mon, 18 Sep 2017 16:20:36 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 18 Sep 2017 17:20:21 -0400
Message-ID: <1505769621-12597-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk PATCH] common-csl-ip: Updating version to 3.3.0.8
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
X-List-Received-Date: Mon, 18 Sep 2017 21:20:38 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/common-csl-ip/common-csl-ip-3.3.0.8.inc       | 6 ++++++
 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend | 2 ++
 recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend      | 2 ++
 3 files changed, 10 insertions(+)
 create mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-3.3.0.8.inc
 create mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
 create mode 100644 recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-3.3.0.8.inc b/recipes-bsp/common-csl-ip/common-csl-ip-3.3.0.8.inc
new file mode 100644
index 0000000..b587b87
--- /dev/null
+++ b/recipes-bsp/common-csl-ip/common-csl-ip-3.3.0.8.inc
@@ -0,0 +1,6 @@
+PV = "03.03.00.08"
+INC_PR = "r0"
+
+# Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.03.03.00.08"
+CSL_SRCREV = "6a8af079b8bf8a66a9d0ff8c00f78badddcb8039"
+
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
new file mode 100644
index 0000000..9165cec
--- /dev/null
+++ b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
@@ -0,0 +1,2 @@
+require common-csl-ip-3.3.0.8.inc
+
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend b/recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend
new file mode 100644
index 0000000..9165cec
--- /dev/null
+++ b/recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend
@@ -0,0 +1,2 @@
+require common-csl-ip-3.3.0.8.inc
+
-- 
1.9.1


