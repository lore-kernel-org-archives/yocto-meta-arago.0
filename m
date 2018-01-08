Return-Path: <h-gou@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 680FE529BB
	for <meta-arago@arago-project.org>;
	Mon,  8 Jan 2018 23:34:01 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w08NXtEE017869
	for <meta-arago@arago-project.org>; Mon, 8 Jan 2018 17:33:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1515454435;
	bh=CB7wfsqc9TLPd/Nq0ohtdltOvd+91kTqQc2453corrw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=CAoAOMlNHQNep3ZulJTtFLI7zyAeysQw15tIVzxyj07HVIN06Yit8SIOfyP2G2xgU
	MInyB2fIVADKaUZZ8l9p/3GSWYY8JUjCLnTo5P/5OL9tciZaVKxEup4yHr4gt9T/Hs
	2MvOc3KBCsOrOxkT6sIcr494m0ydIQ1dL+Kts68Y=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w08NXt6t004785
	for <meta-arago@arago-project.org>; Mon, 8 Jan 2018 17:33:55 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 8 Jan 2018 17:33:54 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 8 Jan 2018 17:33:54 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w08NXrh7019194;
	Mon, 8 Jan 2018 17:33:54 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 8 Jan 2018 18:33:30 -0500
Message-ID: <1515454420-19972-3-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1515454420-19972-1-git-send-email-a0271529@ti.com>
References: <1515454420-19972-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 02/12] board-rtos: upstreamed to meta-ti
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
X-List-Received-Date: Mon, 08 Jan 2018 23:34:02 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-bsp/board-rtos/board-rtos_git.bbappend | 7 -------
 1 file changed, 7 deletions(-)
 delete mode 100644 recipes-bsp/board-rtos/board-rtos_git.bbappend

diff --git a/recipes-bsp/board-rtos/board-rtos_git.bbappend b/recipes-bsp/board-rtos/board-rtos_git.bbappend
deleted file mode 100644
index aefef8d..0000000
--- a/recipes-bsp/board-rtos/board-rtos_git.bbappend
+++ /dev/null
@@ -1,7 +0,0 @@
-COMPATIBLE_MACHINE_append = "|c66x"
-
-# Below commit ID corresponds to "DEV.BOARD.01.00.09.00A"
-BOARD_SRCREV = "387d77aff6e36af54c239a315cb2d477f1466f4d"
-
-PV = "01.00.09.00A"
-PR = "r0"
-- 
1.9.1


