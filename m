Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id E2DC852AA0
	for <meta-arago@arago-project.org>;
	Wed, 17 Jan 2018 23:53:20 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w0HNr45Y005392
	for <meta-arago@arago-project.org>; Wed, 17 Jan 2018 17:53:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1516233184;
	bh=9ZihyCA+PfnVaQ5MlQGVsAPMg1y+YO0xmEekNF7NJp0=;
	h=From:To:Subject:Date;
	b=mcgG+nH+ESkpUY/0rd9b1yFOS8leTNDcDv4wWgblfC70dyohxvdthfZCIe1bhCuXh
	yO3RQaqnW2N03vgOCg4iOuYX7L1JexgNFNlVuJU4BCcCRurzWGo0RuBesENTnYCphV
	NIQngPlBI8dHV5nscE1YUO+4T/rNL1knsCSxJ6B0=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0HNr4xn024857
	for <meta-arago@arago-project.org>; Wed, 17 Jan 2018 17:53:04 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 17 Jan 2018 17:53:03 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Wed, 17 Jan 2018 17:53:03 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0HNr2Gt031665
	for <meta-arago@arago-project.org>; Wed, 17 Jan 2018 17:53:03 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 17 Jan 2018 18:52:56 -0500
Message-ID: <1516233176-55078-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] board-rtos: Skipping for incompatible architectures
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
X-List-Received-Date: Wed, 17 Jan 2018 23:53:21 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/board-rtos/board-rtos_git.bbappend | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 recipes-bsp/board-rtos/board-rtos_git.bbappend

diff --git a/recipes-bsp/board-rtos/board-rtos_git.bbappend b/recipes-bsp/board-rtos/board-rtos_git.bbappend
new file mode 100644
index 0000000..0972f7c
--- /dev/null
+++ b/recipes-bsp/board-rtos/board-rtos_git.bbappend
@@ -0,0 +1,2 @@
+INSANE_SKIP_${PN} = "arch"
+
-- 
1.9.1


