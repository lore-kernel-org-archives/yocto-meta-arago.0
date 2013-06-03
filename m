Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 6E20D52AAD
	for <meta-arago@arago-project.org>;
	Mon,  3 Jun 2013 22:03:47 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r53M3kE3025907
	for <meta-arago@arago-project.org>; Mon, 3 Jun 2013 17:03:46 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r53M3kDP005432
	for <meta-arago@arago-project.org>; Mon, 3 Jun 2013 17:03:46 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 3 Jun 2013 17:03:45 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r53M3e9k028512;
	Mon, 3 Jun 2013 17:03:44 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 3 Jun 2013 17:09:18 -0500
Message-ID: <1370297358-14855-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1370297358-14855-1-git-send-email-Chase.Maupin@ti.com>
References: <1370297358-14855-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] kernel: pickup deploy directory fix
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
X-List-Received-Date: Mon, 03 Jun 2013 22:03:48 -0000
Content-Type: text/plain

* Add in the do_deploy fix to return to the base kernel directory.
  Without this the dtb file will not get copied into the deploy
  images directory and therefore not into the SDK.
* This is required because we overlay kernel.bbclass as this is
  resolved in oe-core and meta-openembedded.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 meta-arago-distro/classes/kernel.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/classes/kernel.bbclass b/meta-arago-distro/classes/kernel.bbclass
index 96f6cf5..09b6fa3 100644
--- a/meta-arago-distro/classes/kernel.bbclass
+++ b/meta-arago-distro/classes/kernel.bbclass
@@ -533,6 +533,7 @@ kernel_do_deploy() {
 	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGETYPE}
 
 	cp ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOYDIR}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
+    cd -
 }
 do_deploy[dirs] = "${DEPLOYDIR} ${B}"
 
-- 
1.7.0.4


