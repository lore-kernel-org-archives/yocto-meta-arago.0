Return-Path: <e-ruei1@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 3DD3B52AD1
	for <meta-arago@arago-project.org>;
	Fri, 29 Sep 2017 18:23:36 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8TINaas007546
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506709416;
	bh=dAaweWN/xMdWr5HzTZ3yLDZokSFjGHuU8odF/y6P8yI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=lKmIAvK/mcnjiPCSX+Ic9Pr27NsyHvoK+NBwCLOgKAbPSIgLxze9DC+Ij+rLXckNG
	KzCbMQ4YFMwcnjTKXAMFbXqYF8HQIcLm4J4ccNr8nNf/Hy8HvtN4FB7WkLPfgenmHu
	NRjarBom9G1fBQC5xt3TacX1RcL4EtqBBDcy+kKc=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8TINaXC010425
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:36 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 29 Sep 2017 13:23:35 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 29 Sep 2017 13:23:35 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8TINW8d006890
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:35 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Sep 2017 14:23:18 -0400
Message-ID: <1506709407-16448-15-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1506709407-16448-1-git-send-email-e-ruei1@ti.com>
References: <1506709407-16448-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][morty-x11-experimental][PATCH 14/ matrix-gui-3d-demos: remove kmscube-based demos for X11 (xsgx) build
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
X-List-Received-Date: Fri, 29 Sep 2017 18:23:41 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-core/matrix/matrix-gui-3d-demos_2.0.bbappend | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 recipes-core/matrix/matrix-gui-3d-demos_2.0.bbappend

diff --git a/recipes-core/matrix/matrix-gui-3d-demos_2.0.bbappend b/recipes-core/matrix/matrix-gui-3d-demos_2.0.bbappend
new file mode 100644
index 0000000..90c89be
--- /dev/null
+++ b/recipes-core/matrix/matrix-gui-3d-demos_2.0.bbappend
@@ -0,0 +1,16 @@
+PR_append = ".tisdk0"
+
+SRCREV = "c6fe9957de117bc87c48a7d63205dfae923bb5b9"
+
+PACKAGES_remove_omap-a15 = " \
+            ${@bb.utils.contains("MACHINE_FEATURES", "xsgx", "matrix-3d-demo-kmscube", "", d)} \
+            ${@bb.utils.contains("MACHINE_FEATURES", "xsgx", "matrix-3d-demo-kmscubevideo", "", d)} \
+"
+
+PACKAGES_remove_ti43x = " \
+            ${@bb.utils.contains("MACHINE_FEATURES", "xsgx", "matrix-3d-demo-kmscube", "", d)} \
+"
+
+PACKAGES_remove_ti33x = " \
+            ${@bb.utils.contains("MACHINE_FEATURES", "xsgx", "matrix-3d-demo-kmscube", "", d)} \
+"
-- 
1.9.1


