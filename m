Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 968F1529B3
	for <meta-arago@arago-project.org>;
	Tue, 16 Dec 2014 17:11:10 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id sBGHB9W6006155
	for <meta-arago@arago-project.org>; Tue, 16 Dec 2014 11:11:09 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id sBGHB9Pp018986
	for <meta-arago@arago-project.org>; Tue, 16 Dec 2014 11:11:09 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 16 Dec 2014 11:11:09 -0600
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	sBGHB812018395;	Tue, 16 Dec 2014 11:11:09 -0600
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id sBGHB3Tm016985;	Tue, 16 Dec 2014 22:41:07 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 16 Dec 2014 11:11:02 -0600
Message-ID: <1418749862-2529-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1418749862-2529-1-git-send-email-fcooper@ti.com>
References: <1418749862-2529-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 3/3] ti-tisdk-makefile: Remove dual camera demo and make t-stat Qt 4 only
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
X-List-Received-Date: Tue, 16 Dec 2014 17:11:10 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* Dual camera demo does not currently work on the 3.14 kernel. So disable for
  now.
* T-stat needs to be tweaked to work again on Qt 5.4. Remove for now.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 0077223..e371307 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -36,7 +36,7 @@ SRC_URI = "\
     file://Makefile_cryptodev \
 "
 
-PR = "r35"
+PR = "r36"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
@@ -44,7 +44,7 @@ MAKEFILES_COMMON = "linux \
                     am-sysinfo \
                     matrix-gui-browser \
                     refresh-screen \
-                    qt-tstat \
+                    ${@base_conditional('QT_PROVIDER', 'qt5', '', 'qt-tstat', d)} \
                     oprofile-example \
 "
 MAKEFILES = ""
@@ -75,8 +75,6 @@ MAKEFILES_append_ti43x = " u-boot-spl \
                            ti-crypto-examples \
                            linux-dtbs \
                            wireless \
-                           dual-camera-demo \
-                           image-gallery \
                            cryptodev \
 "
 
-- 
1.7.9.5


