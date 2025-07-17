Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE4EC83F3B
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 14:48:59 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.695.1752763733277304767
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 17 Jul 2025 07:48:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=FRj/NJ7m;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56HEmpjr495337;
	Thu, 17 Jul 2025 09:48:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752763731;
	bh=vAWPFF4aZ3QeRuqhzJwcGd/ksZWVhPSBsR+vEXT6U5k=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=FRj/NJ7mjD32mrhmoohug3DLyI/07EOs3lz5z75nA0EjTtEwAUPAPjVDXpqacUPAL
	 FGrNRG4XfbGPSfPbns0FrJe985+kf/9K34oljSCxn3onWlThyMeHNQWsfU2+8My5l3
	 V+91E+5JAZuzFRe0mCibfnnw56pxtDiMGQadV1Z8=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56HEmpQ01711514
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 17 Jul 2025 09:48:51 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 17
 Jul 2025 09:48:50 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 17 Jul 2025 09:48:50 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56HEmo862339182;
	Thu, 17 Jul 2025 09:48:50 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1ucPuj-00008a-Vt; Thu, 17 Jul 2025 09:48:50 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH 3/3] CLEANUP: Add missing Upstream-Status to patches
Date: Thu, 17 Jul 2025 09:48:49 -0500
Message-ID: <20250717144849.471-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250717144849.471-1-reatmon@ti.com>
References: <20250717144849.471-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 17 Jul 2025 14:48:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16306

We did a cleanup on master a while back.  This backports the missing
changes that are present in scarthgap.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../pm-qa/0001-Return-non-zero-value-on-test-failure.patch     | 2 ++
 .../pm-qa/pm-qa/0002-cpuidle-Avoid-relative-paths.patch        | 2 ++
 .../0001-layer-add-surfaces-Add-screenId-as-an-argument.patch  | 2 ++
 .../0002-layer-add-surfaces-surface-layer-management.patch     | 2 ++
 .../wayland/wayland-ivi-extension/force-type-conversion.patch  | 3 +++
 .../0001-hostapd-change-conf-file-for-better-oob-startup.patch | 2 ++
 .../recipes-connectivity/vtun/vtun/08-gcc5-inline.patch        | 2 ++
 .../recipes-connectivity/vtun/vtun/Add_search_path.patch       | 3 +++
 .../recipes-connectivity/vtun/vtun/remove_strip.patch          | 3 +++
 .../sysrepo/netopeer2-server/0001-Add-EST-Yang-Models.patch    | 3 +++
 .../sysrepo/sysrepo-plugins-common/0001-so-version.patch       | 3 +++
 .../recipes-graphics/devil/files/Remove-ILUT-dependency.patch  | 3 +++
 ...-makefile.linux.def-relax-assignment-of-CC-and-other-.patch | 2 ++
 ...-gstducati-configure.ac-stop-using-export-symbols-reg.patch | 2 ++
 .../0001-configure.ac-stop-using-export-symbols-regex.patch    | 2 ++
 ...1-gstvpe-configure.ac-stop-using-export-symbols-regex.patch | 2 ++
 ...-include-loki-SmallObj.h-ISO-C-17-does-not-allow-dyna.patch | 2 ++
 ...-include-loki-Threads.h-return-statement-with-a-value.patch | 2 ++
 ...-test-Function-FunctionTest.cpp-reference-to-bad_func.patch | 2 ++
 .../iperf/iperf-2.0.5/0001-fix-out-of-tree-config.patch        | 2 ++
 ...1-headers.h-remove-math.h-include-that-breaks-aarch64.patch | 2 ++
 .../iperf/iperf-2.0.5/0002-fix-bool-size-m4.patch              | 3 +++
 .../iperf/iperf-2.0.5/iperf-2.0.5_ManPage.patch                | 2 ++
 .../0001-autoconf-fix-for-cross-compilation-for-ARM.patch      | 2 ++
 24 files changed, 55 insertions(+)

diff --git a/meta-arago-distro/recipes-devtools/pm-qa/pm-qa/0001-Return-non-zero-value-on-test-failure.patch b/meta-arago-distro/recipes-devtools/pm-qa/pm-qa/0001-Return-non-zero-value-on-test-failure.patch
index a5b5b8cc..35dbe7f5 100644
--- a/meta-arago-distro/recipes-devtools/pm-qa/pm-qa/0001-Return-non-zero-value-on-test-failure.patch
+++ b/meta-arago-distro/recipes-devtools/pm-qa/pm-qa/0001-Return-non-zero-value-on-test-failure.patch
@@ -4,6 +4,8 @@ Date: Thu, 13 Aug 2015 15:03:00 -0400
 
 By convention Linux tools return non-zero value on error/failure.
 
+Upstream-Status: Inactive-Upstream
+
 Signed-off-by: Carlos Hernandez <ceh@ti.com>
 ---
  include/functions.sh | 1 +
diff --git a/meta-arago-distro/recipes-devtools/pm-qa/pm-qa/0002-cpuidle-Avoid-relative-paths.patch b/meta-arago-distro/recipes-devtools/pm-qa/pm-qa/0002-cpuidle-Avoid-relative-paths.patch
index 5252e3b1..0c39d6f4 100644
--- a/meta-arago-distro/recipes-devtools/pm-qa/pm-qa/0002-cpuidle-Avoid-relative-paths.patch
+++ b/meta-arago-distro/recipes-devtools/pm-qa/pm-qa/0002-cpuidle-Avoid-relative-paths.patch
@@ -5,6 +5,8 @@ Date: Thu, 13 Aug 2015 15:03:01 -0400
 Instead of assuming location of files in the filesystem by using
 relative paths, call binary and let $PATH find binary location.
 
+Upstream-Status: Inactive-Upstream
+
 Signed-off-by: Carlos Hernandez <ceh@ti.com>
 ---
  cpuidle/cpuidle_02.sh | 2 +-
diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/0001-layer-add-surfaces-Add-screenId-as-an-argument.patch b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/0001-layer-add-surfaces-Add-screenId-as-an-argument.patch
index b8afc0de..b8601e36 100644
--- a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/0001-layer-add-surfaces-Add-screenId-as-an-argument.patch
+++ b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/0001-layer-add-surfaces-Add-screenId-as-an-argument.patch
@@ -7,6 +7,8 @@ Add Screen_ID as a argument to handle multiple screens.
 Removed choose_screen function as it is redundant
 after this change
 
+Upstream-Status: Inappropriate [arago specific]
+
 Signed-off-by: Ramprasad N <x0038811@ti.com>
 Reviewed-by: Karthik Ramanan <a0393906@ti.com>
 ---
diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/0002-layer-add-surfaces-surface-layer-management.patch b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/0002-layer-add-surfaces-surface-layer-management.patch
index eff4a79c..adf6711f 100644
--- a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/0002-layer-add-surfaces-surface-layer-management.patch
+++ b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/0002-layer-add-surfaces-surface-layer-management.patch
@@ -6,6 +6,8 @@ Subject: [PATCH 2/2] layer-add-surfaces: surface-layer management
 This patch prevents surfaces from getting added to a new layer
 if they are already registered to an existing layer.
 
+Upstream-Status: Inappropriate [arago specific]
+
 Signed-off-by: Ramprasad N <x0038811@ti.com>
 Reviewed-by: Karthik Ramanan <a0393906@ti.com>
 ---
diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/force-type-conversion.patch b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/force-type-conversion.patch
index a72aeedf..acebcfe4 100644
--- a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/force-type-conversion.patch
+++ b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/force-type-conversion.patch
@@ -1,3 +1,6 @@
+
+Upstream-Status: Inappropriate [arago specific]
+
 diff --git a/ivi-layermanagement-examples/EGLWLMockNavigation/src/OpenGLES2App.cpp b/ivi-layermanagement-examples/EGLWLMockNavigation/src/OpenGLES2App.cpp
 index 2e65864..e14dbc0 100644
 --- a/ivi-layermanagement-examples/EGLWLMockNavigation/src/OpenGLES2App.cpp
diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx/0001-hostapd-change-conf-file-for-better-oob-startup.patch b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx/0001-hostapd-change-conf-file-for-better-oob-startup.patch
index c89dd4c8..a89ec8ef 100644
--- a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx/0001-hostapd-change-conf-file-for-better-oob-startup.patch
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx/0001-hostapd-change-conf-file-for-better-oob-startup.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] hostapd change conf file for better oob startup
 
 Changed some of the default parameters
 
+Upstream-Status: Inappropriate [configuration change] 		
+
 Signed-off-by: Yaniv Mahani <yanivma@ti.com>
 ---
  hostapd/hostapd.conf |  724 ++++++--------------------------------------------
diff --git a/meta-arago-extras/recipes-connectivity/vtun/vtun/08-gcc5-inline.patch b/meta-arago-extras/recipes-connectivity/vtun/vtun/08-gcc5-inline.patch
index c9a00900..18497111 100644
--- a/meta-arago-extras/recipes-connectivity/vtun/vtun/08-gcc5-inline.patch
+++ b/meta-arago-extras/recipes-connectivity/vtun/vtun/08-gcc5-inline.patch
@@ -7,6 +7,8 @@ Author: "Potter, Tim (Cloud Services)" <timothy.potter@hp.com>
 Reviewed-by: gregor herrmann <gregoa@debian.org>
 Last-Update: 2015-07-23
 
+Upstream-Status: Pending
+
 --- a/cfg_file.y
 +++ b/cfg_file.y
 @@ -624,7 +624,7 @@
diff --git a/meta-arago-extras/recipes-connectivity/vtun/vtun/Add_search_path.patch b/meta-arago-extras/recipes-connectivity/vtun/vtun/Add_search_path.patch
index ebf83310..30808ae3 100644
--- a/meta-arago-extras/recipes-connectivity/vtun/vtun/Add_search_path.patch
+++ b/meta-arago-extras/recipes-connectivity/vtun/vtun/Add_search_path.patch
@@ -1,3 +1,6 @@
+
+Upstream-Status: Inappropriate [arago specific]
+
 --- vtun-3.0.3/configure.orig
 +++ vtun-3.0.3/configure
 @@ -5680,7 +5680,7 @@
diff --git a/meta-arago-extras/recipes-connectivity/vtun/vtun/remove_strip.patch b/meta-arago-extras/recipes-connectivity/vtun/vtun/remove_strip.patch
index 4e123931..86643877 100644
--- a/meta-arago-extras/recipes-connectivity/vtun/vtun/remove_strip.patch
+++ b/meta-arago-extras/recipes-connectivity/vtun/vtun/remove_strip.patch
@@ -1,3 +1,6 @@
+
+Upstream-Status: Inappropriate [arago specific]
+
 --- vtun-3.0.3/Makefile.orig.in
 +++ vtun-3.0.3/Makefile.in
 @@ -99,6 +99,5 @@
diff --git a/meta-arago-extras/recipes-extended/sysrepo/netopeer2-server/0001-Add-EST-Yang-Models.patch b/meta-arago-extras/recipes-extended/sysrepo/netopeer2-server/0001-Add-EST-Yang-Models.patch
index ccc68102..65c08607 100644
--- a/meta-arago-extras/recipes-extended/sysrepo/netopeer2-server/0001-Add-EST-Yang-Models.patch
+++ b/meta-arago-extras/recipes-extended/sysrepo/netopeer2-server/0001-Add-EST-Yang-Models.patch
@@ -1,3 +1,6 @@
+
+Upstream-Status: Inappropriate [arago specific]
+
 diff --git a/scripts/setup.sh b/scripts/setup.sh
 index 7bba711..4a98e66 100755
 --- a/scripts/common.sh
diff --git a/meta-arago-extras/recipes-extended/sysrepo/sysrepo-plugins-common/0001-so-version.patch b/meta-arago-extras/recipes-extended/sysrepo/sysrepo-plugins-common/0001-so-version.patch
index 0eabf6a9..5e2fc3a5 100644
--- a/meta-arago-extras/recipes-extended/sysrepo/sysrepo-plugins-common/0001-so-version.patch
+++ b/meta-arago-extras/recipes-extended/sysrepo/sysrepo-plugins-common/0001-so-version.patch
@@ -1,3 +1,6 @@
+
+Upstream-Status: Inappropriate [arago specific]
+
 diff --git a/CMakeLists.txt b/CMakeLists.txt
 index fd64b80..910510d 100644
 --- a/CMakeLists.txt
diff --git a/meta-arago-extras/recipes-graphics/devil/files/Remove-ILUT-dependency.patch b/meta-arago-extras/recipes-graphics/devil/files/Remove-ILUT-dependency.patch
index 4f0f9dfa..373fa59b 100644
--- a/meta-arago-extras/recipes-graphics/devil/files/Remove-ILUT-dependency.patch
+++ b/meta-arago-extras/recipes-graphics/devil/files/Remove-ILUT-dependency.patch
@@ -1,3 +1,6 @@
+
+Upstream-Status: Inappropriate [arago specific]
+
 diff --git a/DevIL/CMakeLists.txt b/DevIL/CMakeLists.txt
 index e342f93d..fae40167 100644
 --- a/DevIL/CMakeLists.txt
diff --git a/meta-arago-extras/recipes-graphics/ti-gc320-tests/files/0001-makefile.linux.def-relax-assignment-of-CC-and-other-.patch b/meta-arago-extras/recipes-graphics/ti-gc320-tests/files/0001-makefile.linux.def-relax-assignment-of-CC-and-other-.patch
index 0078a296..0ae5ff65 100644
--- a/meta-arago-extras/recipes-graphics/ti-gc320-tests/files/0001-makefile.linux.def-relax-assignment-of-CC-and-other-.patch
+++ b/meta-arago-extras/recipes-graphics/ti-gc320-tests/files/0001-makefile.linux.def-relax-assignment-of-CC-and-other-.patch
@@ -3,6 +3,8 @@ From: Denys Dmytriyenko <denys@ti.com>
 Date: Sun, 26 Mar 2017 14:14:49 -0400
 Subject: [PATCH] makefile.linux.def: relax assignment of CC and other tools
 
+Upstream-Status: Inappropriate [oe specific]
+
 Signed-off-by: Denys Dmytriyenko <denys@ti.com>
 ---
  tests/src/makefile.linux.def | 14 +++++++-------
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati/0001-gstducati-configure.ac-stop-using-export-symbols-reg.patch b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati/0001-gstducati-configure.ac-stop-using-export-symbols-reg.patch
index 4104e24e..c6a24c06 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati/0001-gstducati-configure.ac-stop-using-export-symbols-reg.patch
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati/0001-gstducati-configure.ac-stop-using-export-symbols-reg.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] gstducati: configure.ac stop using -export-symbols-regex
 
 The old regex is no longer correct for GStreamer 1.14.
 
+Upstream-Status: Inappropriate [arago specific]
+
 Signed-off-by: Ramprasad N <x0038811@ti.com>
 ---
  configure.ac | 2 +-
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc/0001-configure.ac-stop-using-export-symbols-regex.patch b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc/0001-configure.ac-stop-using-export-symbols-regex.patch
index c9721b70..e3df61ac 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc/0001-configure.ac-stop-using-export-symbols-regex.patch
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc/0001-configure.ac-stop-using-export-symbols-regex.patch
@@ -7,6 +7,8 @@ The old regex is no longer correct for GStreamer 1.14.
 
 Bug-Debian: https://bugs.debian.org/894642
 
+Upstream-Status: Inappropriate [arago specific]
+
 Signed-off-by: Denys Dmytriyenko <denys@ti.com>
 ---
  configure.ac | 2 +-
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/0001-gstvpe-configure.ac-stop-using-export-symbols-regex.patch b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/0001-gstvpe-configure.ac-stop-using-export-symbols-regex.patch
index d68c152b..d1739df8 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/0001-gstvpe-configure.ac-stop-using-export-symbols-regex.patch
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/0001-gstvpe-configure.ac-stop-using-export-symbols-regex.patch
@@ -12,6 +12,8 @@ undefined symbol as --export-symbols option is no more supported.
 Rename PACKAGE to vpe to get the expected symbol
 gst_plugin_vpe_get_desc
 
+Upstream-Status: Inappropriate [arago specific]
+
 Signed-off-by: Ramprasad N <x0038811@ti.com>
 ---
  configure.ac | 2 +-
diff --git a/meta-arago-extras/recipes-support/loki/libloki/0001-include-loki-SmallObj.h-ISO-C-17-does-not-allow-dyna.patch b/meta-arago-extras/recipes-support/loki/libloki/0001-include-loki-SmallObj.h-ISO-C-17-does-not-allow-dyna.patch
index acd94d13..cabde7dd 100644
--- a/meta-arago-extras/recipes-support/loki/libloki/0001-include-loki-SmallObj.h-ISO-C-17-does-not-allow-dyna.patch
+++ b/meta-arago-extras/recipes-support/loki/libloki/0001-include-loki-SmallObj.h-ISO-C-17-does-not-allow-dyna.patch
@@ -4,6 +4,8 @@ Date: Mon, 13 Feb 2023 13:11:16 -0600
 Subject: [PATCH] include/loki/SmallObj.h: ISO C++17 does not allow dynamic
  exception specifications
 
+Upstream-Status: Pending
+
 Signed-off-by: Andrew Davis <afd@ti.com>
 ---
  include/loki/SmallObj.h | 15 ++-------------
diff --git a/meta-arago-extras/recipes-support/loki/libloki/0001-include-loki-Threads.h-return-statement-with-a-value.patch b/meta-arago-extras/recipes-support/loki/libloki/0001-include-loki-Threads.h-return-statement-with-a-value.patch
index 91a78e88..3710a45b 100644
--- a/meta-arago-extras/recipes-support/loki/libloki/0001-include-loki-Threads.h-return-statement-with-a-value.patch
+++ b/meta-arago-extras/recipes-support/loki/libloki/0001-include-loki-Threads.h-return-statement-with-a-value.patch
@@ -4,6 +4,8 @@ Date: Mon, 14 Nov 2016 19:41:28 -0500
 Subject: [PATCH] include/loki/Threads.h: return-statement with a value, in
  function returning 'void'
 
+Upstream-Status: Pending
+
 Signed-off-by: Denys Dmytriyenko <denys@ti.com>
 ---
  include/loki/Threads.h | 4 ++--
diff --git a/meta-arago-extras/recipes-support/loki/libloki/0002-test-Function-FunctionTest.cpp-reference-to-bad_func.patch b/meta-arago-extras/recipes-support/loki/libloki/0002-test-Function-FunctionTest.cpp-reference-to-bad_func.patch
index 0de9f61c..3ee7d8ff 100644
--- a/meta-arago-extras/recipes-support/loki/libloki/0002-test-Function-FunctionTest.cpp-reference-to-bad_func.patch
+++ b/meta-arago-extras/recipes-support/loki/libloki/0002-test-Function-FunctionTest.cpp-reference-to-bad_func.patch
@@ -4,6 +4,8 @@ Date: Mon, 14 Nov 2016 19:55:08 -0500
 Subject: [PATCH] test/Function/FunctionTest.cpp: reference to
  'bad_function_call' is ambiguous
 
+Upstream-Status: Pending
+
 Signed-off-by: Denys Dmytriyenko <denys@ti.com>
 ---
  test/Function/FunctionTest.cpp | 2 +-
diff --git a/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-tree-config.patch b/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-tree-config.patch
index e8a02979..003d2523 100644
--- a/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-tree-config.patch
+++ b/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-out-of-tree-config.patch
@@ -7,6 +7,8 @@ header is not found due to the hard path.
 We now make the path for package header relative to our 'srcdir' so it is
 found appropriately.
 
+Upstream-Status: Inappropriate [oe specific]
+
 Signed-off-by: Awais Belal <awais_belal@mentor.com>
 ---
 diff --git a/configure.ac b/configure.ac
diff --git a/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0001-headers.h-remove-math.h-include-that-breaks-aarch64.patch b/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0001-headers.h-remove-math.h-include-that-breaks-aarch64.patch
index abd2315b..8d9e03f6 100644
--- a/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0001-headers.h-remove-math.h-include-that-breaks-aarch64.patch
+++ b/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0001-headers.h-remove-math.h-include-that-breaks-aarch64.patch
@@ -18,6 +18,8 @@ Content-Transfer-Encoding: 8bit
 |      struct __is_integer<bool>
 |             ^~~~~~~~~~~~~~~~~~
 
+Upstream-Status: Inappropriate [oe specific]
+
 Signed-off-by: Denys Dmytriyenko <denys@ti.com>
 ---
  include/headers.h | 1 -
diff --git a/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0002-fix-bool-size-m4.patch b/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0002-fix-bool-size-m4.patch
index 348e316c..a6001b10 100644
--- a/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0002-fix-bool-size-m4.patch
+++ b/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/0002-fix-bool-size-m4.patch
@@ -1,3 +1,6 @@
+
+Upstream-Status: Pending
+
 --- iperf-2.0.5/m4/dast.m4.orig	2016-06-15 11:42:03.945581785 -0400
 +++ iperf-2.0.5/m4/dast.m4	2016-06-15 11:42:11.053581641 -0400
 @@ -11,7 +11,12 @@
diff --git a/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.0.5_ManPage.patch b/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.0.5_ManPage.patch
index 12e8f463..97cf1ff4 100755
--- a/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.0.5_ManPage.patch
+++ b/meta-arago-test/recipes-benchmark/iperf/iperf-2.0.5/iperf-2.0.5_ManPage.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [arago specific]
+
 diff --git iperf-2.0.5/man/Makefile.am iperf-2.0.5/man/Makefile.am
  index ed97bc6..728873f 100644
 --- iperf-2.0.5/man/Makefile.am
diff --git a/meta-arago-test/recipes-devtools/input-utils/input-utils/0001-autoconf-fix-for-cross-compilation-for-ARM.patch b/meta-arago-test/recipes-devtools/input-utils/input-utils/0001-autoconf-fix-for-cross-compilation-for-ARM.patch
index 72308690..075920b4 100644
--- a/meta-arago-test/recipes-devtools/input-utils/input-utils/0001-autoconf-fix-for-cross-compilation-for-ARM.patch
+++ b/meta-arago-test/recipes-devtools/input-utils/input-utils/0001-autoconf-fix-for-cross-compilation-for-ARM.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] autoconf: fix for cross compilation for ARM
 * Based on changes from Yebio Mesfin fixup the input-utils to
   cross compile for ARM.
 
+Upstream-Status: Inappropriate [oe specific]
+
 Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
 ---
  mk/Autoconf.mk  |    8 ++++++--
-- 
2.17.1


