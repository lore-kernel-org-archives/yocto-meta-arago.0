Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id E336D52A19
	for <meta-arago@arago-project.org>;
	Mon, 12 Oct 2015 17:56:03 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NW400L8ZCGVW970@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 12 Oct 2015 12:55:48 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=5lJygRwiOn0A:10 a=sozttTNsAAAA:8
	a=danhDmx_AAAA:8 a=KKAkSRfTAAAA:8	a=ESGmfnGfbX2v7qRlIx0A:9
	a=HCXXNV8pDlEA:10
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id D3EB7161C58;	Mon,
	12 Oct 2015 13:55:43 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 12 Oct 2015 13:55:43 -0400
Message-id: <1444672543-10595-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [tisdk-build-scripts][PATCH] publish-sdk-data/*/webgen.mak: update toolchain version and link
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
X-List-Received-Date: Mon, 12 Oct 2015 17:56:04 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 publish-sdk-data/coresdk/2015.01/am335x-evm/webgen.mak | 2 +-
 publish-sdk-data/coresdk/2015.01/am437x-evm/webgen.mak | 2 +-
 publish-sdk-data/coresdk/2015.01/am57xx-evm/webgen.mak | 2 +-
 publish-sdk-data/coresdk/2015.01/dra7xx-evm/webgen.mak | 2 +-
 publish-sdk-data/coresdk/2015.01/k2e-evm/webgen.mak    | 2 +-
 publish-sdk-data/coresdk/2015.01/k2hk-evm/webgen.mak   | 2 +-
 publish-sdk-data/coresdk/2015.01/k2l-evm/webgen.mak    | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/publish-sdk-data/coresdk/2015.01/am335x-evm/webgen.mak b/publish-sdk-data/coresdk/2015.01/am335x-evm/webgen.mak
index 32add44..1c81a9d 100644
--- a/publish-sdk-data/coresdk/2015.01/am335x-evm/webgen.mak
+++ b/publish-sdk-data/coresdk/2015.01/am335x-evm/webgen.mak
@@ -18,7 +18,7 @@ VERSION=2015.01
 	$(call add-selfcert-link,"CCS6.0.0.00190_linux.tar.gz",CCS6.0.0.00190_linux.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS bundle can be used for ARM debugging on OMAP devices as well.")
 	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sitara ARM README")
 	$(call add-divider,"AM335x SDK Individual Components \(all of the below compoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"https://launchpad.net/linaro-toolchain-binaries/trunk/2013.03/+download/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux.tar.bz2","Download Linaro Toolchain","Standalone Linaro Toolchain - Linaro GCC 4.7 2013.03 hard-float toolchain")
+	$(call add-http-link,"http://releases.linaro.org/15.05/components/toolchain/binaries/arm-linux-gnueabihf/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf.tar.xz","Download Linaro Toolchain","Standalone Linaro Toolchain - Linaro GCC 4.9 2015.05 hard-float toolchain")
 	$(call add-link,"am335x-evm-sdk-src-2015.01.tar.gz","am335x-evm-sdk-src-2015.01.tar.gz", "AM335x SDK PSP Source Code")
 	$(call add-link,"am335x-evm-sdk-bin-2015.01.tar.gz","am335x-evm-sdk-bin-2015.01.tar.gz", "AM335x SDK prebuilt PSP binaries and root filesystem")
 	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pinmuxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility")
diff --git a/publish-sdk-data/coresdk/2015.01/am437x-evm/webgen.mak b/publish-sdk-data/coresdk/2015.01/am437x-evm/webgen.mak
index 1fb4c85..8a28d69 100644
--- a/publish-sdk-data/coresdk/2015.01/am437x-evm/webgen.mak
+++ b/publish-sdk-data/coresdk/2015.01/am437x-evm/webgen.mak
@@ -18,7 +18,7 @@ VERSION=2015.01
 	$(call add-selfcert-link,"CCS6.0.0.00190_linux.tar.gz",CCS6.0.0.00190_linux.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS bundle can be used for ARM debugging on OMAP devices as well.")
 	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sitara ARM README")
 	$(call add-divider,"AM437x SDK Individual Components \(all of the below compoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"https://launchpad.net/linaro-toolchain-binaries/trunk/2013.03/+download/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux.tar.bz2","Download Linaro Toolchain","Standalone Linaro Toolchain - Linaro GCC 4.7 2013.03 hard-float toolchain")
+	$(call add-http-link,"http://releases.linaro.org/15.05/components/toolchain/binaries/arm-linux-gnueabihf/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf.tar.xz","Download Linaro Toolchain","Standalone Linaro Toolchain - Linaro GCC 4.9 2015.05 hard-float toolchain")
 	$(call add-link,"am437x-evm-sdk-src-2015.01.tar.gz","am437x-evm-sdk-src-2015.01.tar.gz", "AM437x SDK PSP Source Code")
 	$(call add-link,"am437x-evm-sdk-bin-2015.01.tar.gz","am437x-evm-sdk-bin-2015.01.tar.gz", "AM437x SDK prebuilt PSP binaries and root filesystem")
 	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pinmuxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility")
diff --git a/publish-sdk-data/coresdk/2015.01/am57xx-evm/webgen.mak b/publish-sdk-data/coresdk/2015.01/am57xx-evm/webgen.mak
index fee29e8..5890635 100644
--- a/publish-sdk-data/coresdk/2015.01/am57xx-evm/webgen.mak
+++ b/publish-sdk-data/coresdk/2015.01/am57xx-evm/webgen.mak
@@ -18,7 +18,7 @@ VERSION=2015.01
 	$(call add-selfcert-link,"CCS6.0.0.00190_linux.tar.gz",CCS6.0.0.00190_linux.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS bundle can be used for ARM debugging on OMAP devices as well.")
 	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sitara ARM README")
 	$(call add-divider,"AM57xx SDK Individual Components \(all of the below compoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"https://launchpad.net/linaro-toolchain-binaries/trunk/2013.03/+download/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux.tar.bz2","Download Linaro Toolchain","Standalone Linaro Toolchain - Linaro GCC 4.7 2013.03 hard-float toolchain")
+	$(call add-http-link,"http://releases.linaro.org/15.05/components/toolchain/binaries/arm-linux-gnueabihf/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf.tar.xz","Download Linaro Toolchain","Standalone Linaro Toolchain - Linaro GCC 4.9 2015.05 hard-float toolchain")
 	$(call add-link,"am57xx-evm-sdk-src-2015.01.tar.gz","am57xx-evm-sdk-src-2015.01.tar.gz", "AM57xx SDK PSP Source Code")
 	$(call add-link,"am57xx-evm-sdk-bin-2015.01.tar.gz","am57xx-evm-sdk-bin-2015.01.tar.gz", "AM57xx SDK prebuilt PSP binaries and root filesystem")
 	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pinmuxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility")
diff --git a/publish-sdk-data/coresdk/2015.01/dra7xx-evm/webgen.mak b/publish-sdk-data/coresdk/2015.01/dra7xx-evm/webgen.mak
index 139bfd8..abff62d 100644
--- a/publish-sdk-data/coresdk/2015.01/dra7xx-evm/webgen.mak
+++ b/publish-sdk-data/coresdk/2015.01/dra7xx-evm/webgen.mak
@@ -18,7 +18,7 @@ VERSION=2015.01
 	$(call add-selfcert-link,"CCS6.0.0.00190_linux.tar.gz",CCS6.0.0.00190_linux.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS bundle can be used for ARM debugging on OMAP devices as well.")
 	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sitara ARM README")
 	$(call add-divider,"DRA7xx SDK Individual Components \(all of the below compoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"https://launchpad.net/linaro-toolchain-binaries/trunk/2013.03/+download/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux.tar.bz2","Download Linaro Toolchain","Standalone Linaro Toolchain - Linaro GCC 4.7 2013.03 hard-float toolchain")
+	$(call add-http-link,"http://releases.linaro.org/15.05/components/toolchain/binaries/arm-linux-gnueabihf/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf.tar.xz","Download Linaro Toolchain","Standalone Linaro Toolchain - Linaro GCC 4.9 2015.05 hard-float toolchain")
 	$(call add-link,"dra7xx-evm-sdk-src-2015.01.tar.gz","dra7xx-evm-sdk-src-2015.01.tar.gz", "DRA7xx SDK PSP Source Code")
 	$(call add-link,"dra7xx-evm-sdk-bin-2015.01.tar.gz","dra7xx-evm-sdk-bin-2015.01.tar.gz", "DRA7xx SDK prebuilt PSP binaries and root filesystem")
 	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pinmuxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility")
diff --git a/publish-sdk-data/coresdk/2015.01/k2e-evm/webgen.mak b/publish-sdk-data/coresdk/2015.01/k2e-evm/webgen.mak
index b5b654b..ea6d769 100644
--- a/publish-sdk-data/coresdk/2015.01/k2e-evm/webgen.mak
+++ b/publish-sdk-data/coresdk/2015.01/k2e-evm/webgen.mak
@@ -18,7 +18,7 @@ VERSION=2015.01
 	$(call add-selfcert-link,"CCS6.0.0.00190_linux.tar.gz",CCS6.0.0.00190_linux.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS bundle can be used for ARM debugging on OMAP devices as well.")
 	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sitara ARM README")
 	$(call add-divider,"K2E SDK Individual Components \(all of the below compoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"https://launchpad.net/linaro-toolchain-binaries/trunk/2013.03/+download/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux.tar.bz2","Download Linaro Toolchain","Standalone Linaro Toolchain - Linaro GCC 4.7 2013.03 hard-float toolchain")
+	$(call add-http-link,"http://releases.linaro.org/15.05/components/toolchain/binaries/arm-linux-gnueabihf/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf.tar.xz","Download Linaro Toolchain","Standalone Linaro Toolchain - Linaro GCC 4.9 2015.05 hard-float toolchain")
 	$(call add-link,"k2e-evm-sdk-src-2015.01.tar.gz","k2e-evm-sdk-src-2015.01.tar.gz", "K2E SDK PSP Source Code")
 	$(call add-link,"k2e-evm-sdk-bin-2015.01.tar.gz","k2e-evm-sdk-bin-2015.01.tar.gz", "K2E SDK prebuilt PSP binaries and root filesystem")
 	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pinmuxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility")
diff --git a/publish-sdk-data/coresdk/2015.01/k2hk-evm/webgen.mak b/publish-sdk-data/coresdk/2015.01/k2hk-evm/webgen.mak
index bfd99d5..e7426c7 100644
--- a/publish-sdk-data/coresdk/2015.01/k2hk-evm/webgen.mak
+++ b/publish-sdk-data/coresdk/2015.01/k2hk-evm/webgen.mak
@@ -18,7 +18,7 @@ VERSION=2015.01
 	$(call add-selfcert-link,"CCS6.0.0.00190_linux.tar.gz",CCS6.0.0.00190_linux.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS bundle can be used for ARM debugging on OMAP devices as well.")
 	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sitara ARM README")
 	$(call add-divider,"K2HK SDK Individual Components \(all of the below compoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"https://launchpad.net/linaro-toolchain-binaries/trunk/2013.03/+download/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux.tar.bz2","Download Linaro Toolchain","Standalone Linaro Toolchain - Linaro GCC 4.7 2013.03 hard-float toolchain")
+	$(call add-http-link,"http://releases.linaro.org/15.05/components/toolchain/binaries/arm-linux-gnueabihf/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf.tar.xz","Download Linaro Toolchain","Standalone Linaro Toolchain - Linaro GCC 4.9 2015.05 hard-float toolchain")
 	$(call add-link,"k2hk-evm-sdk-src-2015.01.tar.gz","k2hk-evm-sdk-src-2015.01.tar.gz", "K2HK SDK PSP Source Code")
 	$(call add-link,"k2hk-evm-sdk-bin-2015.01.tar.gz","k2hk-evm-sdk-bin-2015.01.tar.gz", "K2HK SDK prebuilt PSP binaries and root filesystem")
 	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pinmuxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility")
diff --git a/publish-sdk-data/coresdk/2015.01/k2l-evm/webgen.mak b/publish-sdk-data/coresdk/2015.01/k2l-evm/webgen.mak
index 60dec06..1924f8d 100644
--- a/publish-sdk-data/coresdk/2015.01/k2l-evm/webgen.mak
+++ b/publish-sdk-data/coresdk/2015.01/k2l-evm/webgen.mak
@@ -18,7 +18,7 @@ VERSION=2015.01
 	$(call add-selfcert-link,"CCS6.0.0.00190_linux.tar.gz",CCS6.0.0.00190_linux.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS bundle can be used for ARM debugging on OMAP devices as well.")
 	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sitara ARM README")
 	$(call add-divider,"K2L SDK Individual Components \(all of the below compoonents are bundled within the SDK installer\)")
-	$(call add-http-link,"https://launchpad.net/linaro-toolchain-binaries/trunk/2013.03/+download/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux.tar.bz2","Download Linaro Toolchain","Standalone Linaro Toolchain - Linaro GCC 4.7 2013.03 hard-float toolchain")
+	$(call add-http-link,"http://releases.linaro.org/15.05/components/toolchain/binaries/arm-linux-gnueabihf/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf.tar.xz","Download Linaro Toolchain","Standalone Linaro Toolchain - Linaro GCC 4.9 2015.05 hard-float toolchain")
 	$(call add-link,"k2l-evm-sdk-src-2015.01.tar.gz","k2l-evm-sdk-src-2015.01.tar.gz", "K2L SDK PSP Source Code")
 	$(call add-link,"k2l-evm-sdk-bin-2015.01.tar.gz","k2l-evm-sdk-bin-2015.01.tar.gz", "K2L SDK prebuilt PSP binaries and root filesystem")
 	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pinmuxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility")
-- 
2.2.0


