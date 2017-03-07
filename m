Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 0A5CA52A34
	for <meta-arago@arago-project.org>;
	Tue,  7 Mar 2017 19:56:16 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v27JuGJQ022498
	for <meta-arago@arago-project.org>; Tue, 7 Mar 2017 13:56:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1488916576;
	bh=UiAQ1fMp5iLzPCgRQquCDg9K/VWXIO1TP1+tg7IznfE=;
	h=From:To:CC:Subject:Date;
	b=JbtH/KsS2/uJDvQKFfLIcdIB07P6AcICeqMoFMq8ppD1YIaneYaFrAw6I+kNiqXk3
	mpqAYD17LRXK7S8wvPfuL7EFEy4wCrJLRYbO76lZxMAwUQ6IfiW5OCqzWMh7gmtoat
	xcDCOTN+H+HMzck6FfVE+7a6fuT/jYc9Tr9ZHF8g=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v27JuG9Z015381
	for <meta-arago@arago-project.org>; Tue, 7 Mar 2017 13:56:16 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 7 Mar 2017 13:56:16 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v27JuFLE018636;	Tue, 7 Mar 2017 13:56:16 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 7 Mar 2017 14:54:03 -0500
Message-ID: <1488916443-6489-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [krogoth][PATCH] opencv: clean up PACKAGECONFIG appends
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
X-List-Received-Date: Tue, 07 Mar 2017 19:56:17 -0000
Content-Type: text/plain

* add qtwayland for all but keystone
* add opencl if MACHINE_FEATURES includes opencl

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend b/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
index 2de9b96..eea040f 100644
--- a/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
+++ b/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
@@ -1,4 +1,4 @@
-PR = "r1"
+PR = "r2"
 
 BRANCH = "tiopencvrelease_3.1"
 
@@ -17,9 +17,12 @@ DEPENDS_remove_keystone = "qtbase"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PACKAGECONFIG_append_dra7xx = " opencl"
-PACKAGECONFIG_append_keystone = " opencl"
-PACKAGECONFIG_append_dra7xx = "${@bb.utils.contains("DISTRO_FEATURES", "wayland", " qtwayland", "", d)}"
+PACKAGECONFIG_QTWAYLAND = "${@bb.utils.contains("DISTRO_FEATURES", "wayland", "qtwayland", "", d)}"
+PACKAGECONFIG_QTWAYLAND_keystone = ""
+
+PACKAGECONFIG_append = " ${PACKAGECONFIG_QTWAYLAND} \
+                         ${@bb.utils.contains('MACHINE_FEATURES','opencl','opencl', '', d)} \
+"
 
 inherit cmake_qt5
 
-- 
2.7.4


