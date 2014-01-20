Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id C88E452986
	for <meta-arago@arago-project.org>;
	Mon, 20 Jan 2014 01:42:30 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.138.84])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MZO00A1MFE3AOF0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Sun, 19 Jan 2014 19:42:10 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 6149020088; Sun,
	19 Jan 2014 20:42:03 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sun, 19 Jan 2014 20:41:59 -0500
Message-id: <1390182119-17881-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [tisdk-build-scripts][PATCH] publish-sdk-data/2013.12.01: add webgen files for the next release
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
X-List-Received-Date: Mon, 20 Jan 2014 01:42:31 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 publish-sdk-data/2013.12.01/am335x-evm/webgen.mak |   29 +++++++++++++++++++++
 publish-sdk-data/2013.12.01/am437x-evm/webgen.mak |   29 +++++++++++++++++++++
 publish-sdk-data/2013.12.01/dra7xx-evm/webgen.mak |   29 +++++++++++++++++++++
 publish-sdk-data/2013.12.01/omap5-evm/webgen.mak  |   28 ++++++++++++++++++++
 4 files changed, 115 insertions(+)
 create mode 100644 publish-sdk-data/2013.12.01/am335x-evm/webgen.mak
 create mode 100644 publish-sdk-data/2013.12.01/am437x-evm/webgen.mak
 create mode 100644 publish-sdk-data/2013.12.01/dra7xx-evm/webgen.mak
 create mode 100644 publish-sdk-data/2013.12.01/omap5-evm/webgen.mak

diff --git a/publish-sdk-data/2013.12.01/am335x-evm/webgen.mak b/publish-sdk-data/2013.12.01/am335x-evm/webgen.mak
new file mode 100644
index 0000000..51e4396
--- /dev/null
+++ b/publish-sdk-data/2013.12.01/am335x-evm/webgen.mak
@@ -0,0 +1,29 @@
+PRODUCT_NAME=AM335xSDK
+PRODUCT_OR_COMPONENT=PRODUCT
+DESCRIPTION=AM335xSDK
+EMAIL=http://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/default.aspx
+FOLDER=http://www.ti.com/tool/linuxezsdk-sitara
+ 
+DOWNLOAD_TEXT=<br>This page contains the AM335x Core SDK from the LCPD team.  It is intended as a reference for INTERNAL use only and should not be distributed to customers.<br>
+
+VERSION=2013.12.01
+ 
+# un-comment for debug
+#MK_NOISY=1
+ 
+.prod_links:
+	$(call add-divider,"AM335x SDK Essentials")
+	$(call add-link,"ti-sdk-am335x-evm-2013.12.01-Linux-x86-Install.bin","ti-sdk-am335x-evm-2013.12.01-Linux-x86-Install.bin","AM335x EVM SDK")
+	$(call add-divider,"AM335x SDK Optional Addons")
+	$(call add-selfcert-link,"CCS-5.3.0.00090_Sitara-ARM.tar.gz",CCS-5.3.0.00090_Sitara-ARM.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS bundle can be used for ARM debugging on OMAP devices as well.")
+	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sitara ARM README")
+	$(call add-divider,"AM335x SDK Individual Components \(all of the below compoonents are bundled within the SDK installer\)")
+	$(call add-http-link,"https://launchpad.net/linaro-toolchain-binaries/trunk/2013.03/+download/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux.tar.bz2","Download Linaro Toolchain","Standalone Linaro Toolchain - Linaro GCC 4.7 2013.03 hard-float toolchain")
+	$(call add-link,"am335x-evm-sdk-src-2013.12.01.tar.gz","am335x-evm-sdk-src-2013.12.01.tar.gz", "AM335x SDK PSP Source Code")
+	$(call add-link,"am335x-evm-sdk-bin-2013.12.01.tar.gz","am335x-evm-sdk-bin-2013.12.01.tar.gz", "AM335x SDK prebuilt PSP binaries and root filesystem")
+	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pinmuxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility")
+	$(call add-divider,"AM335x SDK Documentation")
+	$(call add-link,"am335x-evm-qsg.pdf","am335x-evm-qsg.pdf","AM335x EVM Quick Start Guide")
+	$(call add-link,"software_manifest.htm","Software Manifest", "Software Manifest of Components Inside the SDK")
+	$(call add-divider,"AM335x SDK Checksums")
+	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/2013.12.01/am437x-evm/webgen.mak b/publish-sdk-data/2013.12.01/am437x-evm/webgen.mak
new file mode 100644
index 0000000..ac5d395
--- /dev/null
+++ b/publish-sdk-data/2013.12.01/am437x-evm/webgen.mak
@@ -0,0 +1,29 @@
+PRODUCT_NAME=AM437xSDK
+PRODUCT_OR_COMPONENT=PRODUCT
+DESCRIPTION=AM437xSDK
+EMAIL=http://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/default.aspx
+FOLDER=http://www.ti.com/tool/linuxezsdk-sitara
+ 
+DOWNLOAD_TEXT=<br>This page contains the AM437x Core SDK from the LCPD team.  It is intended as a reference for INTERNAL use only and should not be distributed to customers.<br>
+
+VERSION=2013.12.01
+ 
+# un-comment for debug
+#MK_NOISY=1
+ 
+.prod_links:
+	$(call add-divider,"AM437x SDK Essentials")
+	$(call add-link,"ti-sdk-am437x-evm-2013.12.01-Linux-x86-Install.bin","ti-sdk-am437x-evm-2013.12.01-Linux-x86-Install.bin","AM437x EVM SDK")
+	$(call add-divider,"AM437x SDK Optional Addons")
+	$(call add-selfcert-link,"CCS-5.3.0.00090_Sitara-ARM.tar.gz",CCS-5.3.0.00090_Sitara-ARM.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS bundle can be used for ARM debugging on OMAP devices as well.")
+	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sitara ARM README")
+	$(call add-divider,"AM437x SDK Individual Components \(all of the below compoonents are bundled within the SDK installer\)")
+	$(call add-http-link,"https://launchpad.net/linaro-toolchain-binaries/trunk/2013.03/+download/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux.tar.bz2","Download Linaro Toolchain","Standalone Linaro Toolchain - Linaro GCC 4.7 2013.03 hard-float toolchain")
+	$(call add-link,"am437x-evm-sdk-src-2013.12.01.tar.gz","am437x-evm-sdk-src-2013.12.01.tar.gz", "AM437x SDK PSP Source Code")
+	$(call add-link,"am437x-evm-sdk-bin-2013.12.01.tar.gz","am437x-evm-sdk-bin-2013.12.01.tar.gz", "AM437x SDK prebuilt PSP binaries and root filesystem")
+	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pinmuxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility")
+	$(call add-divider,"AM437x SDK Documentation")
+	$(call add-link,"am437x-evm-qsg.pdf","am437x-evm-qsg.pdf","AM437x EVM Quick Start Guide")
+	$(call add-link,"software_manifest.htm","Software Manifest", "Software Manifest of Components Inside the SDK")
+	$(call add-divider,"AM437x SDK Checksums")
+	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/2013.12.01/dra7xx-evm/webgen.mak b/publish-sdk-data/2013.12.01/dra7xx-evm/webgen.mak
new file mode 100644
index 0000000..90ee6ea
--- /dev/null
+++ b/publish-sdk-data/2013.12.01/dra7xx-evm/webgen.mak
@@ -0,0 +1,29 @@
+PRODUCT_NAME=DRA7xxSDK
+PRODUCT_OR_COMPONENT=PRODUCT
+DESCRIPTION=DRA7xxSDK
+EMAIL=http://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/default.aspx
+FOLDER=http://www.ti.com/tool/linuxezsdk-sitara
+ 
+DOWNLOAD_TEXT=<br>This page contains the DRA7xx Core SDK from the LCPD team.  It is intended as a reference for INTERNAL use only and should not be distributed to customers.<br>
+
+VERSION=2013.12.01
+ 
+# un-comment for debug
+#MK_NOISY=1
+ 
+.prod_links:
+	$(call add-divider,"DRA7xx SDK Essentials")
+	$(call add-link,"ti-sdk-dra7xx-evm-2013.12.01-Linux-x86-Install.bin","ti-sdk-dra7xx-evm-2013.12.01-Linux-x86-Install.bin","DRA7xx EVM SDK")
+	$(call add-divider,"DRA7xx SDK Optional Addons")
+	$(call add-selfcert-link,"CCS-5.3.0.00090_Sitara-ARM.tar.gz",CCS-5.3.0.00090_Sitara-ARM.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS bundle can be used for ARM debugging on OMAP devices as well.")
+	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sitara ARM README")
+	$(call add-divider,"DRA7xx SDK Individual Components \(all of the below compoonents are bundled within the SDK installer\)")
+	$(call add-http-link,"https://launchpad.net/linaro-toolchain-binaries/trunk/2013.03/+download/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux.tar.bz2","Download Linaro Toolchain","Standalone Linaro Toolchain - Linaro GCC 4.7 2013.03 hard-float toolchain")
+	$(call add-link,"dra7xx-evm-sdk-src-2013.12.01.tar.gz","dra7xx-evm-sdk-src-2013.12.01.tar.gz", "DRA7xx SDK PSP Source Code")
+	$(call add-link,"dra7xx-evm-sdk-bin-2013.12.01.tar.gz","dra7xx-evm-sdk-bin-2013.12.01.tar.gz", "DRA7xx SDK prebuilt PSP binaries and root filesystem")
+	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pinmuxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility")
+	$(call add-divider,"DRA7xx SDK Documentation")
+	$(call add-link,"dra7xx-evm-qsg.pdf","dra7xx-evm-qsg.pdf","DRA7xx EVM Quick Start Guide")
+	$(call add-link,"software_manifest.htm","Software Manifest", "Software Manifest of Components Inside the SDK")
+	$(call add-divider,"DRA7xx SDK Checksums")
+	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/2013.12.01/omap5-evm/webgen.mak b/publish-sdk-data/2013.12.01/omap5-evm/webgen.mak
new file mode 100644
index 0000000..d9898a4
--- /dev/null
+++ b/publish-sdk-data/2013.12.01/omap5-evm/webgen.mak
@@ -0,0 +1,28 @@
+PRODUCT_NAME=OMAP5SDK
+PRODUCT_OR_COMPONENT=PRODUCT
+DESCRIPTION=OMAP5SDK
+EMAIL=http://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/default.aspx
+FOLDER=http://www.ti.com/tool/linuxezsdk-sitara
+ 
+DOWNLOAD_TEXT=<br>This page contains the OMAP5 Core SDK from the LCPD team.  It is intended as a reference for INTERNAL use only and should not be distributed to customers.<br>
+
+VERSION=2013.12.01
+ 
+# un-comment for debug
+#MK_NOISY=1
+ 
+.prod_links:
+	$(call add-divider,"OMAP5 SDK Essentials")
+	$(call add-link,"ti-sdk-omap5-evm-2013.12.01-Linux-x86-Install.bin","ti-sdk-omap5-evm-2013.12.01-Linux-x86-Install.bin","OMAP5 EVM SDK")
+	$(call add-divider,"OMAP5 SDK Optional Addons")
+	$(call add-selfcert-link,"CCS-5.3.0.00090_Sitara-ARM.tar.gz",CCS-5.3.0.00090_Sitara-ARM.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS bundle can be used for ARM debugging on OMAP devices as well.")
+	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sitara ARM README")
+	$(call add-divider,"OMAP5 SDK Individual Components \(all of the below compoonents are bundled within the SDK installer\)")
+	$(call add-http-link,"https://launchpad.net/linaro-toolchain-binaries/trunk/2013.03/+download/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux.tar.bz2","Download Linaro Toolchain","Standalone Linaro Toolchain - Linaro GCC 4.7 2013.03 hard-float toolchain")
+	$(call add-link,"omap5-evm-sdk-src-2013.12.01.tar.gz","omap5-evm-sdk-src-2013.12.01.tar.gz", "OMAP5 SDK PSP Source Code")
+	$(call add-link,"omap5-evm-sdk-bin-2013.12.01.tar.gz","omap5-evm-sdk-bin-2013.12.01.tar.gz", "OMAP5 SDK prebuilt PSP binaries and root filesystem")
+	$(call add-divider,"OMAP5 SDK Documentation")
+	$(call add-link,"omap5-evm-qsg.pdf","omap5-evm-qsg.pdf","OMAP5 EVM Quick Start Guide")
+	$(call add-link,"software_manifest.htm","Software Manifest", "Software Manifest of Components Inside the SDK")
+	$(call add-divider,"OMAP5 SDK Checksums")
+	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
-- 
1.7.9.5


