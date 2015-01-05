Return-Path: <a0866934local@udb0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 41E6252978
	for <meta-arago@arago-project.org>;
	Mon,  5 Jan 2015 15:51:04 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t05Fp3B9001995
	for <meta-arago@arago-project.org>; Mon, 5 Jan 2015 09:51:03 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t05Fp2sO026470
	for <meta-arago@arago-project.org>; Mon, 5 Jan 2015 09:51:03 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 5 Jan 2015 09:51:02 -0600
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t05Fp28N009112;
	Mon, 5 Jan 2015 09:51:02 -0600
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1Y89vq-0004GL-FD;
	Mon, 05 Jan 2015 10:51:02 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 5 Jan 2015 10:51:00 -0500
Message-ID: <1420473061-16355-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [tisdk-build-scripts][PATCH v2 1/2] config-build-env, package-sdks: Add support to export the downloads to web.
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
X-List-Received-Date: Mon, 05 Jan 2015 15:51:06 -0000
Content-Type: text/plain

* This can be enabled by setting "EXPORT_ARAGO_SRC" in the config file.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 lib/oesdk/config-build-env |    8 ++++++++
 lib/oesdk/package-sdks     |   12 ++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/lib/oesdk/config-build-env b/lib/oesdk/config-build-env
index cace93f..4412987 100644
--- a/lib/oesdk/config-build-env
+++ b/lib/oesdk/config-build-env
@@ -79,5 +79,13 @@ config_build_dir() {
       echo "SOURCE_MIRROR_URL = \"$SOURCE_MIRROR_URL\"" >> local.conf
       echo "INHERIT += \"own-mirrors\"" >> local.conf
     fi
+
+    if [ "$EXPORT_ARAGO_SRC" == "1" ]; then
+      BB_GENERATE_MIRROR_TARBALLS=1
+    fi
+
+    if [ ! -z "$BB_GENERATE_MIRROR_TARBALLS" ]; then
+      sed -i "s+^BB_GENERATE_MIRROR_TARBALLS =.*+BB_GENERATE_MIRROR_TARBALLS = \"$BB_GENERATE_MIRROR_TARBALLS\"+" local.conf
+    fi
     cd - > /dev/null 2>&1
 }
diff --git a/lib/oesdk/package-sdks b/lib/oesdk/package-sdks
index 9bfd887..31a44b6 100644
--- a/lib/oesdk/package-sdks
+++ b/lib/oesdk/package-sdks
@@ -268,6 +268,18 @@ package_web_content() {
 
     rm -rf board-support-bin
 
+    if [ "$EXPORT_ARAGO_SRC" == "1" ]
+    then
+        tar -C $DL_DIR -czf $exports_root/$m-sdk-arago-src-$TISDK_VERSION.tar.gz .
+
+        if [ "$?" != 0 ]
+        then
+            echo "Could not create arago source tarball"
+            echo "FAILED" > $LOG_DIR/$m-web-results.txt
+            return 1
+        fi
+    fi
+
     # Copy any additional web files that are in the WEB_EXTRAS_ROOT
     # directory.
     web_extras="$WEB_EXTRAS_ROOT/$m"
-- 
1.7.9.5


