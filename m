Return-Path: <a0866934local@udb0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 7BDDC529DE
	for <meta-arago@arago-project.org>;
	Wed, 10 Dec 2014 14:30:04 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id sBAEU35T028433
	for <meta-arago@arago-project.org>; Wed, 10 Dec 2014 08:30:03 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id sBAEU3TI030803
	for <meta-arago@arago-project.org>; Wed, 10 Dec 2014 08:30:03 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 10 Dec 2014 08:30:01 -0600
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id sBAEU0X8015936;
	Wed, 10 Dec 2014 08:30:00 -0600
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1XyiHA-0002Qv-Ax;
	Wed, 10 Dec 2014 09:30:00 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 10 Dec 2014 09:29:58 -0500
Message-ID: <1418221798-9323-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [tisdk-build-scripts][PATCH] config-build-env, package-sdks: Add support to export the downloads to web.
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
X-List-Received-Date: Wed, 10 Dec 2014 14:30:04 -0000
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


