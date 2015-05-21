Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id 4EBA2529A7
	for <meta-arago@arago-project.org>;
	Thu, 21 May 2015 00:22:44 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NOO002BTBPCZSX0@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 20 May 2015 19:22:24 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Ap5ZB14n c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=h1PgugrvaO0A:10
	a=sozttTNsAAAA:8	a=5KuAjy_4lID-89N17PsA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 1C2C9200F0;	Wed,
	20 May 2015 20:22:24 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 20 May 2015 20:22:23 -0400
Message-id: <1432167743-19150-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1432167743-19150-1-git-send-email-denis@denix.org>
References: <1432167743-19150-1-git-send-email-denis@denix.org>
Subject: [tisdk-build-scripts][PATCH 2/2] build-oesdk: only clean TMPDIR on CLEAN_BUILD, add separate CLEAN_SSTATE
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
X-List-Received-Date: Thu, 21 May 2015 00:22:49 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 build-oesdk.sh                                  | 6 +++++-
 configs/arago-core-tisdk-daisy-puget.txt        | 3 +++
 configs/coresdk/arago-core-tisdk-2014.10.02.txt | 3 +++
 configs/distroless-meta-ti-puget.txt            | 3 +++
 4 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/build-oesdk.sh b/build-oesdk.sh
index 0eb5fec..1284a97 100755
--- a/build-oesdk.sh
+++ b/build-oesdk.sh
@@ -122,7 +122,11 @@ then
     rm -rf $BUILD_ROOT
 elif [ "$CLEAN_BUILD" == "true" ]
 then
-    rm -rf $BUILD_ROOT/build-*
+    rm -rf $BUILD_ROOT/build-*/arago-tmp-*
+fi
+if [ "$CLEAN_SSTATE" == "true" ]
+then
+    rm -rf $BUILD_ROOT/build-*/sstate-cache
 fi
 
 # Make the directory structure leading up to BUILD_ROOT.  BUILD_ROOT will
diff --git a/configs/arago-core-tisdk-daisy-puget.txt b/configs/arago-core-tisdk-daisy-puget.txt
index 5e6fd80..68fdd0b 100644
--- a/configs/arago-core-tisdk-daisy-puget.txt
+++ b/configs/arago-core-tisdk-daisy-puget.txt
@@ -110,6 +110,9 @@ SOURCE_DIR="${BUILD_ROOT}/sources"
 # Removing the build directories
 CLEAN_BUILD="false"
 
+# This variable indicates whether we should clean shared state (sstate)
+CLEAN_SSTATE="false"
+
 # This variable means that we should clean not only build build directories,
 # but also the sources as well and do a fully clean build.
 CLEAN_ALL="false"
diff --git a/configs/coresdk/arago-core-tisdk-2014.10.02.txt b/configs/coresdk/arago-core-tisdk-2014.10.02.txt
index 4458432..f7d5187 100644
--- a/configs/coresdk/arago-core-tisdk-2014.10.02.txt
+++ b/configs/coresdk/arago-core-tisdk-2014.10.02.txt
@@ -110,6 +110,9 @@ SOURCE_DIR="${BUILD_ROOT}/sources"
 # Removing the build directories
 CLEAN_BUILD="false"
 
+# This variable indicates whether we should clean shared state (sstate)
+CLEAN_SSTATE="false"
+
 # This variable means that we should clean not only build build directories,
 # but also the sources as well and do a fully clean build.
 CLEAN_ALL="false"
diff --git a/configs/distroless-meta-ti-puget.txt b/configs/distroless-meta-ti-puget.txt
index 71d156b..3151eac 100644
--- a/configs/distroless-meta-ti-puget.txt
+++ b/configs/distroless-meta-ti-puget.txt
@@ -96,6 +96,9 @@ SOURCE_DIR="${BUILD_ROOT}/sources"
 # Removing the build directories
 CLEAN_BUILD="false"
 
+# This variable indicates whether we should clean shared state (sstate)
+CLEAN_SSTATE="false"
+
 # This variable means that we should clean not only build build directories,
 # but also the sources as well and do a fully clean build.
 CLEAN_ALL="false"
-- 
2.2.0


