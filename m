Return-Path: <jake@udc0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id D973B52A68
	for <meta-arago@arago-project.org>;
	Thu, 13 Aug 2015 13:25:24 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7DDPMSN027626
	for <meta-arago@arago-project.org>; Thu, 13 Aug 2015 08:25:22 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7DDPM0u005664
	for <meta-arago@arago-project.org>; Thu, 13 Aug 2015 08:25:22 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 13 Aug 2015 08:25:22 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7DDPMas024465;
	Thu, 13 Aug 2015 08:25:22 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1ZPsVW-0004XP-0l; Thu, 13 Aug 2015 09:25:22 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 13 Aug 2015 09:25:17 -0400
Message-ID: <1439472317-17399-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1439472317-17399-1-git-send-email-j-stiffler@ti.com>
References: <1439472317-17399-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [tisdk-build-scripts][PATCH 2/2] configs: Update for change in webgen.mak path.
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

* Assumption that TISDK_VERSION is part of the path has been removed,
  so add inside configs.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 configs/amsdk/amsdk-config-05.06.00.00.txt      | 4 ++--
 configs/amsdk/amsdk-config-05.07.00.00.txt      | 4 ++--
 configs/amsdk/amsdk-config-06.00.00.00.txt      | 4 ++--
 configs/amsdk/amsdk-config-07.00.00.00.txt      | 4 ++--
 configs/amsdk/amsdk-config-07.01.00.00.txt      | 4 ++--
 configs/amsdk/amsdk-config-08.00.00.00.txt      | 4 ++--
 configs/arago-core-tisdk-daisy-puget.txt        | 4 ++--
 configs/arago-core-tisdk-danny-puget.txt        | 4 ++--
 configs/arago-core-tisdk-dora-puget.txt         | 4 ++--
 configs/arago-core-tisdk-dylan-puget.txt        | 4 ++--
 configs/arago-core-tisdk-fido-puget.txt         | 4 ++--
 configs/coresdk/arago-core-amsdk-2013.04.01.txt | 4 ++--
 configs/coresdk/arago-core-tisdk-2013.04.00.txt | 4 ++--
 configs/coresdk/arago-core-tisdk-2013.04.01.txt | 4 ++--
 configs/coresdk/arago-core-tisdk-2013.04.02.txt | 4 ++--
 configs/coresdk/arago-core-tisdk-2013.10.00.txt | 4 ++--
 configs/coresdk/arago-core-tisdk-2013.12.00.txt | 4 ++--
 configs/coresdk/arago-core-tisdk-2013.12.01.txt | 4 ++--
 configs/coresdk/arago-core-tisdk-2014.08.00.txt | 4 ++--
 configs/coresdk/arago-core-tisdk-2014.10.01.txt | 4 ++--
 configs/coresdk/arago-core-tisdk-2014.10.02.txt | 4 ++--
 configs/distroless-meta-ti-puget.txt            | 4 ++--
 22 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/configs/amsdk/amsdk-config-05.06.00.00.txt b/configs/amsdk/amsdk-config-05.06.00.00.txt
index 5f2c879..7c6016b 100644
--- a/configs/amsdk/amsdk-config-05.06.00.00.txt
+++ b/configs/amsdk/amsdk-config-05.06.00.00.txt
@@ -258,8 +258,8 @@ WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
 # stored.  This data is the webgen.mak files required to build the SDK
 # ti.com style web pages.
 # The general assumption is that the directory structure looks like:
-#   - WEBGEN_MAK_ROOT/$TISDK_VERSION/<machine>/webgen.mak
-WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/amsdk"
+#   - WEBGEN_MAK_ROOT/<machine>/webgen.mak
+WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/amsdk/$TISDK_VERSION"
 
 # This variable enables the source downloads in "DL_DIR" to be tar'd and copied
 # to the webgen exports directory. Setting this variable to "1" will override
diff --git a/configs/amsdk/amsdk-config-05.07.00.00.txt b/configs/amsdk/amsdk-config-05.07.00.00.txt
index 3057689..37b6754 100644
--- a/configs/amsdk/amsdk-config-05.07.00.00.txt
+++ b/configs/amsdk/amsdk-config-05.07.00.00.txt
@@ -273,8 +273,8 @@ WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
 # stored.  This data is the webgen.mak files required to build the SDK
 # ti.com style web pages.
 # The general assumption is that the directory structure looks like:
-#   - WEBGEN_MAK_ROOT/$TISDK_VERSION/<machine>/webgen.mak
-WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/amsdk"
+#   - WEBGEN_MAK_ROOT/<machine>/webgen.mak
+WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/amsdk/$TISDK_VERSION"
 
 # This variable enables the source downloads in "DL_DIR" to be tar'd and copied
 # to the webgen exports directory. Setting this variable to "1" will override
diff --git a/configs/amsdk/amsdk-config-06.00.00.00.txt b/configs/amsdk/amsdk-config-06.00.00.00.txt
index 5854f25..fd53df1 100644
--- a/configs/amsdk/amsdk-config-06.00.00.00.txt
+++ b/configs/amsdk/amsdk-config-06.00.00.00.txt
@@ -279,8 +279,8 @@ WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
 # stored.  This data is the webgen.mak files required to build the SDK
 # ti.com style web pages.
 # The general assumption is that the directory structure looks like:
-#   - WEBGEN_MAK_ROOT/$TISDK_VERSION/<machine>/webgen.mak
-WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/amsdk"
+#   - WEBGEN_MAK_ROOT/<machine>/webgen.mak
+WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/amsdk/$TISDK_VERSION"
 
 # This variable enables the source downloads in "DL_DIR" to be tar'd and copied
 # to the webgen exports directory. Setting this variable to "1" will override
diff --git a/configs/amsdk/amsdk-config-07.00.00.00.txt b/configs/amsdk/amsdk-config-07.00.00.00.txt
index 5c75d32..09f8731 100644
--- a/configs/amsdk/amsdk-config-07.00.00.00.txt
+++ b/configs/amsdk/amsdk-config-07.00.00.00.txt
@@ -279,8 +279,8 @@ WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
 # stored.  This data is the webgen.mak files required to build the SDK
 # ti.com style web pages.
 # The general assumption is that the directory structure looks like:
-#   - WEBGEN_MAK_ROOT/$TISDK_VERSION/<machine>/webgen.mak
-WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/amsdk"
+#   - WEBGEN_MAK_ROOT/<machine>/webgen.mak
+WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/amsdk/$TISDK_VERSION"
 
 # This variable enables the source downloads in "DL_DIR" to be tar'd and copied
 # to the webgen exports directory. Setting this variable to "1" will override
diff --git a/configs/amsdk/amsdk-config-07.01.00.00.txt b/configs/amsdk/amsdk-config-07.01.00.00.txt
index a2af353..d7b06a3 100644
--- a/configs/amsdk/amsdk-config-07.01.00.00.txt
+++ b/configs/amsdk/amsdk-config-07.01.00.00.txt
@@ -279,8 +279,8 @@ WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
 # stored.  This data is the webgen.mak files required to build the SDK
 # ti.com style web pages.
 # The general assumption is that the directory structure looks like:
-#   - WEBGEN_MAK_ROOT/$TISDK_VERSION/<machine>/webgen.mak
-WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/amsdk"
+#   - WEBGEN_MAK_ROOT/<machine>/webgen.mak
+WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/amsdk/$TISDK_VERSION"
 
 # This variable enables the source downloads in "DL_DIR" to be tar'd and copied
 # to the webgen exports directory. Setting this variable to "1" will override
diff --git a/configs/amsdk/amsdk-config-08.00.00.00.txt b/configs/amsdk/amsdk-config-08.00.00.00.txt
index 67e8857..74ad1d0 100644
--- a/configs/amsdk/amsdk-config-08.00.00.00.txt
+++ b/configs/amsdk/amsdk-config-08.00.00.00.txt
@@ -283,8 +283,8 @@ WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
 # stored.  This data is the webgen.mak files required to build the SDK
 # ti.com style web pages.
 # The general assumption is that the directory structure looks like:
-#   - WEBGEN_MAK_ROOT/$TISDK_VERSION/<machine>/webgen.mak
-WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/amsdk"
+#   - WEBGEN_MAK_ROOT/<machine>/webgen.mak
+WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/amsdk/$TISDK_VERSION"
 
 # This variable enables the source downloads in "DL_DIR" to be tar'd and copied
 # to the webgen exports directory. Setting this variable to "1" will override
diff --git a/configs/arago-core-tisdk-daisy-puget.txt b/configs/arago-core-tisdk-daisy-puget.txt
index 9730179..a0dd24a 100644
--- a/configs/arago-core-tisdk-daisy-puget.txt
+++ b/configs/arago-core-tisdk-daisy-puget.txt
@@ -293,8 +293,8 @@ WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
 # stored.  This data is the webgen.mak files required to build the SDK
 # ti.com style web pages.
 # The general assumption is that the directory structure looks like:
-#   - WEBGEN_MAK_ROOT/$TISDK_VERSION/<machine>/webgen.mak
-WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk"
+#   - WEBGEN_MAK_ROOT/<machine>/webgen.mak
+WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk/$TISDK_VERSION"
 
 # This variable enables the source downloads in "DL_DIR" to be tar'd and copied
 # to the webgen exports directory. Setting this variable to "1" will override
diff --git a/configs/arago-core-tisdk-danny-puget.txt b/configs/arago-core-tisdk-danny-puget.txt
index 73449e9..27dda0a 100644
--- a/configs/arago-core-tisdk-danny-puget.txt
+++ b/configs/arago-core-tisdk-danny-puget.txt
@@ -280,8 +280,8 @@ WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
 # stored.  This data is the webgen.mak files required to build the SDK
 # ti.com style web pages.
 # The general assumption is that the directory structure looks like:
-#   - WEBGEN_MAK_ROOT/$TISDK_VERSION/<machine>/webgen.mak
-WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk"
+#   - WEBGEN_MAK_ROOT/<machine>/webgen.mak
+WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk/$TISDK_VERSION"
 
 # This variable enables the source downloads in "DL_DIR" to be tar'd and copied
 # to the webgen exports directory. Setting this variable to "1" will override
diff --git a/configs/arago-core-tisdk-dora-puget.txt b/configs/arago-core-tisdk-dora-puget.txt
index 8d1c95c..14b84c2 100644
--- a/configs/arago-core-tisdk-dora-puget.txt
+++ b/configs/arago-core-tisdk-dora-puget.txt
@@ -280,8 +280,8 @@ WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
 # stored.  This data is the webgen.mak files required to build the SDK
 # ti.com style web pages.
 # The general assumption is that the directory structure looks like:
-#   - WEBGEN_MAK_ROOT/$TISDK_VERSION/<machine>/webgen.mak
-WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk"
+#   - WEBGEN_MAK_ROOT/<machine>/webgen.mak
+WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk/$TISDK_VERSION"
 
 # This variable enables the source downloads in "DL_DIR" to be tar'd and copied
 # to the webgen exports directory. Setting this variable to "1" will override
diff --git a/configs/arago-core-tisdk-dylan-puget.txt b/configs/arago-core-tisdk-dylan-puget.txt
index 4a3d1c9..d6dcdc0 100644
--- a/configs/arago-core-tisdk-dylan-puget.txt
+++ b/configs/arago-core-tisdk-dylan-puget.txt
@@ -280,8 +280,8 @@ WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
 # stored.  This data is the webgen.mak files required to build the SDK
 # ti.com style web pages.
 # The general assumption is that the directory structure looks like:
-#   - WEBGEN_MAK_ROOT/$TISDK_VERSION/<machine>/webgen.mak
-WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk"
+#   - WEBGEN_MAK_ROOT/<machine>/webgen.mak
+WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk/$TISDK_VERSION"
 
 # This variable enables the source downloads in "DL_DIR" to be tar'd and copied
 # to the webgen exports directory. Setting this variable to "1" will override
diff --git a/configs/arago-core-tisdk-fido-puget.txt b/configs/arago-core-tisdk-fido-puget.txt
index 380e6bf..8b315be 100644
--- a/configs/arago-core-tisdk-fido-puget.txt
+++ b/configs/arago-core-tisdk-fido-puget.txt
@@ -293,8 +293,8 @@ WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
 # stored.  This data is the webgen.mak files required to build the SDK
 # ti.com style web pages.
 # The general assumption is that the directory structure looks like:
-#   - WEBGEN_MAK_ROOT/$TISDK_VERSION/<machine>/webgen.mak
-WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk"
+#   - WEBGEN_MAK_ROOT/<machine>/webgen.mak
+WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk/$TISDK_VERSION"
 
 # This variable enables the source downloads in "DL_DIR" to be tar'd and copied
 # to the webgen exports directory. Setting this variable to "1" will override
diff --git a/configs/coresdk/arago-core-amsdk-2013.04.01.txt b/configs/coresdk/arago-core-amsdk-2013.04.01.txt
index 0203553..931698a 100644
--- a/configs/coresdk/arago-core-amsdk-2013.04.01.txt
+++ b/configs/coresdk/arago-core-amsdk-2013.04.01.txt
@@ -281,8 +281,8 @@ WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
 # stored.  This data is the webgen.mak files required to build the SDK
 # ti.com style web pages.
 # The general assumption is that the directory structure looks like:
-#   - WEBGEN_MAK_ROOT/$TISDK_VERSION/<machine>/webgen.mak
-WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/amsdk"
+#   - WEBGEN_MAK_ROOT/<machine>/webgen.mak
+WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/amsdk/$TISDK_VERSION"
 
 # This variable enables the source downloads in "DL_DIR" to be tar'd and copied
 # to the webgen exports directory. Setting this variable to "1" will override
diff --git a/configs/coresdk/arago-core-tisdk-2013.04.00.txt b/configs/coresdk/arago-core-tisdk-2013.04.00.txt
index 3435335..e73b80d 100644
--- a/configs/coresdk/arago-core-tisdk-2013.04.00.txt
+++ b/configs/coresdk/arago-core-tisdk-2013.04.00.txt
@@ -281,8 +281,8 @@ WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
 # stored.  This data is the webgen.mak files required to build the SDK
 # ti.com style web pages.
 # The general assumption is that the directory structure looks like:
-#   - WEBGEN_MAK_ROOT/$TISDK_VERSION/<machine>/webgen.mak
-WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk"
+#   - WEBGEN_MAK_ROOT/<machine>/webgen.mak
+WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk/$TISDK_VERSION"
 
 # This variable enables the source downloads in "DL_DIR" to be tar'd and copied
 # to the webgen exports directory. Setting this variable to "1" will override
diff --git a/configs/coresdk/arago-core-tisdk-2013.04.01.txt b/configs/coresdk/arago-core-tisdk-2013.04.01.txt
index b2b583b..bff39cb 100644
--- a/configs/coresdk/arago-core-tisdk-2013.04.01.txt
+++ b/configs/coresdk/arago-core-tisdk-2013.04.01.txt
@@ -281,8 +281,8 @@ WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
 # stored.  This data is the webgen.mak files required to build the SDK
 # ti.com style web pages.
 # The general assumption is that the directory structure looks like:
-#   - WEBGEN_MAK_ROOT/$TISDK_VERSION/<machine>/webgen.mak
-WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk"
+#   - WEBGEN_MAK_ROOT/<machine>/webgen.mak
+WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk/$TISDK_VERSION"
 
 # This variable enables the source downloads in "DL_DIR" to be tar'd and copied
 # to the webgen exports directory. Setting this variable to "1" will override
diff --git a/configs/coresdk/arago-core-tisdk-2013.04.02.txt b/configs/coresdk/arago-core-tisdk-2013.04.02.txt
index 8536021..889014c 100644
--- a/configs/coresdk/arago-core-tisdk-2013.04.02.txt
+++ b/configs/coresdk/arago-core-tisdk-2013.04.02.txt
@@ -281,8 +281,8 @@ WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
 # stored.  This data is the webgen.mak files required to build the SDK
 # ti.com style web pages.
 # The general assumption is that the directory structure looks like:
-#   - WEBGEN_MAK_ROOT/$TISDK_VERSION/<machine>/webgen.mak
-WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk"
+#   - WEBGEN_MAK_ROOT/<machine>/webgen.mak
+WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk/$TISDK_VERSION"
 
 # This variable enables the source downloads in "DL_DIR" to be tar'd and copied
 # to the webgen exports directory. Setting this variable to "1" will override
diff --git a/configs/coresdk/arago-core-tisdk-2013.10.00.txt b/configs/coresdk/arago-core-tisdk-2013.10.00.txt
index cb65f40..601c6a6 100644
--- a/configs/coresdk/arago-core-tisdk-2013.10.00.txt
+++ b/configs/coresdk/arago-core-tisdk-2013.10.00.txt
@@ -279,8 +279,8 @@ WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
 # stored.  This data is the webgen.mak files required to build the SDK
 # ti.com style web pages.
 # The general assumption is that the directory structure looks like:
-#   - WEBGEN_MAK_ROOT/$TISDK_VERSION/<machine>/webgen.mak
-WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk"
+#   - WEBGEN_MAK_ROOT/<machine>/webgen.mak
+WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk/$TISDK_VERSION"
 
 # This variable enables the source downloads in "DL_DIR" to be tar'd and copied
 # to the webgen exports directory. Setting this variable to "1" will override
diff --git a/configs/coresdk/arago-core-tisdk-2013.12.00.txt b/configs/coresdk/arago-core-tisdk-2013.12.00.txt
index b0bbff4..f85ad3d 100644
--- a/configs/coresdk/arago-core-tisdk-2013.12.00.txt
+++ b/configs/coresdk/arago-core-tisdk-2013.12.00.txt
@@ -279,8 +279,8 @@ WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
 # stored.  This data is the webgen.mak files required to build the SDK
 # ti.com style web pages.
 # The general assumption is that the directory structure looks like:
-#   - WEBGEN_MAK_ROOT/$TISDK_VERSION/<machine>/webgen.mak
-WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk"
+#   - WEBGEN_MAK_ROOT/<machine>/webgen.mak
+WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk/$TISDK_VERSION"
 
 # This variable enables the source downloads in "DL_DIR" to be tar'd and copied
 # to the webgen exports directory. Setting this variable to "1" will override
diff --git a/configs/coresdk/arago-core-tisdk-2013.12.01.txt b/configs/coresdk/arago-core-tisdk-2013.12.01.txt
index e9dff89..33549c4 100644
--- a/configs/coresdk/arago-core-tisdk-2013.12.01.txt
+++ b/configs/coresdk/arago-core-tisdk-2013.12.01.txt
@@ -279,8 +279,8 @@ WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
 # stored.  This data is the webgen.mak files required to build the SDK
 # ti.com style web pages.
 # The general assumption is that the directory structure looks like:
-#   - WEBGEN_MAK_ROOT/$TISDK_VERSION/<machine>/webgen.mak
-WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk"
+#   - WEBGEN_MAK_ROOT/<machine>/webgen.mak
+WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk/$TISDK_VERSION"
 
 # This variable enables the source downloads in "DL_DIR" to be tar'd and copied
 # to the webgen exports directory. Setting this variable to "1" will override
diff --git a/configs/coresdk/arago-core-tisdk-2014.08.00.txt b/configs/coresdk/arago-core-tisdk-2014.08.00.txt
index 8cefd0a..e9a4622 100644
--- a/configs/coresdk/arago-core-tisdk-2014.08.00.txt
+++ b/configs/coresdk/arago-core-tisdk-2014.08.00.txt
@@ -283,8 +283,8 @@ WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
 # stored.  This data is the webgen.mak files required to build the SDK
 # ti.com style web pages.
 # The general assumption is that the directory structure looks like:
-#   - WEBGEN_MAK_ROOT/$TISDK_VERSION/<machine>/webgen.mak
-WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk"
+#   - WEBGEN_MAK_ROOT/<machine>/webgen.mak
+WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk/$TISDK_VERSION"
 
 # This variable enables the source downloads in "DL_DIR" to be tar'd and copied
 # to the webgen exports directory. Setting this variable to "1" will override
diff --git a/configs/coresdk/arago-core-tisdk-2014.10.01.txt b/configs/coresdk/arago-core-tisdk-2014.10.01.txt
index fdef326..f181ca8 100644
--- a/configs/coresdk/arago-core-tisdk-2014.10.01.txt
+++ b/configs/coresdk/arago-core-tisdk-2014.10.01.txt
@@ -283,8 +283,8 @@ WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
 # stored.  This data is the webgen.mak files required to build the SDK
 # ti.com style web pages.
 # The general assumption is that the directory structure looks like:
-#   - WEBGEN_MAK_ROOT/$TISDK_VERSION/<machine>/webgen.mak
-WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk"
+#   - WEBGEN_MAK_ROOT/<machine>/webgen.mak
+WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk/$TISDK_VERSION"
 
 # This variable enables the source downloads in "DL_DIR" to be tar'd and copied
 # to the webgen exports directory. Setting this variable to "1" will override
diff --git a/configs/coresdk/arago-core-tisdk-2014.10.02.txt b/configs/coresdk/arago-core-tisdk-2014.10.02.txt
index f7d5187..d0b7e7e 100644
--- a/configs/coresdk/arago-core-tisdk-2014.10.02.txt
+++ b/configs/coresdk/arago-core-tisdk-2014.10.02.txt
@@ -286,8 +286,8 @@ WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
 # stored.  This data is the webgen.mak files required to build the SDK
 # ti.com style web pages.
 # The general assumption is that the directory structure looks like:
-#   - WEBGEN_MAK_ROOT/$TISDK_VERSION/<machine>/webgen.mak
-WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk"
+#   - WEBGEN_MAK_ROOT/<machine>/webgen.mak
+WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk/$TISDK_VERSION"
 
 # This variable enables the source downloads in "DL_DIR" to be tar'd and copied
 # to the webgen exports directory. Setting this variable to "1" will override
diff --git a/configs/distroless-meta-ti-puget.txt b/configs/distroless-meta-ti-puget.txt
index 3151eac..9406fd1 100644
--- a/configs/distroless-meta-ti-puget.txt
+++ b/configs/distroless-meta-ti-puget.txt
@@ -273,8 +273,8 @@ WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
 # stored.  This data is the webgen.mak files required to build the SDK
 # ti.com style web pages.
 # The general assumption is that the directory structure looks like:
-#   - WEBGEN_MAK_ROOT/$TISDK_VERSION/<machine>/webgen.mak
-WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data"
+#   - WEBGEN_MAK_ROOT/<machine>/webgen.mak
+WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/$TISDK_VERSION"
 
 # This variable enables the source downloads in "DL_DIR" to be tar'd and copied
 # to the webgen exports directory. Setting this variable to "1" will override
-- 
1.9.1


