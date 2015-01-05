Return-Path: <a0866934local@udb0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 1EE5B529EB
	for <meta-arago@arago-project.org>;
	Mon,  5 Jan 2015 15:51:05 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t05Fp4nR026074
	for <meta-arago@arago-project.org>; Mon, 5 Jan 2015 09:51:04 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t05Fp3df010403
	for <meta-arago@arago-project.org>; Mon, 5 Jan 2015 09:51:04 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 5 Jan 2015 09:51:03 -0600
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t05Fp3YU009127;
	Mon, 5 Jan 2015 09:51:03 -0600
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1Y89vr-0004GO-Fp;
	Mon, 05 Jan 2015 10:51:03 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 5 Jan 2015 10:51:01 -0500
Message-ID: <1420473061-16355-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1420473061-16355-1-git-send-email-j-stiffler@ti.com>
References: <1420473061-16355-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [tisdk-build-scripts][PATCH v2 2/2] configs: Add BB_GENERATE_MIRROR_TARBALLS and EXPORT_ARAGO_SRC config params.
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

* By default, these are set to "0" (disabled)

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 configs/amsdk/amsdk-config-05.06.00.00.txt      |    9 +++++++++
 configs/amsdk/amsdk-config-05.07.00.00.txt      |    9 +++++++++
 configs/amsdk/amsdk-config-06.00.00.00.txt      |    9 +++++++++
 configs/amsdk/amsdk-config-07.00.00.00.txt      |    9 +++++++++
 configs/amsdk/amsdk-config-07.01.00.00.txt      |    9 +++++++++
 configs/amsdk/amsdk-config-08.00.00.00.txt      |    9 +++++++++
 configs/arago-core-tisdk-daisy-puget.txt        |    9 +++++++++
 configs/arago-core-tisdk-danny-puget.txt        |    9 +++++++++
 configs/arago-core-tisdk-dora-puget.txt         |    9 +++++++++
 configs/arago-core-tisdk-dylan-puget.txt        |    9 +++++++++
 configs/coresdk/arago-core-amsdk-2013.04.01.txt |    9 +++++++++
 configs/coresdk/arago-core-tisdk-2013.04.00.txt |    9 +++++++++
 configs/coresdk/arago-core-tisdk-2013.04.01.txt |    9 +++++++++
 configs/coresdk/arago-core-tisdk-2013.04.02.txt |    9 +++++++++
 configs/coresdk/arago-core-tisdk-2013.10.00.txt |    9 +++++++++
 configs/coresdk/arago-core-tisdk-2013.12.00.txt |    9 +++++++++
 configs/coresdk/arago-core-tisdk-2013.12.01.txt |    9 +++++++++
 configs/coresdk/arago-core-tisdk-2014.08.00.txt |    9 +++++++++
 configs/distroless-meta-ti-puget.txt            |    9 +++++++++
 19 files changed, 171 insertions(+)

diff --git a/configs/amsdk/amsdk-config-05.06.00.00.txt b/configs/amsdk/amsdk-config-05.06.00.00.txt
index ca4ac43..5f2c879 100644
--- a/configs/amsdk/amsdk-config-05.06.00.00.txt
+++ b/configs/amsdk/amsdk-config-05.06.00.00.txt
@@ -139,6 +139,10 @@ DL_DIR="/home/downloads"
 # obtain the build sources.
 #SOURCE_MIRROR_URL="http://some.web.server/arago-sources/"
 
+# Seeting this variable to "1" configures the build to generate mirror tarballs
+# of the source repos.
+BB_GENERATE_MIRROR_TARBALLS="0"
+
 # This variable points to an optional location where additional installer
 # content can be placed to be packaged inside of any image recipe that
 # inherits the tisdk-image class.  It is expected that the directory
@@ -257,6 +261,11 @@ WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
 #   - WEBGEN_MAK_ROOT/$TISDK_VERSION/<machine>/webgen.mak
 WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/amsdk"
 
+# This variable enables the source downloads in "DL_DIR" to be tar'd and copied
+# to the webgen exports directory. Setting this variable to "1" will override
+# the "BB_GENERATE_MIRROR_TARBALLS" configuration with a value of "1".
+EXPORT_ARAGO_SRC="0"
+
 # This variable specifies whether or not to copy the build contents to
 # a remote web hosting server.
 COPY_TO_WEB="true"
diff --git a/configs/amsdk/amsdk-config-05.07.00.00.txt b/configs/amsdk/amsdk-config-05.07.00.00.txt
index 5424320..3057689 100644
--- a/configs/amsdk/amsdk-config-05.07.00.00.txt
+++ b/configs/amsdk/amsdk-config-05.07.00.00.txt
@@ -139,6 +139,10 @@ DL_DIR="/home/downloads"
 # obtain the build sources.
 #SOURCE_MIRROR_URL="http://some.web.server/arago-sources/"
 
+# Seeting this variable to "1" configures the build to generate mirror tarballs
+# of the source repos.
+BB_GENERATE_MIRROR_TARBALLS="0"
+
 # This variable points to an optional location where additional installer
 # content can be placed to be packaged inside of any image recipe that
 # inherits the tisdk-image class.  It is expected that the directory
@@ -272,6 +276,11 @@ WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
 #   - WEBGEN_MAK_ROOT/$TISDK_VERSION/<machine>/webgen.mak
 WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/amsdk"
 
+# This variable enables the source downloads in "DL_DIR" to be tar'd and copied
+# to the webgen exports directory. Setting this variable to "1" will override
+# the "BB_GENERATE_MIRROR_TARBALLS" configuration with a value of "1".
+EXPORT_ARAGO_SRC="0"
+
 # This variable specifies whether or not to copy the build contents to
 # a remote web hosting server.
 COPY_TO_WEB="true"
diff --git a/configs/amsdk/amsdk-config-06.00.00.00.txt b/configs/amsdk/amsdk-config-06.00.00.00.txt
index 228761c..5854f25 100644
--- a/configs/amsdk/amsdk-config-06.00.00.00.txt
+++ b/configs/amsdk/amsdk-config-06.00.00.00.txt
@@ -139,6 +139,10 @@ DL_DIR="/home/downloads"
 # obtain the build sources.
 #SOURCE_MIRROR_URL="http://some.web.server/arago-sources/"
 
+# Seeting this variable to "1" configures the build to generate mirror tarballs
+# of the source repos.
+BB_GENERATE_MIRROR_TARBALLS="0"
+
 # This variable points to an optional location where additional installer
 # content can be placed to be packaged inside of any image recipe that
 # inherits the tisdk-image class.  It is expected that the directory
@@ -278,6 +282,11 @@ WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
 #   - WEBGEN_MAK_ROOT/$TISDK_VERSION/<machine>/webgen.mak
 WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/amsdk"
 
+# This variable enables the source downloads in "DL_DIR" to be tar'd and copied
+# to the webgen exports directory. Setting this variable to "1" will override
+# the "BB_GENERATE_MIRROR_TARBALLS" configuration with a value of "1".
+EXPORT_ARAGO_SRC="0"
+
 # This variable specifies whether or not to copy the build contents to
 # a remote web hosting server.
 COPY_TO_WEB="true"
diff --git a/configs/amsdk/amsdk-config-07.00.00.00.txt b/configs/amsdk/amsdk-config-07.00.00.00.txt
index d967cbb..5c75d32 100644
--- a/configs/amsdk/amsdk-config-07.00.00.00.txt
+++ b/configs/amsdk/amsdk-config-07.00.00.00.txt
@@ -139,6 +139,10 @@ DL_DIR="/home/downloads"
 # obtain the build sources.
 #SOURCE_MIRROR_URL="http://some.web.server/arago-sources/"
 
+# Seeting this variable to "1" configures the build to generate mirror tarballs
+# of the source repos.
+BB_GENERATE_MIRROR_TARBALLS="0"
+
 # This variable points to an optional location where additional installer
 # content can be placed to be packaged inside of any image recipe that
 # inherits the tisdk-image class.  It is expected that the directory
@@ -278,6 +282,11 @@ WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
 #   - WEBGEN_MAK_ROOT/$TISDK_VERSION/<machine>/webgen.mak
 WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/amsdk"
 
+# This variable enables the source downloads in "DL_DIR" to be tar'd and copied
+# to the webgen exports directory. Setting this variable to "1" will override
+# the "BB_GENERATE_MIRROR_TARBALLS" configuration with a value of "1".
+EXPORT_ARAGO_SRC="0"
+
 # This variable specifies whether or not to copy the build contents to
 # a remote web hosting server.
 COPY_TO_WEB="true"
diff --git a/configs/amsdk/amsdk-config-07.01.00.00.txt b/configs/amsdk/amsdk-config-07.01.00.00.txt
index 3e4774e..a2af353 100644
--- a/configs/amsdk/amsdk-config-07.01.00.00.txt
+++ b/configs/amsdk/amsdk-config-07.01.00.00.txt
@@ -139,6 +139,10 @@ DL_DIR="/home/downloads"
 # obtain the build sources.
 #SOURCE_MIRROR_URL="http://some.web.server/arago-sources/"
 
+# Seeting this variable to "1" configures the build to generate mirror tarballs
+# of the source repos.
+BB_GENERATE_MIRROR_TARBALLS="0"
+
 # This variable points to an optional location where additional installer
 # content can be placed to be packaged inside of any image recipe that
 # inherits the tisdk-image class.  It is expected that the directory
@@ -278,6 +282,11 @@ WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
 #   - WEBGEN_MAK_ROOT/$TISDK_VERSION/<machine>/webgen.mak
 WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/amsdk"
 
+# This variable enables the source downloads in "DL_DIR" to be tar'd and copied
+# to the webgen exports directory. Setting this variable to "1" will override
+# the "BB_GENERATE_MIRROR_TARBALLS" configuration with a value of "1".
+EXPORT_ARAGO_SRC="0"
+
 # This variable specifies whether or not to copy the build contents to
 # a remote web hosting server.
 COPY_TO_WEB="true"
diff --git a/configs/amsdk/amsdk-config-08.00.00.00.txt b/configs/amsdk/amsdk-config-08.00.00.00.txt
index 44d75c7..67e8857 100644
--- a/configs/amsdk/amsdk-config-08.00.00.00.txt
+++ b/configs/amsdk/amsdk-config-08.00.00.00.txt
@@ -139,6 +139,10 @@ DL_DIR="/home/downloads"
 # obtain the build sources.
 #SOURCE_MIRROR_URL="http://some.web.server/arago-sources/"
 
+# Seeting this variable to "1" configures the build to generate mirror tarballs
+# of the source repos.
+BB_GENERATE_MIRROR_TARBALLS="0"
+
 # This variable points to an optional location where additional installer
 # content can be placed to be packaged inside of any image recipe that
 # inherits the tisdk-image class.  It is expected that the directory
@@ -282,6 +286,11 @@ WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
 #   - WEBGEN_MAK_ROOT/$TISDK_VERSION/<machine>/webgen.mak
 WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/amsdk"
 
+# This variable enables the source downloads in "DL_DIR" to be tar'd and copied
+# to the webgen exports directory. Setting this variable to "1" will override
+# the "BB_GENERATE_MIRROR_TARBALLS" configuration with a value of "1".
+EXPORT_ARAGO_SRC="0"
+
 # This variable specifies whether or not to copy the build contents to
 # a remote web hosting server.
 COPY_TO_WEB="true"
diff --git a/configs/arago-core-tisdk-daisy-puget.txt b/configs/arago-core-tisdk-daisy-puget.txt
index 740f967..f595ed6 100644
--- a/configs/arago-core-tisdk-daisy-puget.txt
+++ b/configs/arago-core-tisdk-daisy-puget.txt
@@ -139,6 +139,10 @@ DL_DIR="/OE/downloads"
 # obtain the build sources.
 #SOURCE_MIRROR_URL="http://some.web.server/arago-sources/"
 
+# Seeting this variable to "1" configures the build to generate mirror tarballs
+# of the source repos.
+BB_GENERATE_MIRROR_TARBALLS="0"
+
 # This variable points to an optional location where additional installer
 # content can be placed to be packaged inside of any image recipe that
 # inherits the tisdk-image class.  It is expected that the directory
@@ -289,6 +293,11 @@ WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
 #   - WEBGEN_MAK_ROOT/$TISDK_VERSION/<machine>/webgen.mak
 WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk"
 
+# This variable enables the source downloads in "DL_DIR" to be tar'd and copied
+# to the webgen exports directory. Setting this variable to "1" will override
+# the "BB_GENERATE_MIRROR_TARBALLS" configuration with a value of "1".
+EXPORT_ARAGO_SRC="0"
+
 # This variable specifies whether or not to copy the build contents to
 # a remote web hosting server.
 COPY_TO_WEB="true"
diff --git a/configs/arago-core-tisdk-danny-puget.txt b/configs/arago-core-tisdk-danny-puget.txt
index 3480ea8..73449e9 100644
--- a/configs/arago-core-tisdk-danny-puget.txt
+++ b/configs/arago-core-tisdk-danny-puget.txt
@@ -139,6 +139,10 @@ DL_DIR="/OE/downloads"
 # obtain the build sources.
 #SOURCE_MIRROR_URL="http://some.web.server/arago-sources/"
 
+# Seeting this variable to "1" configures the build to generate mirror tarballs
+# of the source repos.
+BB_GENERATE_MIRROR_TARBALLS="0"
+
 # This variable points to an optional location where additional installer
 # content can be placed to be packaged inside of any image recipe that
 # inherits the tisdk-image class.  It is expected that the directory
@@ -279,6 +283,11 @@ WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
 #   - WEBGEN_MAK_ROOT/$TISDK_VERSION/<machine>/webgen.mak
 WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk"
 
+# This variable enables the source downloads in "DL_DIR" to be tar'd and copied
+# to the webgen exports directory. Setting this variable to "1" will override
+# the "BB_GENERATE_MIRROR_TARBALLS" configuration with a value of "1".
+EXPORT_ARAGO_SRC="0"
+
 # This variable specifies whether or not to copy the build contents to
 # a remote web hosting server.
 COPY_TO_WEB="true"
diff --git a/configs/arago-core-tisdk-dora-puget.txt b/configs/arago-core-tisdk-dora-puget.txt
index 591d8f2..8d1c95c 100644
--- a/configs/arago-core-tisdk-dora-puget.txt
+++ b/configs/arago-core-tisdk-dora-puget.txt
@@ -139,6 +139,10 @@ DL_DIR="/OE/downloads"
 # obtain the build sources.
 #SOURCE_MIRROR_URL="http://some.web.server/arago-sources/"
 
+# Seeting this variable to "1" configures the build to generate mirror tarballs
+# of the source repos.
+BB_GENERATE_MIRROR_TARBALLS="0"
+
 # This variable points to an optional location where additional installer
 # content can be placed to be packaged inside of any image recipe that
 # inherits the tisdk-image class.  It is expected that the directory
@@ -279,6 +283,11 @@ WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
 #   - WEBGEN_MAK_ROOT/$TISDK_VERSION/<machine>/webgen.mak
 WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk"
 
+# This variable enables the source downloads in "DL_DIR" to be tar'd and copied
+# to the webgen exports directory. Setting this variable to "1" will override
+# the "BB_GENERATE_MIRROR_TARBALLS" configuration with a value of "1".
+EXPORT_ARAGO_SRC="0"
+
 # This variable specifies whether or not to copy the build contents to
 # a remote web hosting server.
 COPY_TO_WEB="true"
diff --git a/configs/arago-core-tisdk-dylan-puget.txt b/configs/arago-core-tisdk-dylan-puget.txt
index 0fd8161..4a3d1c9 100644
--- a/configs/arago-core-tisdk-dylan-puget.txt
+++ b/configs/arago-core-tisdk-dylan-puget.txt
@@ -139,6 +139,10 @@ DL_DIR="/OE/downloads"
 # obtain the build sources.
 #SOURCE_MIRROR_URL="http://some.web.server/arago-sources/"
 
+# Seeting this variable to "1" configures the build to generate mirror tarballs
+# of the source repos.
+BB_GENERATE_MIRROR_TARBALLS="0"
+
 # This variable points to an optional location where additional installer
 # content can be placed to be packaged inside of any image recipe that
 # inherits the tisdk-image class.  It is expected that the directory
@@ -279,6 +283,11 @@ WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
 #   - WEBGEN_MAK_ROOT/$TISDK_VERSION/<machine>/webgen.mak
 WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk"
 
+# This variable enables the source downloads in "DL_DIR" to be tar'd and copied
+# to the webgen exports directory. Setting this variable to "1" will override
+# the "BB_GENERATE_MIRROR_TARBALLS" configuration with a value of "1".
+EXPORT_ARAGO_SRC="0"
+
 # This variable specifies whether or not to copy the build contents to
 # a remote web hosting server.
 COPY_TO_WEB="true"
diff --git a/configs/coresdk/arago-core-amsdk-2013.04.01.txt b/configs/coresdk/arago-core-amsdk-2013.04.01.txt
index d6cc83a..0203553 100644
--- a/configs/coresdk/arago-core-amsdk-2013.04.01.txt
+++ b/configs/coresdk/arago-core-amsdk-2013.04.01.txt
@@ -139,6 +139,10 @@ DL_DIR="/home/downloads"
 # obtain the build sources.
 #SOURCE_MIRROR_URL="http://some.web.server/arago-sources/"
 
+# Seeting this variable to "1" configures the build to generate mirror tarballs
+# of the source repos.
+BB_GENERATE_MIRROR_TARBALLS="0"
+
 # This variable points to an optional location where additional installer
 # content can be placed to be packaged inside of any image recipe that
 # inherits the tisdk-image class.  It is expected that the directory
@@ -280,6 +284,11 @@ WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
 #   - WEBGEN_MAK_ROOT/$TISDK_VERSION/<machine>/webgen.mak
 WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/amsdk"
 
+# This variable enables the source downloads in "DL_DIR" to be tar'd and copied
+# to the webgen exports directory. Setting this variable to "1" will override
+# the "BB_GENERATE_MIRROR_TARBALLS" configuration with a value of "1".
+EXPORT_ARAGO_SRC="0"
+
 # This variable specifies whether or not to copy the build contents to
 # a remote web hosting server.
 COPY_TO_WEB="true"
diff --git a/configs/coresdk/arago-core-tisdk-2013.04.00.txt b/configs/coresdk/arago-core-tisdk-2013.04.00.txt
index 158d388..3435335 100644
--- a/configs/coresdk/arago-core-tisdk-2013.04.00.txt
+++ b/configs/coresdk/arago-core-tisdk-2013.04.00.txt
@@ -139,6 +139,10 @@ DL_DIR="/home/downloads"
 # obtain the build sources.
 #SOURCE_MIRROR_URL="http://some.web.server/arago-sources/"
 
+# Seeting this variable to "1" configures the build to generate mirror tarballs
+# of the source repos.
+BB_GENERATE_MIRROR_TARBALLS="0"
+
 # This variable points to an optional location where additional installer
 # content can be placed to be packaged inside of any image recipe that
 # inherits the tisdk-image class.  It is expected that the directory
@@ -280,6 +284,11 @@ WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
 #   - WEBGEN_MAK_ROOT/$TISDK_VERSION/<machine>/webgen.mak
 WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk"
 
+# This variable enables the source downloads in "DL_DIR" to be tar'd and copied
+# to the webgen exports directory. Setting this variable to "1" will override
+# the "BB_GENERATE_MIRROR_TARBALLS" configuration with a value of "1".
+EXPORT_ARAGO_SRC="0"
+
 # This variable specifies whether or not to copy the build contents to
 # a remote web hosting server.
 COPY_TO_WEB="true"
diff --git a/configs/coresdk/arago-core-tisdk-2013.04.01.txt b/configs/coresdk/arago-core-tisdk-2013.04.01.txt
index 00e413f..b2b583b 100644
--- a/configs/coresdk/arago-core-tisdk-2013.04.01.txt
+++ b/configs/coresdk/arago-core-tisdk-2013.04.01.txt
@@ -139,6 +139,10 @@ DL_DIR="/home/downloads"
 # obtain the build sources.
 #SOURCE_MIRROR_URL="http://some.web.server/arago-sources/"
 
+# Seeting this variable to "1" configures the build to generate mirror tarballs
+# of the source repos.
+BB_GENERATE_MIRROR_TARBALLS="0"
+
 # This variable points to an optional location where additional installer
 # content can be placed to be packaged inside of any image recipe that
 # inherits the tisdk-image class.  It is expected that the directory
@@ -280,6 +284,11 @@ WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
 #   - WEBGEN_MAK_ROOT/$TISDK_VERSION/<machine>/webgen.mak
 WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk"
 
+# This variable enables the source downloads in "DL_DIR" to be tar'd and copied
+# to the webgen exports directory. Setting this variable to "1" will override
+# the "BB_GENERATE_MIRROR_TARBALLS" configuration with a value of "1".
+EXPORT_ARAGO_SRC="0"
+
 # This variable specifies whether or not to copy the build contents to
 # a remote web hosting server.
 COPY_TO_WEB="true"
diff --git a/configs/coresdk/arago-core-tisdk-2013.04.02.txt b/configs/coresdk/arago-core-tisdk-2013.04.02.txt
index 1054e7c..8536021 100644
--- a/configs/coresdk/arago-core-tisdk-2013.04.02.txt
+++ b/configs/coresdk/arago-core-tisdk-2013.04.02.txt
@@ -139,6 +139,10 @@ DL_DIR="/home/downloads"
 # obtain the build sources.
 #SOURCE_MIRROR_URL="http://some.web.server/arago-sources/"
 
+# Seeting this variable to "1" configures the build to generate mirror tarballs
+# of the source repos.
+BB_GENERATE_MIRROR_TARBALLS="0"
+
 # This variable points to an optional location where additional installer
 # content can be placed to be packaged inside of any image recipe that
 # inherits the tisdk-image class.  It is expected that the directory
@@ -280,6 +284,11 @@ WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
 #   - WEBGEN_MAK_ROOT/$TISDK_VERSION/<machine>/webgen.mak
 WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk"
 
+# This variable enables the source downloads in "DL_DIR" to be tar'd and copied
+# to the webgen exports directory. Setting this variable to "1" will override
+# the "BB_GENERATE_MIRROR_TARBALLS" configuration with a value of "1".
+EXPORT_ARAGO_SRC="0"
+
 # This variable specifies whether or not to copy the build contents to
 # a remote web hosting server.
 COPY_TO_WEB="true"
diff --git a/configs/coresdk/arago-core-tisdk-2013.10.00.txt b/configs/coresdk/arago-core-tisdk-2013.10.00.txt
index 1eb8397..cb65f40 100644
--- a/configs/coresdk/arago-core-tisdk-2013.10.00.txt
+++ b/configs/coresdk/arago-core-tisdk-2013.10.00.txt
@@ -139,6 +139,10 @@ DL_DIR="/home/downloads"
 # obtain the build sources.
 #SOURCE_MIRROR_URL="http://some.web.server/arago-sources/"
 
+# Seeting this variable to "1" configures the build to generate mirror tarballs
+# of the source repos.
+BB_GENERATE_MIRROR_TARBALLS="0"
+
 # This variable points to an optional location where additional installer
 # content can be placed to be packaged inside of any image recipe that
 # inherits the tisdk-image class.  It is expected that the directory
@@ -278,6 +282,11 @@ WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
 #   - WEBGEN_MAK_ROOT/$TISDK_VERSION/<machine>/webgen.mak
 WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk"
 
+# This variable enables the source downloads in "DL_DIR" to be tar'd and copied
+# to the webgen exports directory. Setting this variable to "1" will override
+# the "BB_GENERATE_MIRROR_TARBALLS" configuration with a value of "1".
+EXPORT_ARAGO_SRC="0"
+
 # This variable specifies whether or not to copy the build contents to
 # a remote web hosting server.
 COPY_TO_WEB="true"
diff --git a/configs/coresdk/arago-core-tisdk-2013.12.00.txt b/configs/coresdk/arago-core-tisdk-2013.12.00.txt
index 6a90b05..b0bbff4 100644
--- a/configs/coresdk/arago-core-tisdk-2013.12.00.txt
+++ b/configs/coresdk/arago-core-tisdk-2013.12.00.txt
@@ -139,6 +139,10 @@ DL_DIR="/home/downloads"
 # obtain the build sources.
 #SOURCE_MIRROR_URL="http://some.web.server/arago-sources/"
 
+# Seeting this variable to "1" configures the build to generate mirror tarballs
+# of the source repos.
+BB_GENERATE_MIRROR_TARBALLS="0"
+
 # This variable points to an optional location where additional installer
 # content can be placed to be packaged inside of any image recipe that
 # inherits the tisdk-image class.  It is expected that the directory
@@ -278,6 +282,11 @@ WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
 #   - WEBGEN_MAK_ROOT/$TISDK_VERSION/<machine>/webgen.mak
 WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk"
 
+# This variable enables the source downloads in "DL_DIR" to be tar'd and copied
+# to the webgen exports directory. Setting this variable to "1" will override
+# the "BB_GENERATE_MIRROR_TARBALLS" configuration with a value of "1".
+EXPORT_ARAGO_SRC="0"
+
 # This variable specifies whether or not to copy the build contents to
 # a remote web hosting server.
 COPY_TO_WEB="true"
diff --git a/configs/coresdk/arago-core-tisdk-2013.12.01.txt b/configs/coresdk/arago-core-tisdk-2013.12.01.txt
index 4118467..e9dff89 100644
--- a/configs/coresdk/arago-core-tisdk-2013.12.01.txt
+++ b/configs/coresdk/arago-core-tisdk-2013.12.01.txt
@@ -139,6 +139,10 @@ DL_DIR="/home/downloads"
 # obtain the build sources.
 #SOURCE_MIRROR_URL="http://some.web.server/arago-sources/"
 
+# Seeting this variable to "1" configures the build to generate mirror tarballs
+# of the source repos.
+BB_GENERATE_MIRROR_TARBALLS="0"
+
 # This variable points to an optional location where additional installer
 # content can be placed to be packaged inside of any image recipe that
 # inherits the tisdk-image class.  It is expected that the directory
@@ -278,6 +282,11 @@ WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
 #   - WEBGEN_MAK_ROOT/$TISDK_VERSION/<machine>/webgen.mak
 WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk"
 
+# This variable enables the source downloads in "DL_DIR" to be tar'd and copied
+# to the webgen exports directory. Setting this variable to "1" will override
+# the "BB_GENERATE_MIRROR_TARBALLS" configuration with a value of "1".
+EXPORT_ARAGO_SRC="0"
+
 # This variable specifies whether or not to copy the build contents to
 # a remote web hosting server.
 COPY_TO_WEB="true"
diff --git a/configs/coresdk/arago-core-tisdk-2014.08.00.txt b/configs/coresdk/arago-core-tisdk-2014.08.00.txt
index a5be245..8cefd0a 100644
--- a/configs/coresdk/arago-core-tisdk-2014.08.00.txt
+++ b/configs/coresdk/arago-core-tisdk-2014.08.00.txt
@@ -139,6 +139,10 @@ DL_DIR="/home/downloads"
 # obtain the build sources.
 #SOURCE_MIRROR_URL="http://some.web.server/arago-sources/"
 
+# Seeting this variable to "1" configures the build to generate mirror tarballs
+# of the source repos.
+BB_GENERATE_MIRROR_TARBALLS="0"
+
 # This variable points to an optional location where additional installer
 # content can be placed to be packaged inside of any image recipe that
 # inherits the tisdk-image class.  It is expected that the directory
@@ -282,6 +286,11 @@ WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
 #   - WEBGEN_MAK_ROOT/$TISDK_VERSION/<machine>/webgen.mak
 WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data/coresdk"
 
+# This variable enables the source downloads in "DL_DIR" to be tar'd and copied
+# to the webgen exports directory. Setting this variable to "1" will override
+# the "BB_GENERATE_MIRROR_TARBALLS" configuration with a value of "1".
+EXPORT_ARAGO_SRC="0"
+
 # This variable specifies whether or not to copy the build contents to
 # a remote web hosting server.
 COPY_TO_WEB="true"
diff --git a/configs/distroless-meta-ti-puget.txt b/configs/distroless-meta-ti-puget.txt
index a789850..71d156b 100644
--- a/configs/distroless-meta-ti-puget.txt
+++ b/configs/distroless-meta-ti-puget.txt
@@ -125,6 +125,10 @@ DL_DIR="/OE/downloads"
 # obtain the build sources.
 #SOURCE_MIRROR_URL="http://some.web.server/arago-sources/"
 
+# Seeting this variable to "1" configures the build to generate mirror tarballs
+# of the source repos.
+BB_GENERATE_MIRROR_TARBALLS="0"
+
 # This variable points to an optional location where additional installer
 # content can be placed to be packaged inside of any image recipe that
 # inherits the tisdk-image class.  It is expected that the directory
@@ -269,6 +273,11 @@ WEB_EXTRAS_ROOT="/home/jenkins/extra-files/web_content"
 #   - WEBGEN_MAK_ROOT/$TISDK_VERSION/<machine>/webgen.mak
 WEBGEN_MAK_ROOT="$SCRIPTS_ROOT/publish-sdk-data"
 
+# This variable enables the source downloads in "DL_DIR" to be tar'd and copied
+# to the webgen exports directory. Setting this variable to "1" will override
+# the "BB_GENERATE_MIRROR_TARBALLS" configuration with a value of "1".
+EXPORT_ARAGO_SRC="0"
+
 # This variable specifies whether or not to copy the build contents to
 # a remote web hosting server.
 COPY_TO_WEB="true"
-- 
1.7.9.5


