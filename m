Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 4A67E52AC4
	for <meta-arago@arago-project.org>;
	Tue, 18 Dec 2018 22:21:15 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBIML3dS004337
	for <meta-arago@arago-project.org>; Tue, 18 Dec 2018 16:21:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1545171663;
	bh=AKz0IJRNhap6IenDznO0lkzh1Du8F4vW57QsoHDusSI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=bgD6bLIJWm1/0vYYZ0UvpiCFHf7BW4rwSgSLkz+p0PQU+VGm1XgsQcTu+h99mcyYA
	QtbVdho7aSQLUTYAx2JAg4g5eE+b/F7ro0853zBvPiiCSCLBSQJssg3nOO63YFZK6d
	5YFHuSoDMJk1VLlQPM0mg6k2eaj9D4fvJNmQy0Os=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBIML3dj049595
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 18 Dec 2018 16:21:03 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 18 Dec 2018 16:21:02 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 18 Dec 2018 16:21:03 -0600
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBIML1RC018057
	for <meta-arago@arago-project.org>; Tue, 18 Dec 2018 16:21:02 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 18 Dec 2018 17:20:56 -0500
Message-ID: <1545171658-17410-5-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1545171658-17410-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1545171658-17410-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][meta-processor-sdk][PATCH 4/6] emac-lld-rtos: SRCREV update to 01.00.03.13C
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
X-List-Received-Date: Tue, 18 Dec 2018 22:21:17 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/emac-lld/emac-lld-rtos_git.bbappend | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 recipes-bsp/emac-lld/emac-lld-rtos_git.bbappend

diff --git a/recipes-bsp/emac-lld/emac-lld-rtos_git.bbappend b/recipes-bsp/emac-lld/emac-lld-rtos_git.bbappend
new file mode 100644
index 0000000..d0b20f0
--- /dev/null
+++ b/recipes-bsp/emac-lld/emac-lld-rtos_git.bbappend
@@ -0,0 +1,5 @@
+# Below commit ID corresponds to "DEV.EMAC_LLD.01.00.03.13C"
+EMAC_LLD_SRCREV = "e37ab39f3fa7ed7c9266e220e584c1097c32fcff"
+
+PV = "01.00.03.13C"
+PR = "r0"
-- 
1.9.1


