Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id E9B6052A27
	for <meta-arago@arago-project.org>;
	Fri,  1 Sep 2017 17:50:42 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v81HoW2c025180
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 12:50:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504288232;
	bh=lYT10BtyzjcnK0xZ0ovKQiYVnxlGt4TjdKTamEwUySo=;
	h=From:To:Subject:Date;
	b=tX6RXyWUNOH85T+9h9N5TC1SEc2alFzi8CJVGe7lw33WC6nVHzIPQJ6/R4qbv7ey7
	XAfFN7srpF/N61cV3Oq3H6zPlhPiK8eHyIJKBSSpiDkRvVqUvBNXAx07zMbbZ2BUJN
	NqgO9cI+Tyf/H5DIvT68kmhgCr2pHEuz8uYAmrHc=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81HoRnY018310
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 12:50:27 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 1 Sep 2017 12:50:27 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 1 Sep 2017 12:50:27 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81HoRYj029591
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 12:50:27 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 1 Sep 2017 13:50:22 -0400
Message-ID: <1504288223-29056-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/master][PATCH v2 1/2] matrix-gui-browser: bump SRCREV and update Description
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
X-List-Received-Date: Fri, 01 Sep 2017 17:50:43 -0000
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


