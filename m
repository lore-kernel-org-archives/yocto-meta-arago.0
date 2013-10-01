Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id 82F4052099
	for <meta-arago@arago-project.org>;
	Tue,  1 Oct 2013 07:12:27 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MTZ00EI8AOQFW00@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 01 Oct 2013 02:12:27 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 843AF214E7; Tue,
	01 Oct 2013 03:12:26 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 01 Oct 2013 03:12:24 -0400
Message-id: <1380611545-23840-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1380611545-23840-1-git-send-email-denis@denix.org>
References: <1380611545-23840-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/3] publish-sdk-data: add webgen configs for 2013.10 builds of am437x, am335x, omap5 and dra7xx
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
X-List-Received-Date: Tue, 01 Oct 2013 07:12:27 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 publish-sdk-data/2013.10/am335x-evm/webgen.mak |   27 ++++++++++++++++++++++++
 publish-sdk-data/2013.10/am437x-evm/webgen.mak |   27 ++++++++++++++++++++++++
 publish-sdk-data/2013.10/dra7xx-evm/webgen.mak |   27 ++++++++++++++++++++++++
 publish-sdk-data/2013.10/omap5-evm/webgen.mak  |   26 +++++++++++++++++++++++
 4 files changed, 107 insertions(+)
 create mode 100644 publish-sdk-data/2013.10/am335x-evm/webgen.mak
 create mode 100644 publish-sdk-data/2013.10/am437x-evm/webgen.mak
 create mode 100644 publish-sdk-data/2013.10/dra7xx-evm/webgen.mak
 create mode 100644 publish-sdk-data/2013.10/omap5-evm/webgen.mak

diff --git a/publish-sdk-data/2013.10/am335x-evm/webgen.mak b/publish-sdk-data/2013.10/am335x-evm/webgen.mak
new file mode 100644
index 0000000..b3dfbfc
--- /dev/null
+++ b/publish-sdk-data/2013.10/am335x-evm/webgen.mak
@@ -0,0 +1,27 @@
+PRODUCT_NAME=AM335xSDK
+PRODUCT_OR_COMPONENT=PRODUCT
+DESCRIPTION=AM335xSDK
+EMAIL=http://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/default.aspx
+FOLDER=http://www.ti.com/tool/linuxezsdk-sitara
+ 
+DOWNLOAD_TEXT=<br>This page contains the AM335x Core SDK from the LCPD team.  It is intended as a reference for INTERNAL use only and should not be distributed to customers.<br>
+
+VERSION=2013.10
+ 
+# un-comment for debug
+#MK_NOISY=1
+ 
+.prod_links:
+	$(call add-divider,"AM335x SDK Essentials")
+	$(call add-link,"ti-sdk-am335x-evm-2013.10-Linux-x86-Install.bin","ti-sdk-am335x-evm-2013.10-Linux-x86-Install.bin","AM335x EVM SDK")
+	$(call add-divider,"AM335x SDK Optional Addons")
+	$(call add-selfcert-link,"CCS-5.3.0.00090_Sitara-ARM.tar.gz",CCS-5.3.0.00090_Sitara-ARM.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS bundle can be used for ARM debuggin on OMAP devices as well.")
+	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sitara ARM README")
+	$(call add-divider,"AM335x SDK Individual Components")
+	$(call add-link,"am335x-evm-qsg.pdf","am335x-evm-qsg.pdf","AM335x EVM Quick Start Guide")
+	$(call add-link,"software_manifest.htm","Software Manifest", "Software Manifest of Components Inside the SDK")
+	$(call add-link,"am335x-evm-sdk-src-2013.10.tar.gz","am335x-evm-sdk-src-2013.10.tar.gz", "AM335x SDK PSP Source Code")
+	$(call add-link,"am335x-evm-sdk-bin-2013.10.tar.gz","am335x-evm-sdk-bin-2013.10.tar.gz", "AM335x SDK prebuilt PSP binaries and root filesystem")
+	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pinmuxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility")
+	$(call add-divider,"AM335x SDK Checksums")
+	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/2013.10/am437x-evm/webgen.mak b/publish-sdk-data/2013.10/am437x-evm/webgen.mak
new file mode 100644
index 0000000..b377a8b
--- /dev/null
+++ b/publish-sdk-data/2013.10/am437x-evm/webgen.mak
@@ -0,0 +1,27 @@
+PRODUCT_NAME=AM437xSDK
+PRODUCT_OR_COMPONENT=PRODUCT
+DESCRIPTION=AM437xSDK
+EMAIL=http://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/default.aspx
+FOLDER=http://www.ti.com/tool/linuxezsdk-sitara
+ 
+DOWNLOAD_TEXT=<br>This page contains the AM437x Core SDK from the LCPD team.  It is intended as a reference for INTERNAL use only and should not be distributed to customers.<br>
+
+VERSION=2013.10
+ 
+# un-comment for debug
+#MK_NOISY=1
+ 
+.prod_links:
+	$(call add-divider,"AM437x SDK Essentials")
+	$(call add-link,"ti-sdk-am437x-evm-2013.10-Linux-x86-Install.bin","ti-sdk-am437x-evm-2013.10-Linux-x86-Install.bin","AM437x EVM SDK")
+	$(call add-divider,"AM437x SDK Optional Addons")
+	$(call add-selfcert-link,"CCS-5.3.0.00090_Sitara-ARM.tar.gz",CCS-5.3.0.00090_Sitara-ARM.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS bundle can be used for ARM debuggin on OMAP devices as well.")
+	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sitara ARM README")
+	$(call add-divider,"AM437x SDK Individual Components")
+	$(call add-link,"am437x-evm-qsg.pdf","am437x-evm-qsg.pdf","AM437x EVM Quick Start Guide")
+	$(call add-link,"software_manifest.htm","Software Manifest", "Software Manifest of Components Inside the SDK")
+	$(call add-link,"am437x-evm-sdk-src-2013.10.tar.gz","am437x-evm-sdk-src-2013.10.tar.gz", "AM437x SDK PSP Source Code")
+	$(call add-link,"am437x-evm-sdk-bin-2013.10.tar.gz","am437x-evm-sdk-bin-2013.10.tar.gz", "AM437x SDK prebuilt PSP binaries and root filesystem")
+	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pinmuxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility")
+	$(call add-divider,"AM437x SDK Checksums")
+	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/2013.10/dra7xx-evm/webgen.mak b/publish-sdk-data/2013.10/dra7xx-evm/webgen.mak
new file mode 100644
index 0000000..2852dde
--- /dev/null
+++ b/publish-sdk-data/2013.10/dra7xx-evm/webgen.mak
@@ -0,0 +1,27 @@
+PRODUCT_NAME=DRA7xxSDK
+PRODUCT_OR_COMPONENT=PRODUCT
+DESCRIPTION=DRA7xxSDK
+EMAIL=http://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/default.aspx
+FOLDER=http://www.ti.com/tool/linuxezsdk-sitara
+ 
+DOWNLOAD_TEXT=<br>This page contains the DRA7xx Core SDK from the LCPD team.  It is intended as a reference for INTERNAL use only and should not be distributed to customers.<br>
+
+VERSION=2013.10
+ 
+# un-comment for debug
+#MK_NOISY=1
+ 
+.prod_links:
+	$(call add-divider,"DRA7xx SDK Essentials")
+	$(call add-link,"ti-sdk-dra7xx-evm-2013.10-Linux-x86-Install.bin","ti-sdk-dra7xx-evm-2013.10-Linux-x86-Install.bin","DRA7xx EVM SDK")
+	$(call add-divider,"DRA7xx SDK Optional Addons")
+	$(call add-selfcert-link,"CCS-5.3.0.00090_Sitara-ARM.tar.gz",CCS-5.3.0.00090_Sitara-ARM.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS bundle can be used for ARM debuggin on OMAP devices as well.")
+	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sitara ARM README")
+	$(call add-divider,"DRA7xx SDK Individual Components")
+	$(call add-link,"dra7xx-evm-qsg.pdf","dra7xx-evm-qsg.pdf","DRA7xx EVM Quick Start Guide")
+	$(call add-link,"software_manifest.htm","Software Manifest", "Software Manifest of Components Inside the SDK")
+	$(call add-link,"dra7xx-evm-sdk-src-2013.10.tar.gz","dra7xx-evm-sdk-src-2013.10.tar.gz", "DRA7xx SDK PSP Source Code")
+	$(call add-link,"dra7xx-evm-sdk-bin-2013.10.tar.gz","dra7xx-evm-sdk-bin-2013.10.tar.gz", "DRA7xx SDK prebuilt PSP binaries and root filesystem")
+	$(call add-http-link,"http://focus.ti.com/docs/toolsw/folders/print/pinmuxtool.html","Download Pinmuxtool","Sitara Pin Mux Configuration Utility")
+	$(call add-divider,"DRA7xx SDK Checksums")
+	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
diff --git a/publish-sdk-data/2013.10/omap5-evm/webgen.mak b/publish-sdk-data/2013.10/omap5-evm/webgen.mak
new file mode 100644
index 0000000..95ee295
--- /dev/null
+++ b/publish-sdk-data/2013.10/omap5-evm/webgen.mak
@@ -0,0 +1,26 @@
+PRODUCT_NAME=OMAP5SDK
+PRODUCT_OR_COMPONENT=PRODUCT
+DESCRIPTION=OMAP5SDK
+EMAIL=http://e2e.ti.com/support/dsp/sitara_arm174_microprocessors/default.aspx
+FOLDER=http://www.ti.com/tool/linuxezsdk-sitara
+ 
+DOWNLOAD_TEXT=<br>This page contains the OMAP5 Core SDK from the LCPD team.  It is intended as a reference for INTERNAL use only and should not be distributed to customers.<br>
+
+VERSION=2013.10
+ 
+# un-comment for debug
+#MK_NOISY=1
+ 
+.prod_links:
+	$(call add-divider,"OMAP5 SDK Essentials")
+	$(call add-link,"ti-sdk-omap5-evm-2013.10-Linux-x86-Install.bin","ti-sdk-omap5-evm-2013.10-Linux-x86-Install.bin","OMAP5 EVM SDK")
+	$(call add-divider,"OMAP5 SDK Optional Addons")
+	$(call add-selfcert-link,"CCS-5.3.0.00090_Sitara-ARM.tar.gz",CCS-5.3.0.00090_Sitara-ARM.tar.gz,"Code Composer Studio for Sitara ARM.  This CCS bundle can be used for ARM debuggin on OMAP devices as well.")
+	$(call add-link,"README.ccs","README.ccs","Code Composer Studio for Sitara ARM README")
+	$(call add-divider,"OMAP5 SDK Individual Components")
+	$(call add-link,"omap5-evm-qsg.pdf","omap5-evm-qsg.pdf","OMAP5 EVM Quick Start Guide")
+	$(call add-link,"software_manifest.htm","Software Manifest", "Software Manifest of Components Inside the SDK")
+	$(call add-link,"omap5-evm-sdk-src-2013.10.tar.gz","omap5-evm-sdk-src-2013.10.tar.gz", "OMAP5 SDK PSP Source Code")
+	$(call add-link,"omap5-evm-sdk-bin-2013.10.tar.gz","omap5-evm-sdk-bin-2013.10.tar.gz", "OMAP5 SDK prebuilt PSP binaries and root filesystem")
+	$(call add-divider,"OMAP5 SDK Checksums")
+	$(call add-link,"md5sum.txt","md5sum.txt","MD5 Checksums")
-- 
1.7.9.5


