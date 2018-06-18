Return-Path: <denys@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id D2C3A52987
	for <meta-arago@arago-project.org>;
	Mon, 18 Jun 2018 17:06:09 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w5IH63m8021012
	for <meta-arago@arago-project.org>; Mon, 18 Jun 2018 12:06:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1529341564;
	bh=R6Qj8QF6FR6dT/W4dvPAiBLrkiyV4MzwuDsuxr89RE8=;
	h=From:To:CC:Subject:Date;
	b=AL6Gxn8qtq4dZF+1ohU975YAOXWZAM418HRedIamIym9H5VbfYVrO2VISfMkSepnc
	8mm39IW4P8iIkBkja6l4sIXqGRTg4qoecUwMi52VLl0SfjmixTTlZhEB7hAI7NsUHj
	kUxuGYKc+gqyEIVqpWoqD7UQ3WS4ZaDJXclObWZ4=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5IH63Jb022478
	for <meta-arago@arago-project.org>; Mon, 18 Jun 2018 12:06:03 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 18 Jun 2018 12:06:03 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 18 Jun 2018 12:06:03 -0500
Received: from puget.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5IH63Tf001810;
	Mon, 18 Jun 2018 12:06:03 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 18 Jun 2018 17:05:24 +0000
Message-ID: <20180618170524.6398-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [tisdk-build-scripts][PATCH] build-oesdk, machine-specific-functions: support Aarch64 and am65xx-evm
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
X-List-Received-Date: Mon, 18 Jun 2018 17:06:10 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 build-oesdk.sh                       |  1 +
 lib/oesdk/machine-specific-functions | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/build-oesdk.sh b/build-oesdk.sh
index 8b9c604..038a7ab 100755
--- a/build-oesdk.sh
+++ b/build-oesdk.sh
@@ -165,6 +165,7 @@ parse_machines
 # lists that will be run through as parallel builds in the build process.
 create_build_lists "CORTEX"
 create_build_lists "ARM9"
+create_build_lists "AARCH64"
 
 # Go through the list of "lists" and configure the individual build
 # directories for each one
diff --git a/lib/oesdk/machine-specific-functions b/lib/oesdk/machine-specific-functions
index 166e891..50e2cf9 100644
--- a/lib/oesdk/machine-specific-functions
+++ b/lib/oesdk/machine-specific-functions
@@ -25,6 +25,10 @@ parse_machines() {
                 CORTEX_MACHINES="$CORTEX_MACHINES"" $m"
                 ARCHS="$ARCHS""\n""CORTEX"
                 ;;
+            am65xx-evm )
+                AARCH64_MACHINES="$AARCH64_MACHINES"" $m"
+                ARCHS="$ARCHS""\n""AARCH64"
+                ;;
             * )
                 log $error_log echo "Unknown machine ($m) specified"
                 exit 1
@@ -50,6 +54,12 @@ add_toolchain_to_path() {
                 export PATH="$TOOLCHAIN_ROOT_CORTEX:$PATH"
             fi
             ;;
+        AARCH64* )
+            if [ ! -z $TOOLCHAIN_ROOT_AARCH64 ]
+            then
+                export PATH="$TOOLCHAIN_ROOT_AARCH64:$PATH"
+            fi
+            ;;
         * )
             log $error_log echo "Unknown machine ($m) specified.  Cannot set PATH"
             exit 1
-- 
2.17.1


