Return-Path: <sam.nelson@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 32550529D1
	for <meta-arago@arago-project.org>;
	Mon, 18 Sep 2017 20:38:44 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8IKcYmf027927
	for <meta-arago@arago-project.org>; Mon, 18 Sep 2017 15:38:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505767114;
	bh=5qON31RdmVk/fxoA/YVn9KpNypjNhikooUiifc5aS9E=;
	h=From:To:CC:Subject:Date;
	b=koe/cmOc0V5f0bGxptH/HFnpzf5NDpRkAXoo5W9QmaPY401SK1qGVqruszdw6Qr3n
	E2bZxfMvIrrEA0Mwf5aIPaoCojyEC+ARAolpLGXt4Wuxdfpa7HDiQQoKNtknJEow/c
	XKGOGDQcV2vVwo9ZIFO64KEkAnw83SYHwDn4WxmI=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8IKcTUd031554
	for <meta-arago@arago-project.org>; Mon, 18 Sep 2017 15:38:29 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 18 Sep 2017 15:38:28 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 18 Sep 2017 15:38:28 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8IKcS1l017925;
	Mon, 18 Sep 2017 15:38:28 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 18 Sep 2017 16:38:26 -0400
Message-ID: <1505767106-62511-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/master][PATCH] posix-smp-demo: Update to new version 01.00.01.07
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
X-List-Received-Date: Mon, 18 Sep 2017 20:38:44 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc b/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc
index ec46f43..b0abd2b 100644
--- a/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc
+++ b/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc
@@ -7,14 +7,14 @@ POSIX_SMP_GIT_URI = "git://git.ti.com/keystone-demos/posix-smp.git"
 POSIX_SMP_GIT_PROTOCOL = "git"
 POSIX_SMP_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.POSIX-SMP.01.00.00.01"
-POSIX_SMP_SRCREV = "ed013f29b8651d7fbc4aaf14a23c80880ee6a565"
+# Below commit ID corresponds to "DEV.POSIX-SMP.01.00.01.07"
+POSIX_SMP_SRCREV = "2614d4cbe9d83c8345e051c7f3767f86226398ea"
 
 BRANCH = "${POSIX_SMP_GIT_BRANCH}"
 SRC_URI = "${POSIX_SMP_GIT_URI};protocol=${POSIX_SMP_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${POSIX_SMP_SRCREV}"
-PV = "01.00.00.01"
-INC_PR = "r2"
+PV = "01.00.01.07"
+INC_PR = "r0"
 
 S = "${WORKDIR}/git"
-- 
1.9.1


