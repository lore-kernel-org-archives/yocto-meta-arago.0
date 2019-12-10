Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 68DCC52A10
	for <meta-arago@arago-project.org>;
	Tue, 10 Dec 2019 19:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1801040BFB;
	Tue, 10 Dec 2019 19:04:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id RInIKNBnmy7g; Tue, 10 Dec 2019 19:04:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AA8214087C;
	Tue, 10 Dec 2019 19:04:40 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 6913C17434B;
	Tue, 10 Dec 2019 14:04:40 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 10 Dec 2019 14:04:40 -0500
Message-Id: <1576004680-14425-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Cc: Andreas Dannenberg <dannenberg@ti.com>
Subject: [tisdk-setup-scripts][PATCH] setup-uboot-env-*: replace ifconfig with ip addr show
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
X-List-Received-Date: Tue, 10 Dec 2019 19:06:17 -0000

Simple ifconfig has been deprecated for quite some time in favor of ip tools.
New distros no longer package ifconfig, so use ip addr show command instead.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Cc: Andreas Dannenberg <dannenberg@ti.com>
---
 setup-uboot-env-am18x.sh       | 2 +-
 setup-uboot-env-am335x.sh      | 2 +-
 setup-uboot-env-am3517.sh      | 2 +-
 setup-uboot-env-am37x.sh       | 2 +-
 setup-uboot-env-am43x.sh       | 2 +-
 setup-uboot-env-am57xx-evm.sh  | 2 +-
 setup-uboot-env-am65x.sh       | 2 +-
 setup-uboot-env-beagleboard.sh | 2 +-
 setup-uboot-env-k2g-evm.sh     | 2 +-
 setup-uboot-env-keystone.sh    | 2 +-
 setup-uboot-env-omap5.sh       | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/setup-uboot-env-am18x.sh b/setup-uboot-env-am18x.sh
index 8c296e5..3733281 100644
--- a/setup-uboot-env-am18x.sh
+++ b/setup-uboot-env-am18x.sh
@@ -42,7 +42,7 @@ SDKinstall=`grep TI_SDK_PATH= $cwd/../Rules.make | cut -d= -f2`
 dstdefault=$SDKinstall/targetNFS
 
 
-ipdefault=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1 }'`
+ipdefault=`ip addr show | grep 'inet ' | grep -v '127.0.0.1' | cut -d/ -f1 | awk '{ print $2 }'`
 platform=`grep PLATFORM= $cwd/../Rules.make | cut -d= -f2`
 prompt=" >"
 
diff --git a/setup-uboot-env-am335x.sh b/setup-uboot-env-am335x.sh
index 80b0a52..f129875 100644
--- a/setup-uboot-env-am335x.sh
+++ b/setup-uboot-env-am335x.sh
@@ -51,7 +51,7 @@ echo "--------------------------------------------------------------------------
 echo "This step will set up the U-Boot variables for booting the EVM."
 echo
 
-ipdefault=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1 }'`
+ipdefault=`ip addr show | grep 'inet ' | grep -v '127.0.0.1' | cut -d/ -f1 | awk '{ print $2 }'`
 platform=`grep PLATFORM= $cwd/../Rules.make | cut -d= -f2`
 
 # Configure prompt for U-Boot 2016.05
diff --git a/setup-uboot-env-am3517.sh b/setup-uboot-env-am3517.sh
index 73e9971..49dda0a 100644
--- a/setup-uboot-env-am3517.sh
+++ b/setup-uboot-env-am3517.sh
@@ -37,7 +37,7 @@ echo
 echo "--------------------------------------------------------------------------------"
 echo "This step will set up the u-boot variables for booting the EVM."
 
-ipdefault=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1 }'`
+ipdefault=`ip addr show | grep 'inet ' | grep -v '127.0.0.1' | cut -d/ -f1 | awk '{ print $2 }'`
 platform=`grep PLATFORM= $cwd/../Rules.make | cut -d= -f2`
 prompt="EVM #"
 
diff --git a/setup-uboot-env-am37x.sh b/setup-uboot-env-am37x.sh
index e9970d6..eab332b 100644
--- a/setup-uboot-env-am37x.sh
+++ b/setup-uboot-env-am37x.sh
@@ -37,7 +37,7 @@ echo
 echo "--------------------------------------------------------------------------------"
 echo "This step will set up the u-boot variables for booting the EVM."
 
-ipdefault=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1 }'`
+ipdefault=`ip addr show | grep 'inet ' | grep -v '127.0.0.1' | cut -d/ -f1 | awk '{ print $2 }'`
 platform=`grep PLATFORM= $cwd/../Rules.make | cut -d= -f2`
 prompt="EVM #"
 
diff --git a/setup-uboot-env-am43x.sh b/setup-uboot-env-am43x.sh
index f7f2d95..24bc58a 100644
--- a/setup-uboot-env-am43x.sh
+++ b/setup-uboot-env-am43x.sh
@@ -51,7 +51,7 @@ echo "--------------------------------------------------------------------------
 echo "This step will set up the u-boot variables for booting the EVM."
 echo
 
-ipdefault=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1 }'`
+ipdefault=`ip addr show | grep 'inet ' | grep -v '127.0.0.1' | cut -d/ -f1 | awk '{ print $2 }'`
 platform=`grep PLATFORM= $cwd/../Rules.make | cut -d= -f2`
 
 # Configure prompt for U-Boot 2016.05
diff --git a/setup-uboot-env-am57xx-evm.sh b/setup-uboot-env-am57xx-evm.sh
index 574c111..323c134 100644
--- a/setup-uboot-env-am57xx-evm.sh
+++ b/setup-uboot-env-am57xx-evm.sh
@@ -51,7 +51,7 @@ echo "--------------------------------------------------------------------------
 echo "This step will set up the u-boot variables for booting the EVM."
 echo "--------------------------------------------------------------------------------"
 
-ipdefault=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1 }'`
+ipdefault=`ip addr show | grep 'inet ' | grep -v '127.0.0.1' | cut -d/ -f1 | awk '{ print $2 }'`
 platform=`grep PLATFORM= $cwd/../Rules.make | cut -d= -f2`
 
 # Configure prompt for U-Boot 2016.05
diff --git a/setup-uboot-env-am65x.sh b/setup-uboot-env-am65x.sh
index 6335ce4..e17f700 100644
--- a/setup-uboot-env-am65x.sh
+++ b/setup-uboot-env-am65x.sh
@@ -51,7 +51,7 @@ echo "--------------------------------------------------------------------------
 echo "This step will set up the u-boot variables for booting the EVM."
 echo "--------------------------------------------------------------------------------"
 
-ipdefault=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1 }'`
+ipdefault=`ip addr show | grep 'inet ' | grep -v '127.0.0.1' | cut -d/ -f1 | awk '{ print $2 }'`
 platform=`grep PLATFORM= $cwd/../Rules.make | cut -d= -f2`
 
 # Configure prompt for U-Boot 2016.05
diff --git a/setup-uboot-env-beagleboard.sh b/setup-uboot-env-beagleboard.sh
index bc237ae..60ca7d6 100644
--- a/setup-uboot-env-beagleboard.sh
+++ b/setup-uboot-env-beagleboard.sh
@@ -37,7 +37,7 @@ echo
 echo "--------------------------------------------------------------------------------"
 echo "This step will set up the u-boot variables for booting the EVM."
 
-ipdefault=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1 }'`
+ipdefault=`ip addr show | grep 'inet ' | grep -v '127.0.0.1' | cut -d/ -f1 | awk '{ print $2 }'`
 platform=`grep PLATFORM= $cwd/../Rules.make | cut -d= -f2`
 prompt="OMAP3 beagleboard.org #"
 
diff --git a/setup-uboot-env-k2g-evm.sh b/setup-uboot-env-k2g-evm.sh
index 4944f99..5845f2d 100755
--- a/setup-uboot-env-k2g-evm.sh
+++ b/setup-uboot-env-k2g-evm.sh
@@ -78,7 +78,7 @@ echo "--------------------------------------------------------------------------
 echo "This step will set up the u-boot variables for booting the EVM."
 echo "--------------------------------------------------------------------------------"
 
-ipdefault=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1 }'`
+ipdefault=`ip addr show | grep 'inet ' | grep -v '127.0.0.1' | cut -d/ -f1 | awk '{ print $2 }'`
 platform=`grep PLATFORM= $cwd/../Rules.make | cut -d= -f2`
 
 # Configure prompt for U-Boot 2016.05
diff --git a/setup-uboot-env-keystone.sh b/setup-uboot-env-keystone.sh
index 37fb2c1..3a443dd 100755
--- a/setup-uboot-env-keystone.sh
+++ b/setup-uboot-env-keystone.sh
@@ -154,7 +154,7 @@ echo "--------------------------------------------------------------------------
 echo "This step will set up the u-boot variables for booting the EVM."
 echo "--------------------------------------------------------------------------------"
 
-ipdefault=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1 }'`
+ipdefault=`ip addr show | grep 'inet ' | grep -v '127.0.0.1' | cut -d/ -f1 | awk '{ print $2 }'`
 platform=`grep PLATFORM= $cwd/../Rules.make | cut -d= -f2`
 
 # Configure prompt for U-Boot 2016.05
diff --git a/setup-uboot-env-omap5.sh b/setup-uboot-env-omap5.sh
index 7b6f084..7fba3ef 100644
--- a/setup-uboot-env-omap5.sh
+++ b/setup-uboot-env-omap5.sh
@@ -37,7 +37,7 @@ echo
 echo "--------------------------------------------------------------------------------"
 echo "This step will set up the u-boot variables for booting the EVM."
 
-ipdefault=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1 }'`
+ipdefault=`ip addr show | grep 'inet ' | grep -v '127.0.0.1' | cut -d/ -f1 | awk '{ print $2 }'`
 platform=`grep PLATFORM= $cwd/../Rules.make | cut -d= -f2`
 prompt="$prompt"
 
-- 
2.7.4


