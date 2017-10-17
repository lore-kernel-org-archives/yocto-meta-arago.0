Return-Path: <sam.nelson@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id ACA1152990
	for <meta-arago@arago-project.org>;
	Tue, 17 Oct 2017 03:19:16 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9H3JGNQ026995
	for <meta-arago@arago-project.org>; Mon, 16 Oct 2017 22:19:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1508210356;
	bh=fCD9mEBPnRcfRMCtgJWcAdmBr5mo3LB2pkkCHVWtj/E=;
	h=From:To:CC:Subject:Date;
	b=T+CHGL29c7FzsyH1hawK3Kn94F0gGbKJopzv8h6+bwCgsXL8wrDfrSLbi+sRUXnR6
	4eUS+Lfr2RAqPsUetAJjhnVtURM/nwNTpbq+0zLA2jLzD7NE2cmbhRut0e34dhfj1U
	yR5zm4ZOI+hG6xUX/6oHYxcwKGmrkXGTc9bspv0A=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9H3JGdK024148
	for <meta-arago@arago-project.org>; Mon, 16 Oct 2017 22:19:16 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 16 Oct 2017 22:19:16 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 16 Oct 2017 22:19:16 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9H3JFuT026954;
	Mon, 16 Oct 2017 22:19:16 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 16 Oct 2017 23:19:13 -0400
Message-ID: <1508210353-54801-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/master][PATCH] packagegroup-arago-tisdk-multimedia: TMP: Remove dspdce-fw temporarily
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
X-List-Received-Date: Tue, 17 Oct 2017 03:19:17 -0000
Content-Type: text/plain

Build with new bios version is broken. Need to be fixed.

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index 307deda..1c1e7d0 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -37,7 +37,7 @@ MULTIMEDIA_append_omap5-evm = " \
 ACCEL_FW = ""
 
 ACCEL_FW_append_am57xx-evm = " \
-    ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw dspdce-fw', '', d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw', '', d)} \
 "
 
 ACCEL_FW_append_omap5-evm = " \
@@ -45,7 +45,7 @@ ACCEL_FW_append_omap5-evm = " \
 "
 
 ACCEL_FW_append_dra7xx-evm = " \
-    ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw dspdce-fw', '', d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw', '', d)} \
     vis \
 "
 
-- 
1.9.1


