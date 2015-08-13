Return-Path: <jake@udc0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 35633529E1
	for <meta-arago@arago-project.org>;
	Thu, 13 Aug 2015 13:14:45 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7DDEhP8009418
	for <meta-arago@arago-project.org>; Thu, 13 Aug 2015 08:14:43 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7DDEg6a017414
	for <meta-arago@arago-project.org>; Thu, 13 Aug 2015 08:14:42 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 13 Aug 2015 08:14:42 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7DDEg5m011639;
	Thu, 13 Aug 2015 08:14:42 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1ZPsLB-0004Sv-TY; Thu, 13 Aug 2015 09:14:41 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 13 Aug 2015 09:14:40 -0400
Message-ID: <1439471680-17131-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [tisdk-build-scripts][PATCH] config-build-env: Enable appending arbitrary config to local.conf
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
X-List-Received-Date: Thu, 13 Aug 2015 13:14:46 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 lib/oesdk/config-build-env | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/oesdk/config-build-env b/lib/oesdk/config-build-env
index 4412987..928748c 100644
--- a/lib/oesdk/config-build-env
+++ b/lib/oesdk/config-build-env
@@ -87,5 +87,9 @@ config_build_dir() {
     if [ ! -z "$BB_GENERATE_MIRROR_TARBALLS" ]; then
       sed -i "s+^BB_GENERATE_MIRROR_TARBALLS =.*+BB_GENERATE_MIRROR_TARBALLS = \"$BB_GENERATE_MIRROR_TARBALLS\"+" local.conf
     fi
+
+    if [ ! -z "$LOCAL_CONF_APPEND" ]; then
+      cat "$LOCAL_CONF_APPEND" >> local.conf
+    fi
     cd - > /dev/null 2>&1
 }
-- 
1.9.1


