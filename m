Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 7504A529ED
	for <meta-arago@arago-project.org>;
	Fri, 15 Dec 2017 23:44:39 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBFNiclr011233
	for <meta-arago@arago-project.org>; Fri, 15 Dec 2017 17:44:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513381478;
	bh=EG5icLiW38EkOJgnPAS4K3/zs6aYYcP4MVejM/sFzLI=;
	h=From:To:Subject:Date;
	b=OUB6VTn6THtY/jCpHdC2FHMO3hvN56HTEk5XSzR+eJ366chR6Fc8LpoSybEkI12aK
	R5hJ9sKk3cKqLCIzXLDeVQLF62YW1rrPwMB5/S0HuYRF9ruUv09Xuh3bwh47b9LKm0
	nnD95p+8M+vVMy2CaMXWvFw6HTWSmTrqPt6+jBew=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBFNicr2031705
	for <meta-arago@arago-project.org>; Fri, 15 Dec 2017 17:44:38 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 15 Dec 2017 17:44:38 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 15 Dec 2017 17:44:38 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBFNicGs004544
	for <meta-arago@arago-project.org>; Fri, 15 Dec 2017 17:44:38 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 15 Dec 2017 18:44:37 -0500
Message-ID: <1513381477-17961-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] serdes-diag-rtos: Update to version 1.0.0.9
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
X-List-Received-Date: Fri, 15 Dec 2017 23:44:40 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/serdes-diag/serdes-diag-rtos_git.bbappend | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 recipes-bsp/serdes-diag/serdes-diag-rtos_git.bbappend

diff --git a/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bbappend b/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bbappend
new file mode 100644
index 0000000..00da3e1
--- /dev/null
+++ b/recipes-bsp/serdes-diag/serdes-diag-rtos_git.bbappend
@@ -0,0 +1,5 @@
+# Below commit ID corresponds to "DEV.DIAG_SERDES_SB.01.00.00.09"
+SERDES_DIAG_SRCREV = "22c47cc6e1784a3d2813424da5b469e4168659a6"
+
+PV = "01.00.00.09"
+PR = "r0"
-- 
1.9.1


