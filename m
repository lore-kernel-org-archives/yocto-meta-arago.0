Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id BBBFF52968
	for <meta-arago@arago-project.org>;
	Mon, 19 Mar 2018 14:40:37 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2JEddvF015175
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 09:39:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521470379;
	bh=yNvQ/Hcp6OouOtwwwYbxz6O/TSEbHUMEyB7UHkejEQg=;
	h=From:To:Subject:Date;
	b=n25UO2vJnmUXWglT3c+UsRMx4zJ0nnY+zKDKhlCizSeH91TLDeDaaKIYXgkwYxc4M
	4E9Afr2jgmfl/6QtGrDj3FLqKVKBKpX1H6UUdYDnHACrRo68ql8Su94tLSvwY9ySWT
	ZGceWVp2kBf8WrJCbeFOzquAIuLCRQf3q1/MUimQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JEddUL024381
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 09:39:39 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 19 Mar 2018 09:39:39 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 19 Mar 2018 09:39:39 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JEdc5h025453
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 09:39:39 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 Mar 2018 10:39:27 -0400
Message-ID: <1521470367-14224-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] serdes-diag-rtos: Update to version 01.00.00.10
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
X-List-Received-Date: Mon, 19 Mar 2018 14:40:37 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/serdes-diag/serdes-diag-rtos_git.bbappend | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 recipes-bsp/serdes-diag/serdes-diag-rtos_git.bbappend

diff --git a/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bbappend b/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bbappend
new file mode 100644
index 0000000..dd61764
--- /dev/null
+++ b/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bbappend
@@ -0,0 +1,5 @@
+# Below commit ID corresponds to "DEV.DIAG_SERDES_SB.01.00.00.10"
+SERDES_DIAG_SRCREV = "0154d758e2df0f38baec97843dca0b784dcce6b4"
+
+PV = "01.00.00.10"
+PR = "r0"
-- 
1.9.1


