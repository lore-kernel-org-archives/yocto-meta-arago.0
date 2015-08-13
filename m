Return-Path: <jake@udc0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id D96A652A19
	for <meta-arago@arago-project.org>;
	Thu, 13 Aug 2015 13:25:24 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7DDPM6R001188
	for <meta-arago@arago-project.org>; Thu, 13 Aug 2015 08:25:22 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7DDPLZV021411
	for <meta-arago@arago-project.org>; Thu, 13 Aug 2015 08:25:21 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 13 Aug 2015 08:25:21 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7DDPLDg018167;
	Thu, 13 Aug 2015 08:25:21 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1ZPsVU-0004XK-KI; Thu, 13 Aug 2015 09:25:20 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 13 Aug 2015 09:25:16 -0400
Message-ID: <1439472317-17399-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [tisdk-build-scripts][PATCH 1/2] package-sdks: Remove assumption of TISDK_VERSION from webgen.mak path
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
X-List-Received-Date: Thu, 13 Aug 2015 13:25:28 -0000
Content-Type: text/plain

* The same effect can be obtained though the config.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 lib/oesdk/package-sdks | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/oesdk/package-sdks b/lib/oesdk/package-sdks
index 31a44b6..498ee79 100644
--- a/lib/oesdk/package-sdks
+++ b/lib/oesdk/package-sdks
@@ -304,7 +304,7 @@ generate_webgen_page() {
     m="$1"
 
     
-    webgen_make="$WEBGEN_MAK_ROOT/$TISDK_VERSION/$m/webgen.mak"
+    webgen_make="$WEBGEN_MAK_ROOT/$m/webgen.mak"
 
     if [ ! -e $webgen_make ]
     then
-- 
1.9.1


