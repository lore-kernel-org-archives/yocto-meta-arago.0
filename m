Return-Path: <jake@udd0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id E9B9152999
	for <meta-arago@arago-project.org>;
	Tue, 27 Oct 2015 19:05:31 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9RJ5Vm1012148
	for <meta-arago@arago-project.org>; Tue, 27 Oct 2015 14:05:31 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9RJ5Var022337
	for <meta-arago@arago-project.org>; Tue, 27 Oct 2015 14:05:31 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 27 Oct 2015 14:05:31 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9RJ5U5E025777;
	Tue, 27 Oct 2015 14:05:31 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1Zr9Yo-0000xi-Qm; Tue, 27 Oct 2015 15:05:30 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 27 Oct 2015 15:05:22 -0400
Message-ID: <1445972723-3625-8-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1445972723-3625-1-git-send-email-j-stiffler@ti.com>
References: <1445972723-3625-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 7/8] ti-tisdk-makefile: Include opencl-example fragment for dra7xx
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
X-List-Received-Date: Tue, 27 Oct 2015 19:05:32 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb           | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index fcca764..3791bf2 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -40,7 +40,7 @@ SRC_URI = "\
     file://Makefile_opencl-examples \
 "
 
-PR = "r53"
+PR = "r54"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
@@ -87,6 +87,7 @@ MAKEFILES_append_ti43x = " u-boot-spl \
 MAKEFILES_append_dra7xx = " cryptodev \
                             debugss-module-drv \
                             gdbserverproxy-module-drv \
+                            opencl-examples \
 "
 
 MAKEFILES_append_omap-a15 = " u-boot-spl \
-- 
1.9.1


