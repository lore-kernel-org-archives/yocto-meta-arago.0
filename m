Return-Path: <h-gou@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id AEE8A529AB
	for <meta-arago@arago-project.org>;
	Mon,  8 Jan 2018 23:34:02 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w08NXuDu017881
	for <meta-arago@arago-project.org>; Mon, 8 Jan 2018 17:33:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1515454436;
	bh=zBJvoEDtkWLzuI97tddKJYwbFHJDgRkTl193alx5EOg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=T2WOd+TPnz67J+f4eCiuABZqV51+BF1WupYnKx8kbEtGHPMbdzUc/evVzS9btgoTI
	UhfMsQj/qaKLngvLFH2OQYW4QWoaqtt55NYOrRwwS9OdZGiyWbLR2DblEZSmXpDsLd
	1zbVReYUOOv/HWQHlansPRadntzrf1LXH0fS9WBU=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w08NXunY025894
	for <meta-arago@arago-project.org>; Mon, 8 Jan 2018 17:33:56 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 8 Jan 2018 17:33:56 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 8 Jan 2018 17:33:56 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w08NXrhC019194;
	Mon, 8 Jan 2018 17:33:56 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 8 Jan 2018 18:33:35 -0500
Message-ID: <1515454420-19972-8-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1515454420-19972-1-git-send-email-a0271529@ti.com>
References: <1515454420-19972-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 07/12] mmcsd-lld-rtos: upstreamed to meta-ti
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
X-List-Received-Date: Mon, 08 Jan 2018 23:34:04 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bbappend | 5 -----
 1 file changed, 5 deletions(-)
 delete mode 100644 recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bbappend

diff --git a/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bbappend b/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bbappend
deleted file mode 100644
index 081715c..0000000
--- a/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-# Below commit ID corresponds to "DEV.MMCSD_LLD.01.00.00.10"
-MMCSD_LLD_SRCREV = "9bb118bdc1ac46863f57a68d70f421734a4dcf25"
-
-PV = "01.00.00.10"
-PR = "r0"
-- 
1.9.1


