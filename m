Return-Path: <sam.nelson@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 48A05529D1
	for <meta-arago@arago-project.org>;
	Mon, 18 Sep 2017 19:09:11 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8IJ9BT1030892
	for <meta-arago@arago-project.org>; Mon, 18 Sep 2017 14:09:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505761751;
	bh=TTEpbtCqQjwsAALYm534teMTnXQcblWWbdFHvXnw5d4=;
	h=From:To:CC:Subject:Date;
	b=b0UB5fm24klmmp2sTiUGAryXlQoo9FejeoXeHtCAq7CACT+Gix7fg4ychiLHnOtTF
	xEAKYDEmOMhwEduAN8uykwpUS3k0ihdbQy00Erqh+ocFY2+pXkDGe/Gt0bR153Jx9A
	XpgxuWND1zyLZjMyPUEuyFYNy76VC+ieOQjHSyuc=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8IJ9BAR003384
	for <meta-arago@arago-project.org>; Mon, 18 Sep 2017 14:09:11 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 18 Sep 2017 14:09:10 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 18 Sep 2017 14:09:10 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8IJ9AQH013005;
	Mon, 18 Sep 2017 14:09:10 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 18 Sep 2017 15:09:05 -0400
Message-ID: <1505761745-61153-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processsor-sdk PATCH] uio-module-drv: Update to new version 02.02.01.00
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
X-List-Received-Date: Mon, 18 Sep 2017 19:09:11 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Same update sent to meta-ti as well.
This is needed for the upcoming processor sdk release
---
---
 recipes-bsp/uio-module-drv/uio-module-drv-test_git.bbappend | 6 ++++++
 recipes-bsp/uio-module-drv/uio-module-drv_git.bbappend      | 6 ++++++
 2 files changed, 12 insertions(+)
 create mode 100644 recipes-bsp/uio-module-drv/uio-module-drv-test_git.bbappend
 create mode 100644 recipes-bsp/uio-module-drv/uio-module-drv_git.bbappend

diff --git a/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bbappend b/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bbappend
new file mode 100644
index 0000000..15fbc54
--- /dev/null
+++ b/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bbappend
@@ -0,0 +1,6 @@
+PR_append = ".tisdk0"
+
+# This corresponds to version 02.02.01.00
+UIO_MODULE_DRV_SRCREV = "bda9260f2220840a60ec0fbc8011cbadf3cf1b91"
+
+PV = "2.2.1.0+git${SRCPV}"
diff --git a/recipes-bsp/uio-module-drv/uio-module-drv_git.bbappend b/recipes-bsp/uio-module-drv/uio-module-drv_git.bbappend
new file mode 100644
index 0000000..15fbc54
--- /dev/null
+++ b/recipes-bsp/uio-module-drv/uio-module-drv_git.bbappend
@@ -0,0 +1,6 @@
+PR_append = ".tisdk0"
+
+# This corresponds to version 02.02.01.00
+UIO_MODULE_DRV_SRCREV = "bda9260f2220840a60ec0fbc8011cbadf3cf1b91"
+
+PV = "2.2.1.0+git${SRCPV}"
-- 
1.9.1


