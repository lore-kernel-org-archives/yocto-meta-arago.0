Return-Path: <sam.nelson@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id E7120529D1
	for <meta-arago@arago-project.org>;
	Mon, 18 Sep 2017 20:45:40 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8IKjeZI013519
	for <meta-arago@arago-project.org>; Mon, 18 Sep 2017 15:45:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505767540;
	bh=BzkmeA2QxRryIIeb0qAuhxM14WRG9cFboI8Om9vCY44=;
	h=From:To:CC:Subject:Date;
	b=AmKKrviGNIBA0uOCT6EkB7TCWl8JQxLGYVwYd/LHnhRY3s8W53wO4YODeIQr6+e4z
	oUuRWW90Gc3hK2pnSVep/17059O1L3zb4TWvurSc8ZmClxvtS/EBahidt/dTp04wkI
	C0eR2sHgzvtaIPGlrIP5Ba7L4lDYCpLAziFg1Yfs=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8IKjelF011662
	for <meta-arago@arago-project.org>; Mon, 18 Sep 2017 15:45:40 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 18 Sep 2017 15:45:39 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 18 Sep 2017 15:45:39 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8IKjdO2015411;
	Mon, 18 Sep 2017 15:45:39 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 18 Sep 2017 16:45:37 -0400
Message-ID: <1505767537-63341-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH] posix-smp-demo: Update to new version 01.00.01.07
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
X-List-Received-Date: Mon, 18 Sep 2017 20:45:41 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Also sent to meta-arago
Needed also in meta-processor-sdk for upcoming release
---
---
 recipes-apps/posix-smp-demo/posix-smp-demo_git.bbappend | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 recipes-apps/posix-smp-demo/posix-smp-demo_git.bbappend

diff --git a/recipes-apps/posix-smp-demo/posix-smp-demo_git.bbappend b/recipes-apps/posix-smp-demo/posix-smp-demo_git.bbappend
new file mode 100644
index 0000000..30a77ab
--- /dev/null
+++ b/recipes-apps/posix-smp-demo/posix-smp-demo_git.bbappend
@@ -0,0 +1,6 @@
+PR_append = ".tisdk0"
+
+# Below commit ID corresponds to "DEV.POSIX-SMP.01.00.01.07"
+POSIX_SMP_SRCREV = "2614d4cbe9d83c8345e051c7f3767f86226398ea"
+
+PV = "01.00.01.07"
-- 
1.9.1


