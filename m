Return-Path: <localcontrol@dntsab06real.emea.dhcp.ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 4595E52A81
	for <meta-arago@arago-project.org>;
	Wed,  9 Oct 2013 23:57:26 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r99NvPN6026340
	for <meta-arago@arago-project.org>; Wed, 9 Oct 2013 18:57:25 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r99NvPfV014635
	for <meta-arago@arago-project.org>; Wed, 9 Oct 2013 18:57:25 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 9 Oct 2013 18:57:25 -0500
Received: from dntsab06real.emea.dhcp.ti.com (dntsab06real.emea.dhcp.ti.com
	[137.167.84.131])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	r99NvOUB012068	for <meta-arago@arago-project.org>;
	Wed, 9 Oct 2013 18:57:24 -0500
Received: from dntsab06real.emea.dhcp.ti.com (localhost [127.0.0.1])	by
	dntsab06real.emea.dhcp.ti.com (8.14.4/8.14.4/Debian-2ubuntu2) with
	ESMTP id r9A0u7Jc013626	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 01:56:07 +0100
Received: (from localcontrol@localhost)	by dntsab06real.emea.dhcp.ti.com
	(8.14.4/8.14.4/Submit) id r9A0u7Bw013625	for
	meta-arago@arago-project.org; Thu, 10 Oct 2013 01:56:07 +0100
From: Roger Monk <r-monk@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 10 Oct 2013 01:55:59 +0100
Message-ID: <1381366559-13586-3-git-send-email-r-monk@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1381366559-13586-1-git-send-email-r-monk@ti.com>
References: <1381366559-13586-1-git-send-email-r-monk@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] ti-connectivity/compat_wl18xx_r8.a6.01: Update SRC_URI
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
X-List-Received-Date: Wed, 09 Oct 2013 23:57:27 -0000
Content-Type: text/plain

   * SRC_URI tag has changed (rebased?)
   * Update SRC_URI to match r8.a6.01 tag

Signed-off-by: Roger Monk <r-monk@ti.com>
---
 .../ti-compat-wireless-wl18xx_r8.a6.01.bb          |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a6.01.bb b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a6.01.bb
index 273c721..a69b7d6 100644
--- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a6.01.bb
+++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a6.01.bb
@@ -21,7 +21,7 @@ PR = "${MACHINE_KERNEL_PR}"
 PR_append = "c"
 
 # Tags: ol_r8.a6.01
-SRCREV_wl18xx = "1c0f45f0e8aec0823175f7ac977908888c424aa1"
+SRCREV_wl18xx = "f076cdad1988daf207ad560db2fe96caaa7c596e"
 SRCREV_compat = "c37c46c4ab5085ba50f650d15854404983b8d09b"
 SRCREV_compat-wireless = "3ec9ecca2cb07584e115ba53117f0084fc8faa25"
 
-- 
1.7.9.5


