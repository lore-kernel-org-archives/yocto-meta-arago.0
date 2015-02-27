Return-Path: <a0850405@a0850405-off1>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 8D70052983
	for <meta-arago@arago-project.org>;
	Fri, 27 Feb 2015 20:55:44 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1RKthDT019763
	for <meta-arago@arago-project.org>; Fri, 27 Feb 2015 14:55:43 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1RKtgqS016563
	for <meta-arago@arago-project.org>; Fri, 27 Feb 2015 14:55:42 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 27 Feb 2015 14:55:42 -0600
Received: from a0850405-off1 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1RKtg9V019047;
	Fri, 27 Feb 2015 14:55:42 -0600
Received: from a0850405 by a0850405-off1 with local (Exim 4.82)	(envelope-from
	<a0850405@a0850405-off1>)	id 1YRRwk-00086i-0R;
	Fri, 27 Feb 2015 15:55:42 -0500
From: Carlos Hernandez <ceh@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 27 Feb 2015 15:55:13 -0500
Message-ID: <1425070513-31101-3-git-send-email-ceh@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1425070513-31101-1-git-send-email-ceh@ti.com>
References: <1425070513-31101-1-git-send-email-ceh@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] ltp-ddt: Add runtime dependency to serialcheck
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
X-List-Received-Date: Fri, 27 Feb 2015 20:55:44 -0000
Content-Type: text/plain

New uart tests on ltp-ddt depends on serialcheck utility, so add
serialcheck as runtime dependency to ltp-ddt.

Signed-off-by: Carlos Hernandez <ceh@ti.com>
---
 meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
index 43660ae..9afc2fc 100644
--- a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
+++ b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
@@ -1,6 +1,6 @@
 PR_append = "-arago10+gitr${SRCPV}"
 
-RDEPENDS_${PN} += "linaro-pm-qa-utils"
+RDEPENDS_${PN} += "linaro-pm-qa-utils serialcheck"
 
 SRC_URI_remove = "file://0001-KERNEL_INC-in-modern-kernel-should-point-at-toplevel.patch"
 
-- 
1.9.1


