Return-Path: <sjmolfetta@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 3993A529F8
	for <meta-arago@arago-project.org>;
	Tue,  6 Mar 2018 14:25:28 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w26EOjNv011054
	for <meta-arago@arago-project.org>; Tue, 6 Mar 2018 08:24:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520346285;
	bh=U/f/m7FDv9mFnEUg6DAYatZuw27hTaTNFPU44KR9XTA=;
	h=From:To:CC:Subject:Date;
	b=YK8UMoVEoyXqWlKQhbHxvRLP2y5QIHcy1BG9iQcoh8ZUoWRTZVX+Bs0BhuMbKB/ph
	zHsbXqA1cwcuCgpN2szbgSsjaAE9z82zOv/Z0kFAdhheO2uetR1lvh0DW9tU8Xt9g6
	d75o1kAOMAm21cihwpKV4Su425pJlpPAPada40yw=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w26EOjON022930
	for <meta-arago@arago-project.org>; Tue, 6 Mar 2018 08:24:45 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 6 Mar 2018 08:24:45 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 6 Mar 2018 08:24:45 -0600
Received: from houapbldadm.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w26EOj6L011985;
	Tue, 6 Mar 2018 08:24:45 -0600
From: Stephen Molfetta <sjmolfetta@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 6 Mar 2018 08:24:44 -0600
Message-ID: <1520346284-2853-1-git-send-email-sjmolfetta@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][master][PATCH] dra7xx: updating board-rtos depends
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
X-List-Received-Date: Tue, 06 Mar 2018 14:25:29 -0000
Content-Type: text/plain

DRA7xx board changes have introduced dependencies on mmcsd-lld-rtos and
pm-lld-rtos.  Adding these modules to the dra7xx board depends list as
a staging change until the omap-15 depends are updated in meta-ti
---
 recipes-bsp/board-rtos/board-rtos_git.bbappend | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 recipes-bsp/board-rtos/board-rtos_git.bbappend

diff --git a/recipes-bsp/board-rtos/board-rtos_git.bbappend b/recipes-bsp/board-rtos/board-rtos_git.bbappend
new file mode 100644
index 0000000..e3ed986
--- /dev/null
+++ b/recipes-bsp/board-rtos/board-rtos_git.bbappend
@@ -0,0 +1,4 @@
+DEPENDS_append_dra7xx = " pm-lld-rtos \
+                          mmcsd-lld-rtos \
+"
+
-- 
2.7.4


