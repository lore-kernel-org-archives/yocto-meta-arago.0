Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 231CA52990
	for <meta-arago@arago-project.org>;
	Tue,  2 Jul 2013 17:00:58 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r62H0uIq003328
	for <meta-arago@arago-project.org>; Tue, 2 Jul 2013 12:00:56 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r62H0u6W023748
	for <meta-arago@arago-project.org>; Tue, 2 Jul 2013 12:00:56 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 2 Jul 2013 12:00:56 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r62H0ooB021236;
	Tue, 2 Jul 2013 12:00:54 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 2 Jul 2013 12:15:50 -0500
Message-ID: <1372785354-1920-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1372785354-1920-1-git-send-email-fcooper@ti.com>
References: <1372785354-1920-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [master & danny][PATCH 2/6] linux-am335x-psp: Update to latest 3.2 release
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
X-List-Received-Date: Tue, 02 Jul 2013 17:00:59 -0000
Content-Type: text/plain

* Update to latest Linux kernel release that adds support for the PG 2.1 evms
  and 1 Ghz.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../linux/linux-am335x-psp_3.2.bbappend            |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-psp_3.2.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-am335x-psp_3.2.bbappend
index 701666f..b881190 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-am335x-psp_3.2.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-psp_3.2.bbappend
@@ -1,6 +1,6 @@
-PR_append = "-arago4"
+PR_append = "-arago5"
 
 # KVER is used by arago-source-ipk.conf
-KVER = "3.2.0-psp04.06.00.10"
+KVER = "3.2.0-psp04.06.00.11"
 
 require copy-defconfig.inc
-- 
1.7.0.4


