Return-Path: <j-stiffler@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by arago-project.org (Postfix) with ESMTPS id E079F52A35
	for <meta-arago@arago-project.org>;
	Tue, 12 Jul 2016 18:56:11 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u6CIuBQZ001926
	for <meta-arago@arago-project.org>; Tue, 12 Jul 2016 13:56:11 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u6CIuBXW009234
	for <meta-arago@arago-project.org>; Tue, 12 Jul 2016 13:56:11 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 12 Jul 2016 13:56:11 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u6CIuB7V032420;	Tue, 12 Jul 2016 13:56:11 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 12 Jul 2016 14:55:31 -0400
Message-ID: <1468349733-14480-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/3] matrix-gui-browser: bump SRCREV
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
X-List-Received-Date: Tue, 12 Jul 2016 18:56:12 -0000
Content-Type: text/plain

* get enhancement for LinuxFB full-screen support

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
index 65c607f..0fa1a62 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
@@ -11,10 +11,10 @@ RDEPENDS_${PN} += "${QT_RDEPENDS_FONTS}"
 
 DEPENDS += "${QT_DEPENDS_WEBKIT}"
 
-PR = "r12"
+PR = "r13"
 
 QT4_SRCREV = "83019b46fb3dec1a12667d251d35ba8682953a79"
-QT5_SRCREV = "5ab1350db5892f1fec9995b53670f27977c69f8d"
+QT5_SRCREV = "78ad5db716d1abc4c05abfe435f066b6b88454d5"
 
 SRCREV = "${@base_conditional('QT_PROVIDER', 'qt5', "${QT5_SRCREV}", "${QT4_SRCREV}", d)}"
 BRANCH ?= "master"
-- 
2.7.4


