Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 63C5752AB0
	for <meta-arago@arago-project.org>;
	Sat,  3 Apr 2021 00:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 10F7340BE9;
	Sat,  3 Apr 2021 00:11:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id CCPGIcv7sJzk; Sat,  3 Apr 2021 00:11:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 11F0B40C99;
	Sat,  3 Apr 2021 00:11:03 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 5016A174591;
	Fri,  2 Apr 2021 20:11:01 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri,  2 Apr 2021 20:10:40 -0400
Message-Id: <1617408644-2675-26-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617408644-2675-1-git-send-email-denis@denix.org>
References: <1617408644-2675-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 25/29] kms++: update to the latest
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
X-List-Received-Date: Sat, 03 Apr 2021 00:11:02 -0000

From: Denys Dmytriyenko <denys@konsulko.com>

kms++ has moved from cmake to meson and has issues locating pybind11 dependency
in recipe-sysroot. This causes Python bindings to be skipped and not packaged
into kms++-python, normally used by testing process.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-extras/recipes-graphics/kms++/kms++_git.bb | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
index 3d94632..e126df9 100644
--- a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
+++ b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
@@ -4,13 +4,17 @@ LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
 
 PV = "2.1"
-PR = "r0"
+PR = "r1"
 
 BRANCH = "master"
 SRC_URI = "git://github.com/tomba/kmsxx.git;protocol=git;branch=${BRANCH}"
-SRCREV = "626edbe2fc845803ffdd25936e21202e4f123b63"
+SRCREV = "5afc8d918f2c084acd65027604868dfde43395cf"
 
-DEPENDS = "drm python3-pybind11"
+DEPENDS = "drm fmt"
+
+# New meson build system fails to find pybind11 in sysroot, disable for now
+#DEPENDS += "python3-pybind11"
+#EXTRA_OEMESON = "-Dsystem-pybind11=enabled"
 
 PACKAGES =+ "${PN}-python"
 
@@ -20,7 +24,7 @@ FILES_${PN}-python += "${libdir}/python*/site-packages"
 
 S = "${WORKDIR}/git"
 
-inherit python3native cmake update-alternatives
+inherit python3native meson update-alternatives
 
 ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_${PN} = "kmstest"
-- 
2.7.4


