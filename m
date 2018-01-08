Return-Path: <h-gou@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 4DCE4529AB
	for <meta-arago@arago-project.org>;
	Mon,  8 Jan 2018 23:34:01 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w08NXt03023910
	for <meta-arago@arago-project.org>; Mon, 8 Jan 2018 17:33:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1515454435;
	bh=BnIESOBgYhNsx27znsjmJz7GdtUfn/q2I1bUUpIZq9o=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=kRxGeoU9RIP+U2dGuRnQ1rXn8kmMssJ/R/u9FDbFVqRr93Oig8dwIiwuTKFxdOSxE
	Woqcc582NjHNZqCxipUZod1jP3zJ1D7uho/w6S7BBJFMcxAm2uNPq/HoiJoW6RHqee
	Hz16jnikiJ4AEd5F339Zey/c1vGHbOwLAJ4MfFJs=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w08NXsrh025879
	for <meta-arago@arago-project.org>; Mon, 8 Jan 2018 17:33:55 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 8 Jan 2018 17:33:54 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 8 Jan 2018 17:33:54 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w08NXrh6019194;
	Mon, 8 Jan 2018 17:33:54 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 8 Jan 2018 18:33:29 -0500
Message-ID: <1515454420-19972-2-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1515454420-19972-1-git-send-email-a0271529@ti.com>
References: <1515454420-19972-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 01/12] pruss-lld: upstreamed to meta-ti
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
 recipes-bsp/pruss-lld/pruss-lld-1.0.0.8.inc       | 5 -----
 recipes-bsp/pruss-lld/pruss-lld-rtos_git.bbappend | 1 -
 recipes-bsp/pruss-lld/pruss-lld-test_git.bbappend | 1 -
 recipes-bsp/pruss-lld/pruss-lld_git.bbappend      | 1 -
 4 files changed, 8 deletions(-)
 delete mode 100644 recipes-bsp/pruss-lld/pruss-lld-1.0.0.8.inc
 delete mode 100644 recipes-bsp/pruss-lld/pruss-lld-rtos_git.bbappend
 delete mode 100644 recipes-bsp/pruss-lld/pruss-lld-test_git.bbappend
 delete mode 100644 recipes-bsp/pruss-lld/pruss-lld_git.bbappend

diff --git a/recipes-bsp/pruss-lld/pruss-lld-1.0.0.8.inc b/recipes-bsp/pruss-lld/pruss-lld-1.0.0.8.inc
deleted file mode 100644
index 65e5dbf..0000000
--- a/recipes-bsp/pruss-lld/pruss-lld-1.0.0.8.inc
+++ /dev/null
@@ -1,5 +0,0 @@
-# Below commit ID corresponds to "DEV.PRUSS_LLD.01.00.00.08"
-PRUSS_LLD_SRCREV = "40d886b30f9b34bd86a76c6d7c04c37a9db7365b"
-
-PV = "01.00.00.08"
-INC_PR = "r0"
diff --git a/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bbappend b/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bbappend
deleted file mode 100644
index 13ca0ae..0000000
--- a/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-require recipes-bsp/pruss-lld/pruss-lld-1.0.0.8.inc
diff --git a/recipes-bsp/pruss-lld/pruss-lld-test_git.bbappend b/recipes-bsp/pruss-lld/pruss-lld-test_git.bbappend
deleted file mode 100644
index 13ca0ae..0000000
--- a/recipes-bsp/pruss-lld/pruss-lld-test_git.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-require recipes-bsp/pruss-lld/pruss-lld-1.0.0.8.inc
diff --git a/recipes-bsp/pruss-lld/pruss-lld_git.bbappend b/recipes-bsp/pruss-lld/pruss-lld_git.bbappend
deleted file mode 100644
index 13ca0ae..0000000
--- a/recipes-bsp/pruss-lld/pruss-lld_git.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-require recipes-bsp/pruss-lld/pruss-lld-1.0.0.8.inc
-- 
1.9.1


