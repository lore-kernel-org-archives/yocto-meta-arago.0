Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 9054352979
	for <meta-arago@arago-project.org>;
	Mon, 29 Apr 2013 13:15:24 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3TDFNpL001499
	for <meta-arago@arago-project.org>; Mon, 29 Apr 2013 08:15:23 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3TDFNb1011432
	for <meta-arago@arago-project.org>; Mon, 29 Apr 2013 08:15:23 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 29 Apr 2013 08:15:23 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3TDFHJQ031838;
	Mon, 29 Apr 2013 08:15:21 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 29 Apr 2013 08:15:13 -0500
Message-ID: <1367241314-16498-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1367241314-16498-1-git-send-email-fcooper@ti.com>
References: <1367241314-16498-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/3] linux-am335x: Update variables for sourceipk
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
X-List-Received-Date: Mon, 29 Apr 2013 13:15:25 -0000
Content-Type: text/plain

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../linux/linux-am335x-psp_3.2.bbappend            |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-psp_3.2.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-am335x-psp_3.2.bbappend
index 3c02ca6..701666f 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-am335x-psp_3.2.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-psp_3.2.bbappend
@@ -1,6 +1,6 @@
-PR_append = "-arago3"
+PR_append = "-arago4"
 
 # KVER is used by arago-source-ipk.conf
-KVER = "${PV}"
+KVER = "3.2.0-psp04.06.00.10"
 
 require copy-defconfig.inc
-- 
1.7.0.4


