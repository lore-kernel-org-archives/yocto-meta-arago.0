Return-Path: <anandb@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 968D252AA0
	for <meta-arago@arago-project.org>;
	Wed,  1 Jun 2016 12:54:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u51Csc37006975
	for <meta-arago@arago-project.org>; Wed, 1 Jun 2016 07:54:38 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u51CshLT009728
	for <meta-arago@arago-project.org>; Wed, 1 Jun 2016 07:54:43 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 1 Jun 2016 07:54:42 -0500
Received: from tigfxsrv.india.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u51CsfW7007229;	Wed, 1 Jun 2016 07:54:42 -0500
From: Anand Balagopalakrishnan <anandb@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 1 Jun 2016 18:24:35 +0530
Message-ID: <1464785675-23968-1-git-send-email-anandb@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 1/1] img-pvr-sdk: update srcrev, bump PR
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
X-List-Received-Date: Wed, 01 Jun 2016 12:54:44 -0000
Content-Type: text/plain

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
---
 .../img-pvr-sdk/img-pvr-sdk_3.3.2.bb               |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
index 49d5c3b..24f9dd0 100644
--- a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
+++ b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
@@ -7,9 +7,9 @@ CLEANBROKEN = "1"
 BRANCH = "master"
 
 SRC_URI = "git://git.ti.com/graphics/img-pvr-sdk.git;protocol=git;branch=${BRANCH}"
-SRCREV = "75e85fd928128b5acfcea675632acdea203dc318"
+SRCREV = "8d316e34dd949b01ea3cb6424c0a4f6dcd3925f2"
 
-PR = "r8"
+PR = "r9"
 
 COMPATIBLE_MACHINE = "omap-a15|ti43x|ti33x"
 
-- 
1.7.9.5


