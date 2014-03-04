Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 32BC052A77
	for <meta-arago@arago-project.org>;
	Tue,  4 Mar 2014 19:04:15 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s24J4ENl024603
	for <meta-arago@arago-project.org>; Tue, 4 Mar 2014 13:04:14 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s24J4EVB005598
	for <meta-arago@arago-project.org>; Tue, 4 Mar 2014 13:04:14 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 4 Mar 2014 13:04:14 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s24J4BjJ027270;
	Tue, 4 Mar 2014 13:04:12 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 4 Mar 2014 13:04:09 -0600
Message-ID: <1393959849-32619-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [dylan|ti2013.12.x][PATCH] Revert "arago-prefs: set PREFERRED VERSION of libdrm to latest"
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
X-List-Received-Date: Tue, 04 Mar 2014 19:04:15 -0000
Content-Type: text/plain

This reverts commit 8303758bc661f660a39b75e0ff7aa2a0ca6fea56.

libdrm v2.4.46 doesn't exist for the dylan (ti2013.12.x) maintenance branch
---
 .../conf/distro/include/arago-prefs.inc            |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 5f7b023..d5176fd 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -4,9 +4,6 @@ include conf/distro/include/qt5-versions.inc
 # Use the latest version of ltp-ddt for kernel versions 3.8+
 PREFERRED_PROVIDER_ltp-ddt = "ltp-ddt"
 
-# Use the latest version of libdrm
-PREFERRED_VERSION_libdrm = "2.4.46"
-
 PREFERRED_PROVIDER_virtual/gettext = "gettext"
 
 ARAGO_QT_PROVIDER = "${@base_contains('MACHINE_FEATURES','sgx','qt4-embedded-gles','qt4-embedded',d)}"
-- 
1.7.0.4


