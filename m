Return-Path: <karthik.ramanan@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id C70FA529C2
	for <meta-arago@arago-project.org>;
	Tue, 23 Sep 2014 15:53:56 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8NFruLS018439
	for <meta-arago@arago-project.org>; Tue, 23 Sep 2014 10:53:56 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8NFrt7H017736
	for <meta-arago@arago-project.org>; Tue, 23 Sep 2014 10:53:55 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 23 Sep 2014 10:53:55 -0500
Received: from zubuntu.apr.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s8NFrk2K024814;	Tue, 23 Sep 2014 10:53:55 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 23 Sep 2014 21:20:26 +0530
Message-ID: <1411487426-31949-6-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1411487426-31949-1-git-send-email-a0393906@ti.com>
References: <1411487426-31949-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [for master 5/5] omapdrmtest: Added new tests and bug fixes.
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
X-List-Received-Date: Tue, 23 Sep 2014 15:53:57 -0000
Content-Type: text/plain

Contains the following changes:
* Updated dependent package list
* Addition of encoder tests
* Bug fixes

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../omapdrmtest/omapdrmtest_1.0.0.bb               |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
index d24130f..04fc2e7 100644
--- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
@@ -2,12 +2,12 @@ DESCRIPTION = "Test applications for OMAP DRM interface"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://viddec3test.c;beginline=1;endline=16;md5=c391f44e40a29096285e3121923041df"
-DEPENDS += "libdrm libdce libav"
+DEPENDS += "libav libdce libdrm libgbm omap5-sgx-ddk-um-linux"
 
 inherit autotools pkgconfig
 
-PR = "r3"
-SRCREV = "64e4e389dd8be4947c107a057f34556a4280281a"
+PR = "r4"
+SRCREV = "04da689692ec7cd3ef0f315c9c00d9051cefdd10"
 
 SRC_URI = "git://git.ti.com/glsdk/omapdrmtest.git;protocol=git"
 
-- 
1.7.9.5


