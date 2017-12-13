Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id F00065209B
	for <meta-arago@arago-project.org>;
	Wed, 13 Dec 2017 22:25:37 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBDMPREI016719
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 16:25:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513203927;
	bh=cORRPL20g8UU37sxrfnFxbQ6p8zOSuv4jsaHYSyVPj4=;
	h=From:To:Subject:Date;
	b=Y4tLcVvbQPCBHlLO8hQNqWpyOP+WntsXZORjUNenOQ3NTllaY8fduqTXtoorYeDJE
	MNOLR5caWvzIJwPl9TeZTP3QDXtMAKGMB2LjeifRmJX01U4F2EBLnHow+IGCXzSTVB
	nsEq8jSxwm5bxJwnVy6pFzSa/CSSzU5czO0wl/jE=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDMPLau002585
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 16:25:21 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 13 Dec 2017 16:25:21 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 13 Dec 2017 16:25:21 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDMPLQC014232
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 16:25:21 -0600
From: Mahesh Radhakrsihnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 13 Dec 2017 17:25:20 -0500
Message-ID: <1513203920-24941-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH ] pm-lld-rtos: Updating to version 1.0.0.8
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
X-List-Received-Date: Wed, 13 Dec 2017 22:25:38 -0000
Content-Type: text/plain

From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/pm-lld/pm-lld-rtos_git.bbappend | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 recipes-bsp/pm-lld/pm-lld-rtos_git.bbappend

diff --git a/recipes-bsp/pm-lld/pm-lld-rtos_git.bbappend b/recipes-bsp/pm-lld/pm-lld-rtos_git.bbappend
new file mode 100644
index 0000000..f420f6c
--- /dev/null
+++ b/recipes-bsp/pm-lld/pm-lld-rtos_git.bbappend
@@ -0,0 +1,12 @@
+
+PM_LLD_GIT_BRANCH_am57xx-evm = "master"
+
+# Below commit ID corresponds to "DEV.PM_LLD.01.04.00.03"
+PM_LLD_SRCREV = "7a4d80a607e7ef57015fcebc5c4b6a2ff9c9d26a"
+
+# Below commit ID corresponds to "REL.PDK.TDA.01.08.00.17"
+PM_LLD_SRCREV_dra7xx-evm = "0ac5d734db30c2fa1429cf17a0cecdff5421328d"
+PM_LLD_SRCREV_am57xx-evm = "0ac5d734db30c2fa1429cf17a0cecdff5421328d"
+
+PV = "01.04.00.03"
+PR = "r0"
-- 
1.9.1


