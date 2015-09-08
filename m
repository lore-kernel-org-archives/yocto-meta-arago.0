Return-Path: <h-gou@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 55CED529BC
	for <meta-arago@arago-project.org>;
	Tue,  8 Sep 2015 14:21:16 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t88ELEYm010089
	for <meta-arago@arago-project.org>; Tue, 8 Sep 2015 09:21:14 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t88ELE22008672
	for <meta-arago@arago-project.org>; Tue, 8 Sep 2015 09:21:14 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 8 Sep 2015 09:21:08 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t88ELEFF006661;	Tue, 8 Sep 2015 09:21:14 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 8 Sep 2015 10:21:11 -0400
Message-ID: <1441722071-13351-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] img-pvr-sdk: Bump SRCREV
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
X-List-Received-Date: Tue, 08 Sep 2015 14:21:17 -0000
Content-Type: text/plain

* Use demo applications which are rebuilt with .so.* libs

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
index bc4ad9b..516ec6a 100644
--- a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
+++ b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
@@ -10,10 +10,10 @@ BRANCH_ti43x = "am4/k4.1"
 
 SRC_URI = "git://git.ti.com/graphics/img-pvr-sdk.git;protocol=git;branch=${BRANCH}"
 SRCREV_omap-a15 = "c2456ec3f03da022fb7489d6b381a4ac26a68203"
-SRCREV_ti33x = "f753b6c00168f9dd534c2b34206845d3cdddabe6"
-SRCREV_ti43x = "f753b6c00168f9dd534c2b34206845d3cdddabe6"
+SRCREV_ti33x = "c4df891d6842600a5affdc479269540099e20fda"
+SRCREV_ti43x = "c4df891d6842600a5affdc479269540099e20fda"
 
-PR = "r2"
+PR = "r3"
 
 COMPATIBLE_MACHINE = "dra7xx|ti43x|ti33x"
 
-- 
1.9.1


