Return-Path: <j-stiffler@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id AC6055299F
	for <meta-arago@arago-project.org>;
	Wed, 29 Mar 2017 13:38:46 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2TDcaKX032250
	for <meta-arago@arago-project.org>; Wed, 29 Mar 2017 08:38:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1490794716;
	bh=xQONc57irvN5GWID0hsKwHl3ti/7XFJZOfY1bn10Xzw=;
	h=From:To:CC:Subject:Date;
	b=qHvvNapzwa57tmEAvcKqumYt8kkTXZ/wLns+tTK97NFkw7AqYQLibvRnjYmb9kDI7
	kWXBzdbjU3esrOo6XlIwmYH4jLdEBAkX6uhsXW2SBXr0gVweDuHGxt15DIo7aMNe61
	ZMMGXDZUi4Pfy16OW6TFJyO304FvMUVxEG+aIhzY=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2TDcVkT004126
	for <meta-arago@arago-project.org>; Wed, 29 Mar 2017 08:38:31 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 29 Mar 2017 08:38:30 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v2TDcUkD010719;	Wed, 29 Mar 2017 08:38:30 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 29 Mar 2017 09:36:15 -0400
Message-ID: <1490794575-27352-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [krogoth/morty/master][PATCH] ipsecmgr: bump SRCREV for bug fix
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
X-List-Received-Date: Wed, 29 Mar 2017 13:38:46 -0000
Content-Type: text/plain

* ipsecmgr_mod: do not set callback for offloaded requests

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc
index ae05db9..331f19c 100644
--- a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc
+++ b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc
@@ -2,5 +2,5 @@ LICENSE = "BSD-3-Clause"
 BRANCH="master"
 SRC_URI = "git://arago-project.org/git/projects/ipsecmgr.git;protocol=git;branch=${BRANCH}"
 
-SRCREV = "37d04f1103216f185eeaddc35d34320b2568d5de"
+SRCREV = "d3ebaa8c80346c8037b5e81c636ab26785ccefaf"
 PV     = "01.01.00.04+git${SRCPV}"
-- 
2.7.4


