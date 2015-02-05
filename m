Return-Path: <sam.nelson@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 60BA752A74
	for <meta-arago@arago-project.org>;
	Thu,  5 Feb 2015 19:36:35 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t15JaYNr003898
	for <meta-arago@arago-project.org>; Thu, 5 Feb 2015 13:36:34 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t15JaXjW016199
	for <meta-arago@arago-project.org>; Thu, 5 Feb 2015 13:36:33 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 5 Feb 2015 13:36:33 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t15JaWZo027492;	Thu, 5 Feb 2015 13:36:33 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 5 Feb 2015 14:36:31 -0500
Message-ID: <1423164991-19866-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] packagegroup-arago-console: Make Alsa packages depend on 'alsa' MACHINE_FEATURES
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
X-List-Received-Date: Thu, 05 Feb 2015 19:36:35 -0000
Content-Type: text/plain

- If MACHINE_FEATURES doesnot inlcude 'alsa', alsa related packages will be
  excluded

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../packagegroups/packagegroup-arago-console.bb    |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
index 8d322f5..a7b9f33 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
@@ -66,7 +66,7 @@ ARAGO_SDK_PREREQ = "\
     "
 
 ARAGO_CONSOLE = "\
-    ${ARAGO_ALSA_EXTRA} \
+    ${@base_contains('MACHINE_FEATURES', 'alsa', '${ARAGO_ALSA_EXTRA}', '',d)} \
     ${@base_conditional('QT_PROVIDER', 'qt5', '', '${ARAGO_TSLIB}', d)} \
     ${ARAGO_NCURSES} \
     ${ARAGO_FSTOOLS} \
-- 
1.7.9.5


