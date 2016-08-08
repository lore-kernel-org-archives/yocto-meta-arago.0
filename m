Return-Path: <j-stiffler@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 6C7E35207C
	for <meta-arago@arago-project.org>;
	Mon,  8 Aug 2016 13:40:10 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u78DZVmV005350
	for <meta-arago@arago-project.org>; Mon, 8 Aug 2016 08:35:31 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u78De8r9032487
	for <meta-arago@arago-project.org>; Mon, 8 Aug 2016 08:40:09 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 8 Aug 2016 08:40:08 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u78De8Zk002651;	Mon, 8 Aug 2016 08:40:08 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 8 Aug 2016 09:39:28 -0400
Message-ID: <1470663570-5175-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/3] linux: copy-defconfig: move create_srcipk task after configure
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
X-List-Received-Date: Mon, 08 Aug 2016 13:40:11 -0000
Content-Type: text/plain

* With sstate support for the sourceipk class, create_srcipk can no
  longer be successfully called within another task.
* Move the create_srcipk task after configure so that the build
  defconfig is included in the src package.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc          | 7 +++++--
 .../recipes-kernel/linux/linux-ti-staging-rt_%.bbappend            | 2 +-
 .../recipes-kernel/linux/linux-ti-staging-systest_%.bbappend       | 2 +-
 meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend | 2 +-
 4 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc b/meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc
index b9db1ee..46de4a3 100644
--- a/meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc
+++ b/meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc
@@ -5,7 +5,10 @@ CONFIG_NAME ?= "tisdk_${MACHINE}_defconfig"
 # the function to build the sourceipk again.  This is done as a
 # do_compile_prepend so that we can pick up any changes to the
 # defconfig thay may have been done by the sanitizer code.
-do_compile_prepend() {
+do_configure_append() {
     cp ${B}/.config ${S}/arch/arm/configs/${CONFIG_NAME}
-    sourceipk_do_create_srcipk
 }
+
+# Move create_srcipk task so that the release defconfig is included.
+deltask do_create_srcipk
+addtask create_srcipk after do_configure before do_compile
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappend
index 7c90ac5..a3241ab 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappend
@@ -1,4 +1,4 @@
-MACHINE_KERNEL_PR_append = ".arago0"
+MACHINE_KERNEL_PR_append = ".arago1"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
 
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.bbappend
index 7c90ac5..a3241ab 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.bbappend
@@ -1,4 +1,4 @@
-MACHINE_KERNEL_PR_append = ".arago0"
+MACHINE_KERNEL_PR_append = ".arago1"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
 
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
index 4c50655..6ae4bd7 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
@@ -1,4 +1,4 @@
-MACHINE_KERNEL_PR_append = ".arago4"
+MACHINE_KERNEL_PR_append = ".arago5"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
 
-- 
2.7.4


