Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 0298752090
	for <meta-arago@arago-project.org>;
	Mon, 19 Jan 2015 22:00:55 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0JM0tdi029325
	for <meta-arago@arago-project.org>; Mon, 19 Jan 2015 16:00:55 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0JM0th8026880
	for <meta-arago@arago-project.org>; Mon, 19 Jan 2015 16:00:55 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 19 Jan 2015 16:00:54 -0600
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0JM0rpx004571;	Mon, 19 Jan 2015 16:00:54 -0600
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id t0JM0pQw002560;	Tue, 20 Jan 2015 03:30:52 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 Jan 2015 16:00:49 -0600
Message-ID: <1421704849-9661-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] arago-prefs: Use older versions of packages to remove additional GPLv3 licenses
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
X-List-Received-Date: Mon, 19 Jan 2015 22:00:56 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* Perf tool from the kernel was pulling in elfutils and m4 which by default have
  GPLv3 licenses.
* Set elfutils and m4 to an older version which uses a GPLv2 license.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../conf/distro/include/arago-prefs.inc            |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 94bb9da..3421a7d 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -111,6 +111,8 @@ PREFERRED_VERSION_crda = "1.1.3"
 PREFERRED_VERSION_obex = "0.34"
 PREFERRED_VERSION_bash = "3.2.48"
 PREFERRED_VERSION_gettext = "0.16.1"
+PREFERRED_VERSION_elfutils = "0.148"
+PREFERRED_VERSION_m4 = "1.4.9"
 
 PREFERRED_PROVIDER_wpa-supplicant = "wpa-supplicant"
 PREFERRED_PROVIDER_wpa-supplicant_ti33x = "wpa-supplicant-wl18xx"
-- 
1.7.9.5


