Return-Path: <a0866934local@udb0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 859F352A78
	for <meta-arago@arago-project.org>;
	Thu,  4 Sep 2014 17:31:12 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s84HVBI2009006
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 12:31:11 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84HVBgc019156
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 12:31:11 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 4 Sep 2014 12:31:11 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84HVBgT005946;
	Thu, 4 Sep 2014 12:31:11 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1XPasI-0001vj-R7;
	Thu, 04 Sep 2014 13:31:10 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 4 Sep 2014 13:31:05 -0400
Message-ID: <1409851868-7389-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [tisdk-build-scripts][PATCH 1/4] config-build-env: Add support for adding a source mirror
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
X-List-Received-Date: Thu, 04 Sep 2014 17:31:12 -0000
Content-Type: text/plain

* Source mirrors may be used by setting the SOURCE_MIRROR_URL parameter in the
  configuration file.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 lib/oesdk/config-build-env |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/oesdk/config-build-env b/lib/oesdk/config-build-env
index 655a7eb..cace93f 100644
--- a/lib/oesdk/config-build-env
+++ b/lib/oesdk/config-build-env
@@ -74,5 +74,10 @@ config_build_dir() {
     sed -i "s+^SSTATE_DIR =.*+STATE_DIR = \"$BUILD_ROOT/sstate-cache\"+" local.conf
     sed -i "s+^TMPDIR =.*+TMPDIR = \"$BUILD_ROOT/$build_dir/arago-tmp\"+" local.conf
     sed -i "s+^export BUILDDIR=.*+export BUILDDIR=\"$BUILD_ROOT/$build_dir\"+" setenv
+
+    if [ ! -z "$SOURCE_MIRROR_URL" ]; then
+      echo "SOURCE_MIRROR_URL = \"$SOURCE_MIRROR_URL\"" >> local.conf
+      echo "INHERIT += \"own-mirrors\"" >> local.conf
+    fi
     cd - > /dev/null 2>&1
 }
-- 
1.7.9.5


