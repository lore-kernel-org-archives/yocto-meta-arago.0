Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 123CF52093
	for <meta-arago@arago-project.org>;
	Fri,  8 May 2015 17:29:32 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t48HTUjK016981
	for <meta-arago@arago-project.org>; Fri, 8 May 2015 12:29:30 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t48HTU30018911
	for <meta-arago@arago-project.org>; Fri, 8 May 2015 12:29:30 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 8 May 2015 12:29:29 -0500
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t48HTTOR004372;	Fri, 8 May 2015 12:29:29 -0500
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1Yqm5Z-0003S0-E8;
	Fri, 08 May 2015 13:29:29 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 8 May 2015 13:29:26 -0400
Message-ID: <1431106167-13234-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] php: Fix race condition during installation.
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
X-List-Received-Date: Fri, 08 May 2015 17:29:32 -0000
Content-Type: text/plain

* The race condition manifests with the following error:

Installing PHP CLI binary:        /home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/work/x86_64-linux/php-native/5.4.14-r5.0-arago2/image/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/bin/
Installing PHP CGI binary:        /home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/work/x86_64-linux/php-native/5.4.14-r5.0-arago2/image/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/bin/
Installing build environment:     /home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/work/x86_64-linux/php-native/5.4.14-r5.0-arago2/image/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/lib/build/
Installing helper programs:       /home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/work/x86_64-linux/php-native/5.4.14-r5.0-arago2/image/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/bin/
Installing PEAR environment:      /home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/work/x86_64-linux/php-native/5.4.14-r5.0-arago2/image/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/lib/php/
Installing PDO headers:          /home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/work/x86_64-linux/php-native/5.4.14-r5.0-arago2/image/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/include/php/ext/pdo/
cp: cannot create regular file `/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/work/x86_64-linux/php-native/5.4.14-r5.0-arago2/image/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/bin/#INST@1289#': No such file or directory
make: *** [install-cgi] Error 1
make: *** Waiting for unfinished jobs....

* This issue was root caused to being a race condition when multiple
  threads are used.
* The PHP CGI bibary installation does not install the $bindir, PHP
  CLI binary intalls the $bindir, so there is a slight chance that PHP
  CGI will attempt to install its binaries before the $bindir is
  created.
* This patches the makefile so that installing the PHP CGI binaries
  will also install the $bindir.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../php/fix-race-condition-during-install.patch    |   10 ++++++++++
 .../recipes-devtools/php/php_5.4.14.bbappend       |    4 +++-
 2 files changed, 13 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-devtools/php/php/fix-race-condition-during-install.patch

diff --git a/meta-arago-distro/recipes-devtools/php/php/fix-race-condition-during-install.patch b/meta-arago-distro/recipes-devtools/php/php/fix-race-condition-during-install.patch
new file mode 100644
index 0000000..f4f3fb6
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/php/php/fix-race-condition-during-install.patch
@@ -0,0 +1,10 @@
+diff -rupN php-5.4.14/sapi/cgi/Makefile.frag php-5.4.14.0/sapi/cgi/Makefile.frag
+--- php-5.4.14/sapi/cgi/Makefile.frag	2013-04-10 03:47:04.000000000 -0400
++++ php-5.4.14.0/sapi/cgi/Makefile.frag	2015-05-08 11:41:10.389484079 -0400
+@@ -5,5 +5,6 @@ $(SAPI_CGI_PATH): $(PHP_GLOBAL_OBJS) $(P
+ 
+ install-cgi: $(SAPI_CGI_PATH)
+ 	@echo "Installing PHP CGI binary:        $(INSTALL_ROOT)$(bindir)/"
++	@$(mkinstalldirs) $(INSTALL_ROOT)$(bindir)
+ 	@$(INSTALL) -m 0755 $(SAPI_CGI_PATH) $(INSTALL_ROOT)$(bindir)/$(program_prefix)php-cgi$(program_suffix)$(EXEEXT)
+ 
diff --git a/meta-arago-distro/recipes-devtools/php/php_5.4.14.bbappend b/meta-arago-distro/recipes-devtools/php/php_5.4.14.bbappend
index ebf480c..f463233 100644
--- a/meta-arago-distro/recipes-devtools/php/php_5.4.14.bbappend
+++ b/meta-arago-distro/recipes-devtools/php/php_5.4.14.bbappend
@@ -1,7 +1,9 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = "-arago2"
+PR_append = "-arago3"
+
+SRC_URI_append = " files://fix-race-condition-during-install.patch"
 
 SRC_URI_append_virtclass-native = " file://0001-php-native-Fix-host-contamination-issue.patch"
 
-- 
1.7.9.5


