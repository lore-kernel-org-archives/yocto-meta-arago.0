Return-Path: <karthik.ramanan@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id D70515299A
	for <meta-arago@arago-project.org>;
	Tue, 14 Mar 2017 11:42:59 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2EBgnYO014514
	for <meta-arago@arago-project.org>; Tue, 14 Mar 2017 06:42:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489491769;
	bh=31Nv8Ve2Q9OKlwyrCt8rWC4Rbp3RX2P9QtFZm/w5Db4=;
	h=From:To:CC:Subject:Date;
	b=a1e0Hke9FfS1L/M6j79O3v69Oi66SYdqBtP1S7HFDmqdw04abFxzamED3fSh8dbZv
	r3wi/3YBguxLcpKl5Ec5F6XQIT1nkhRW1EhDyfiSUxYBFNIm3Xb8uQluhqHLGoQIc2
	H/m1oNorMRtD4JVeKssjRJ4H/E+wvPLpU/sHFC2c=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2EBgi2G022079
	for <meta-arago@arago-project.org>; Tue, 14 Mar 2017 06:42:44 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 14 Mar 2017 06:42:44 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2EBgeq4031814;
	Tue, 14 Mar 2017 06:42:42 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 14 Mar 2017 17:12:37 +0530
Message-ID: <1489491757-83601-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [master] omapdrmtest: Update tests to handle disabled HDMI
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
X-List-Received-Date: Tue, 14 Mar 2017 11:43:00 -0000
Content-Type: text/plain

Pre-requisities: this is applicable for kernel 4.9

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb              | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
index 793e9b5..bb787ec 100644
--- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
@@ -7,13 +7,14 @@ DEPENDS = "ffmpeg libdce libdrm libgbm ti-sgx-ddk-um wayland"
 
 inherit autotools pkgconfig
 
-PR = "r19"
-SRCREV = "47bbb6b2ec48bbee35f9dc7192c05e48fd1a2589"
+PR = "r21"
+SRCREV = "809e72b2c5ebe45bb7ba13bcfe964b1ef69f98f0"
 
 EXTRA_OEMAKE = "CC="${CC}""
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 SRC_URI = "git://git.ti.com/glsdk/omapdrmtest.git;protocol=git \
-           file://0001-configure.ac-also-check-for-libavcodec-library.patch"
+           file://0001-configure.ac-also-check-for-libavcodec-library.patch \
+"
 
 S = "${WORKDIR}/git"
-- 
1.9.1


