Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 2045252AB8
	for <meta-arago@arago-project.org>;
	Tue, 29 Aug 2017 16:06:12 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7TG62WX005795
	for <meta-arago@arago-project.org>; Tue, 29 Aug 2017 11:06:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504022762;
	bh=lYT10BtyzjcnK0xZ0ovKQiYVnxlGt4TjdKTamEwUySo=;
	h=From:To:Subject:Date;
	b=Lh+z5E08g1SLwbHbbup1s+bTxX7fmHxvT8yH+WofFlXsq9nOIZ3AFKrzFRrMT7gol
	tW22u9lPnYbC8Bp1/nNKomnsGY5tVXy1RcrAppzfYirjgJWTBV+ad6om0pX5ksu1kI
	ncqvJymIFN7BpUdCm6vYc9ctpZRqeNmcMs+6ghmY=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7TG5ukq016883
	for <meta-arago@arago-project.org>; Tue, 29 Aug 2017 11:05:57 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 29 Aug 2017 11:05:55 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 29 Aug 2017 11:05:55 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7TG5tDq011739
	for <meta-arago@arago-project.org>; Tue, 29 Aug 2017 11:05:55 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 29 Aug 2017 12:05:52 -0400
Message-ID: <1504022753-20132-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/master][PATCH 1/2] matrix-gui-browser: bump SRCREV and update Description
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
X-List-Received-Date: Tue, 29 Aug 2017 16:06:12 -0000
Content-Type: text/plain

* update the brower to be Webengine-based instead of Webkit-based

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
index 0fa1a62..1f91f57 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Simple Qt web display using webkit"
+DESCRIPTION = "Simple Qt web display using webengine"
 HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix_browser"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://main.cpp;beginline=9;endline=37;md5=75a9adc782a6df0d3a5419743e9a9f18"
@@ -11,10 +11,10 @@ RDEPENDS_${PN} += "${QT_RDEPENDS_FONTS}"
 
 DEPENDS += "${QT_DEPENDS_WEBKIT}"
 
-PR = "r13"
+PR = "r14"
 
 QT4_SRCREV = "83019b46fb3dec1a12667d251d35ba8682953a79"
-QT5_SRCREV = "78ad5db716d1abc4c05abfe435f066b6b88454d5"
+QT5_SRCREV = "d3ecf8d0dff3e4f901d588ea0dfe485733dfc9dc"
 
 SRCREV = "${@base_conditional('QT_PROVIDER', 'qt5', "${QT5_SRCREV}", "${QT4_SRCREV}", d)}"
 BRANCH ?= "master"
-- 
1.9.1


