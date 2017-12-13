Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 6343F5209B
	for <meta-arago@arago-project.org>;
	Wed, 13 Dec 2017 22:35:13 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBDMZC5r007123
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 16:35:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513204512;
	bh=AdSRx5drdbYTUq9bI5fDggT6Qaum18f26s1O0DR46S0=;
	h=From:To:Subject:Date;
	b=dop5cwsxsvj1aMBgE/WvwI2fr5bnKO5p1OlNByUB0/uNoza8BBxWzGIic3SPuKcp0
	beItAyBZpQKqyi04An+aAKI0Dl3+Ir9dk2j3vzZFFK8uldsacTAw/Lt8ltspY5ATlB
	ZSKOOn+32dHWfwNtWGjnj5cdui6xftFF1q0ZFAXk=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDMZCjP020959
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 16:35:12 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 13 Dec 2017 16:35:12 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 13 Dec 2017 16:35:12 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDMZCRa022239
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 16:35:12 -0600
From: Mahesh Radhakrsihnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 13 Dec 2017 17:35:11 -0500
Message-ID: <1513204511-25808-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH ] board-rtos: Updating to version 1.0.9.0A
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
X-List-Received-Date: Wed, 13 Dec 2017 22:35:13 -0000
Content-Type: text/plain

From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/board-rtos/board-rtos_git.bbappend | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 recipes-bsp/board-rtos/board-rtos_git.bbappend

diff --git a/recipes-bsp/board-rtos/board-rtos_git.bbappend b/recipes-bsp/board-rtos/board-rtos_git.bbappend
new file mode 100644
index 0000000..385b6ed
--- /dev/null
+++ b/recipes-bsp/board-rtos/board-rtos_git.bbappend
@@ -0,0 +1,8 @@
+COMPATIBLE_MACHINE_append = "|c66x"
+
+# Below commit ID corresponds to "DEV.BOARD.01.00.09.00A"
+BOARD_SRCREV = "387d77aff6e36af54c239a315cb2d477f1466f4d"
+
+PV = "01.00.09.00A"
+PR = "r0"
+
-- 
1.9.1


