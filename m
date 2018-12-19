Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id A9AF0529D0
	for <meta-arago@arago-project.org>;
	Wed, 19 Dec 2018 20:40:48 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBJKeaip008914
	for <meta-arago@arago-project.org>; Wed, 19 Dec 2018 14:40:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1545252036;
	bh=GE8gbtENNUnWzI1+ie0iW6hrPN0TgfF5iuBZ7HymSDw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=FMyWg6ddnbEnihaKqR+PVimg45DMkmlJtlbRUr6+knynhOzluGJGde0GNWFT10fe3
	KGOhmEWrGx5RNI1AvK92SBJj5aIzpVA2UQBXrmKLrSvOScNbDgLFS4CYRY/mLPgupv
	5QvyB1k0zIMg5kv9hVkpJibk2iEsNxsSSNOuz6DA=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBJKeaKE026765
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 19 Dec 2018 14:40:36 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 19 Dec 2018 14:40:36 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 19 Dec 2018 14:40:36 -0600
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBJKeZmU020008
	for <meta-arago@arago-project.org>; Wed, 19 Dec 2018 14:40:36 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 19 Dec 2018 15:40:30 -0500
Message-ID: <1545252032-64526-2-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1545252032-64526-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1545252032-64526-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][meta-processor-sdk][PATCH 1/3] board-rtos: Correcting the commit id corresponding to 01.00.10.03A
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
X-List-Received-Date: Wed, 19 Dec 2018 20:40:49 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/board-rtos/board-rtos_git.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/board-rtos/board-rtos_git.bbappend b/recipes-bsp/board-rtos/board-rtos_git.bbappend
index 15e093d..f6c2182 100644
--- a/recipes-bsp/board-rtos/board-rtos_git.bbappend
+++ b/recipes-bsp/board-rtos/board-rtos_git.bbappend
@@ -1,5 +1,5 @@
 # Below commit ID corresponds to "DEV.BOARD.01.00.10.03A"
-BOARD_SRCREV = "ad6c58a9026e8ae91d438d07883fc07a7e80186d"
+BOARD_SRCREV = "11c30b5acac3ff61757981a382d7da5c514cd3ff"
 
 PV = "01.00.10.03A"
-PR = "r0"
+PR = "r1"
-- 
1.9.1


