Return-Path: <sam.nelson@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id CE0A4529FC
	for <meta-arago@arago-project.org>;
	Thu, 22 Oct 2015 04:12:33 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9M4CX1o000581
	for <meta-arago@arago-project.org>; Wed, 21 Oct 2015 23:12:33 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9M4CXrS008911
	for <meta-arago@arago-project.org>; Wed, 21 Oct 2015 23:12:33 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 21 Oct 2015 23:12:33 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t9M4CWM4015891;	Wed, 21 Oct 2015 23:12:32 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Oct 2015 00:12:29 -0400
Message-ID: <1445487149-30279-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] ipsecmgr: Update to new version 1.1.0.4
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
X-List-Received-Date: Thu, 22 Oct 2015 04:12:34 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../recipes-support/ipsecmgr/ipsecmgr.inc          |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc
index 0844420..ac99c30 100644
--- a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc
+++ b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc
@@ -1,6 +1,6 @@
 LICENSE = "BSD-3-Clause"
 BRANCH="master"
 SRC_URI = "git://arago-project.org/git/projects/ipsecmgr.git;protocol=git;branch=${BRANCH}"
-#Commit ID corresponding to DEV.IPSECMGR.01.01.00.03
-SRCREV = "1ea8355ae9142311901c842c97a58d2846b308e6"
-PV     = "01.01.00.03+git${SRCPV}"
+#Commit ID corresponding to DEV.IPSECMGR.01.01.00.04
+SRCREV = "d28e0b78bf55a2e0af596bab697a448aa3343470"
+PV     = "01.01.00.04+git${SRCPV}"
-- 
1.7.9.5


