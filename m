Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 5BF6252AB2
	for <meta-arago@arago-project.org>;
	Wed,  4 Dec 2013 19:53:48 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rB4Jrife005253
	for <meta-arago@arago-project.org>; Wed, 4 Dec 2013 13:53:44 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB4JriC1005225
	for <meta-arago@arago-project.org>; Wed, 4 Dec 2013 13:53:44 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 4 Dec 2013 13:53:43 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB4Jre5S021694;
	Wed, 4 Dec 2013 13:53:42 -0600
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 4 Dec 2013 14:59:47 -0600
Message-ID: <1386190787-11630-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] ltp-ddt: add RDEPENDS for linaro-pm-qa-utils
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
X-List-Received-Date: Wed, 04 Dec 2013 19:53:49 -0000
Content-Type: text/plain

* The latest ltp-ddt sources have thermal test scripts that
  require the utils found in the linaro-pm-qa-utils package.
* Add an RDEPENDS to make sure those utilities will be in place.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../ltp-ddt/ltp-ddt_0.0.4.bbappend                 |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
index b9248f8..9fcc92f 100644
--- a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
+++ b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
@@ -1,4 +1,6 @@
-PR_append = "-arago2+gitr${SRCPV}"
+PR_append = "-arago3+gitr${SRCPV}"
+
+RDEPENDS_${PN} += "linaro-pm-qa-utils"
 
 # Auto rev so we pick up the latest changes
 SRCREV = "${AUTOREV}"
-- 
1.7.0.4


