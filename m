Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id ADF4A52987
	for <meta-arago@arago-project.org>;
	Wed,  3 Apr 2019 19:09:36 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x33J9ILO093186
	for <meta-arago@arago-project.org>; Wed, 3 Apr 2019 14:09:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1554318558;
	bh=qBChYwQYPvYKZgMJrz2/pNn2hkWkxaLJch7U1AnmlaQ=;
	h=From:To:Subject:Date;
	b=asEbbB3Le7DAv3zZmvx6CPxt/3HYRieTrQSEg4shZ2ntJ7lk+O/mBjM3YdyHS7fOc
	dvkd5LPZ6Ct4f6yrRodAn0PODadpJ8BG6Gx567y4ie52+3IT9ogSaSMIXsZ2F0nlvm
	f01abPVnT6lYE/bKJI5qT+97hP8dDG3jB0QZFNxU=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x33J9Ifp066640
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 3 Apr 2019 14:09:18 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 3 Apr 2019 14:09:18 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 3 Apr 2019 14:09:18 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x33J9HUS082637
	for <meta-arago@arago-project.org>; Wed, 3 Apr 2019 14:09:18 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 3 Apr 2019 15:09:13 -0400
Message-ID: <1554318553-57613-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: (No subject)
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
X-List-Received-Date: Wed, 03 Apr 2019 19:09:37 -0000
Content-Type: text/plain

From ada28379af24168c8901b525abec421c4cbbf70f Mon Sep 17 00:00:00 2001
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
Date: Wed, 3 Apr 2019 15:05:41 -0400
Subject: [master][meta-processor-sdk][PATCH] board-rtos: SRCREV bump to
 01.00.10.04C

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/board-rtos/board-rtos_git.bbappend | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 recipes-bsp/board-rtos/board-rtos_git.bbappend

diff --git a/recipes-bsp/board-rtos/board-rtos_git.bbappend b/recipes-bsp/board-rtos/board-rtos_git.bbappend
new file mode 100644
index 0000000..6cb286e
--- /dev/null
+++ b/recipes-bsp/board-rtos/board-rtos_git.bbappend
@@ -0,0 +1,6 @@
+
+# Below commit ID corresponds to "DEV.BOARD.01.00.10.04C"
+BOARD_SRCREV = "e794b8d6a58dc800cb406b05f45b46652c9d4f4c"
+
+PV = "01.00.10.04C"
+PR = "r0"
-- 
1.9.1


