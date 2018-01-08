Return-Path: <h-gou@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 593A1529DC
	for <meta-arago@arago-project.org>;
	Mon,  8 Jan 2018 23:34:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w08NXvQO027275
	for <meta-arago@arago-project.org>; Mon, 8 Jan 2018 17:33:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1515454437;
	bh=P3jwFRsbkqNE4lrfVGb8TODkzEFiujk4nnfh7D2XXPo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Rt/VuR21sfUPSMrLsWPmrfUmOqm+VKTScBvkyTCSewj70ROCjUOGDxlos371l6PCt
	+cz1Q28slhsU/vDPx2g4syYu5QwsJwvYC9h6Q9Q2vrbqaTPUEMIsCXOLSrqcS/dvW/
	kY4tN3CVLpjIkWDCdRTQowke4zix13y7j8MqW+yE=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w08NXv7C025903
	for <meta-arago@arago-project.org>; Mon, 8 Jan 2018 17:33:57 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 8 Jan 2018 17:33:56 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 8 Jan 2018 17:33:56 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w08NXrhE019194;
	Mon, 8 Jan 2018 17:33:56 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 8 Jan 2018 18:33:37 -0500
Message-ID: <1515454420-19972-10-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1515454420-19972-1-git-send-email-a0271529@ti.com>
References: <1515454420-19972-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 09/12] pm-lld-rtos: upstreamed to meta-ti
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
X-List-Received-Date: Mon, 08 Jan 2018 23:34:05 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-bsp/pm-lld/pm-lld-rtos_git.bbappend | 11 -----------
 1 file changed, 11 deletions(-)
 delete mode 100644 recipes-bsp/pm-lld/pm-lld-rtos_git.bbappend

diff --git a/recipes-bsp/pm-lld/pm-lld-rtos_git.bbappend b/recipes-bsp/pm-lld/pm-lld-rtos_git.bbappend
deleted file mode 100644
index c045335..0000000
--- a/recipes-bsp/pm-lld/pm-lld-rtos_git.bbappend
+++ /dev/null
@@ -1,11 +0,0 @@
-PM_LLD_GIT_BRANCH_am57xx-evm = "master"
-
-# Below commit ID corresponds to "DEV.PM_LLD.01.04.00.03"
-PM_LLD_SRCREV = "7a4d80a607e7ef57015fcebc5c4b6a2ff9c9d26a"
-
-# Below commit ID corresponds to "REL.PDK.TDA.01.08.00.17"
-PM_LLD_SRCREV_dra7xx-evm = "0ac5d734db30c2fa1429cf17a0cecdff5421328d"
-PM_LLD_SRCREV_am57xx-evm = "0ac5d734db30c2fa1429cf17a0cecdff5421328d"
-
-PV = "01.04.00.03"
-PR = "r0"
-- 
1.9.1


