Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0548FC00144
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 21:35:46 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.12571.1658871336576700983
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 26 Jul 2022 14:35:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=sHmumq5z;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26QLZXNF088071;
	Tue, 26 Jul 2022 16:35:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1658871333;
	bh=1FInOrgyurkgy1Z2ksL9Jp0pCXu79y/xWgoZbOaTke4=;
	h=From:To:Subject:Date;
	b=sHmumq5zoUEHjjSxMvd3ylk/TQabn2rpuN2LccWy7jCvXoZD7gLe/i1A7LWpkEhk8
	 4aj6/RRJ8DdyBeK34Wy7Q3R4oVB7bWYjnpYPu1VkruRQkhoWfb8NkPLITX/3B0O+4q
	 lz1RpiZKIb/ImXuzJ0duawIQM01F/637WM5JQmNA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26QLZXem053364
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 26 Jul 2022 16:35:33 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Jul 2022 16:35:32 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 26 Jul 2022 16:35:32 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26QLZWJN104574;
	Tue, 26 Jul 2022 16:35:32 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1oGSDE-0000dn-FM; Tue, 26 Jul 2022 16:35:32 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH v2] oe-layersetup: Add config option
 for inclusive vars
Date: Tue, 26 Jul 2022 16:35:32 -0500
Message-ID: <20220726213532.2414-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 26 Jul 2022 21:35:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13967

Part of the transition to kirkstone was to rename some variables
to align with community standards.  Since oe-layersetup needs to
work with both dunfell and kirkstone, we need a way to control
which branch we are pointing to so that we can put the correct
variables in the conf/setenv file.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Removed change to /bin/bash that made it into v1.

 configs/arago-dunfell-config.txt        |  1 +
 configs/arago-dunfell-next-config.txt   |  1 +
 configs/arago-dunfell-wip-config.txt    |  1 +
 configs/arago-kirkstone-config.txt      |  1 +
 configs/arago-master-config.txt         |  1 +
 configs/distroless-dunfell-config.txt   |  1 +
 configs/distroless-kirkstone-config.txt |  1 +
 configs/distroless-master-config.txt    |  1 +
 configs/poky-dunfell-config.txt         |  1 +
 configs/poky-kirkstone-config.txt       |  1 +
 configs/poky-master-config.txt          |  1 +
 oe-layertool-setup.sh                   | 25 ++++++++++++++++++++++++-
 12 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/configs/arago-dunfell-config.txt b/configs/arago-dunfell-config.txt
index 60cc72a..c5084a0 100644
--- a/configs/arago-dunfell-config.txt
+++ b/configs/arago-dunfell-config.txt
@@ -16,3 +16,4 @@ OECORELAYERCONF=./sample-files/bblayers.conf.sample
 # use below for OECORELAYERCONF to mark it compatible with dunfell
 #OECORELAYERCONF=./sample-files/bblayers-dunfell-browser.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
+BITBAKE_INCLUSIVE_VARS=no
diff --git a/configs/arago-dunfell-next-config.txt b/configs/arago-dunfell-next-config.txt
index e2eb202..7ad9f92 100644
--- a/configs/arago-dunfell-next-config.txt
+++ b/configs/arago-dunfell-next-config.txt
@@ -16,3 +16,4 @@ OECORELAYERCONF=./sample-files/bblayers.conf.sample
 # use below for OECORELAYERCONF to mark it compatible with dunfell
 #OECORELAYERCONF=./sample-files/bblayers-dunfell-browser.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
+BITBAKE_INCLUSIVE_VARS=no
diff --git a/configs/arago-dunfell-wip-config.txt b/configs/arago-dunfell-wip-config.txt
index 60f9f0d..b8c9cce 100644
--- a/configs/arago-dunfell-wip-config.txt
+++ b/configs/arago-dunfell-wip-config.txt
@@ -16,3 +16,4 @@ OECORELAYERCONF=./sample-files/bblayers.conf.sample
 # use below for OECORELAYERCONF to mark it compatible with dunfell
 #OECORELAYERCONF=./sample-files/bblayers-dunfell-browser.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
+BITBAKE_INCLUSIVE_VARS=no
diff --git a/configs/arago-kirkstone-config.txt b/configs/arago-kirkstone-config.txt
index 0f3c001..ebe130a 100644
--- a/configs/arago-kirkstone-config.txt
+++ b/configs/arago-kirkstone-config.txt
@@ -12,3 +12,4 @@ meta-arm,git://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta
 oe-core,git://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
diff --git a/configs/arago-master-config.txt b/configs/arago-master-config.txt
index 532a145..93d93b5 100644
--- a/configs/arago-master-config.txt
+++ b/configs/arago-master-config.txt
@@ -12,3 +12,4 @@ meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-ar
 oe-core,git://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
diff --git a/configs/distroless-dunfell-config.txt b/configs/distroless-dunfell-config.txt
index 0d2ab28..bb03ac7 100644
--- a/configs/distroless-dunfell-config.txt
+++ b/configs/distroless-dunfell-config.txt
@@ -6,3 +6,4 @@ meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,HEAD,layers=meta-arm:meta-a
 oe-core,git://git.openembedded.org/openembedded-core,dunfell,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local.conf.sample
+BITBAKE_INCLUSIVE_VARS=no
diff --git a/configs/distroless-kirkstone-config.txt b/configs/distroless-kirkstone-config.txt
index 3b33992..4cafca7 100644
--- a/configs/distroless-kirkstone-config.txt
+++ b/configs/distroless-kirkstone-config.txt
@@ -6,3 +6,4 @@ meta-arm,git://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta
 oe-core,git://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
diff --git a/configs/distroless-master-config.txt b/configs/distroless-master-config.txt
index 5c55459..e67f916 100644
--- a/configs/distroless-master-config.txt
+++ b/configs/distroless-master-config.txt
@@ -6,3 +6,4 @@ meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-ar
 oe-core,git://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
diff --git a/configs/poky-dunfell-config.txt b/configs/poky-dunfell-config.txt
index 6c768e7..5f6c45b 100644
--- a/configs/poky-dunfell-config.txt
+++ b/configs/poky-dunfell-config.txt
@@ -6,3 +6,4 @@ meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,HEAD,layers=meta-arm:meta-a
 meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,HEAD,layers=
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-poky.conf.sample
+BITBAKE_INCLUSIVE_VARS=no
diff --git a/configs/poky-kirkstone-config.txt b/configs/poky-kirkstone-config.txt
index 0e57c64..815cabf 100644
--- a/configs/poky-kirkstone-config.txt
+++ b/configs/poky-kirkstone-config.txt
@@ -8,3 +8,4 @@ meta-arm,git://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta
 oe-core,git://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-poky-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
diff --git a/configs/poky-master-config.txt b/configs/poky-master-config.txt
index a541501..272a14b 100644
--- a/configs/poky-master-config.txt
+++ b/configs/poky-master-config.txt
@@ -8,3 +8,4 @@ meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-ar
 oe-core,git://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-poky-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index e05737b..e404290 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -38,6 +38,7 @@ OECORELAYERCONF="" # sample configuration file used for bblayers.conf
 OECORELAYERCONFPATH="" # stores the path of the OECORELAYERCONFPATH variable
 OECORELOCALCONF="" # sample configuration file used for local.conf
 OECORELOCALCONFPATH="" # stores the path of the OECORELOCALCONFPATH variable
+BITBAKE_INCLUSIVE_VARS="no"
 outputfile="" # file to save output to if -o is used
 inputfile="" # file containing initial layers if -f is used
 interactive="n" # flag for interactive mode.  Default is n
@@ -158,6 +159,14 @@ parse_oecore_line() {
     eval $var=$val
 }
 
+# Input is a line of the form BITBAKE.*=value
+parse_bitbake_line() {
+    var=`echo $1 | cut -d= -f1`
+    val=`echo $1 | cut -d= -f2`
+    eval $var=$val
+}
+
+
 
 # Input is a repository description line as detailed in the usage section
 # There is a second optional input that can be passed to prefix the variable
@@ -243,6 +252,15 @@ parse_input_file() {
             continue
         fi
 
+        # If the line starts with OECORE then parse the OECORE setting
+        echo $line | grep -e "^BITBAKE.*=" > /dev/null
+        if [ "$?" = "0" ]
+        then
+            parse_bitbake_line $line
+            output="$output""$line\n"
+            continue
+        fi
+
         # Since the line is not a comment or an OECORE setting let's assume
         # it is a repository information line and parse it
         parse_repo_line $line
@@ -853,8 +871,13 @@ unset BITBAKEDIR
 unset SCRIPTS
 export PATH
 export BUILDDIR=${builddir}
-export BB_ENV_EXTRAWHITE="MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD SOCKS5_USER OEBASE META_SDK_PATH TOOLCHAIN_TYPE TOOLCHAIN_BRAND TOOLCHAIN_BASE TOOLCHAIN_PATH TOOLCHAIN_PATH_ARMV5 TOOLCHAIN_PATH_ARMV7 TOOLCHAIN_PATH_ARMV8 EXTRA_TISDK_FILES TISDK_VERSION ARAGO_BRAND ARAGO_RT_ENABLE ARAGO_SYSTEST_ENABLE ARAGO_KERNEL_SUFFIX TI_SECURE_DEV_PKG_CAT TI_SECURE_DEV_PKG_AUTO TI_SECURE_DEV_PKG_K3 ARAGO_SYSVINIT SYSFW_FILE"
 EOM
+
+    if [ "$BITBAKE_INCLUSIVE_VARS" == "no" ]; then
+        echo "export BB_ENV_EXTRAWHITE=\"MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD SOCKS5_USER OEBASE META_SDK_PATH TOOLCHAIN_TYPE TOOLCHAIN_BRAND TOOLCHAIN_BASE TOOLCHAIN_PATH TOOLCHAIN_PATH_ARMV5 TOOLCHAIN_PATH_ARMV7 TOOLCHAIN_PATH_ARMV8 EXTRA_TISDK_FILES TISDK_VERSION ARAGO_BRAND ARAGO_RT_ENABLE ARAGO_SYSTEST_ENABLE ARAGO_KERNEL_SUFFIX TI_SECURE_DEV_PKG_CAT TI_SECURE_DEV_PKG_AUTO TI_SECURE_DEV_PKG_K3 ARAGO_SYSVINIT SYSFW_FILE\"" >> $confdir/setenv
+    else
+        echo "export BB_ENV_PASSTHROUGH_ADDITIONS=\"MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD SOCKS5_USER OEBASE META_SDK_PATH TOOLCHAIN_TYPE TOOLCHAIN_BRAND TOOLCHAIN_BASE TOOLCHAIN_PATH TOOLCHAIN_PATH_ARMV5 TOOLCHAIN_PATH_ARMV7 TOOLCHAIN_PATH_ARMV8 EXTRA_TISDK_FILES TISDK_VERSION ARAGO_BRAND ARAGO_RT_ENABLE ARAGO_SYSTEST_ENABLE ARAGO_KERNEL_SUFFIX TI_SECURE_DEV_PKG_CAT TI_SECURE_DEV_PKG_AUTO TI_SECURE_DEV_PKG_K3 ARAGO_SYSVINIT SYSFW_FILE\"" >> $confdir/setenv
+    fi
 }
 
 
-- 
2.17.1


