Return-Path: <e-ruei1@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 6DB7252A63
	for <meta-arago@arago-project.org>;
	Tue,  1 Aug 2017 19:54:20 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v71JsKlj001362
	for <meta-arago@arago-project.org>; Tue, 1 Aug 2017 14:54:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1501617260;
	bh=kEpE8L9vJqs0kKBTbnuUyzGWGg+tjntFmD7pW09cXik=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=TcN0gfvuscz2IulB7Sc+Tj4ItBHHcNRprgAti+0NeKozlzgPjUCJzR6HylmzDwgSp
	iilE9o78NiDLeVvcRhEKLg6grcbXQo7ZnC+V/BV1k0QNraSkzzWAmsQ7lGlP1QXSu0
	BmjopdxqoFRy2TCIpo2Up/vFVpGVC9hgaAEWORV8=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v71JsK7l026941
	for <meta-arago@arago-project.org>; Tue, 1 Aug 2017 14:54:20 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 1 Aug 2017 14:54:19 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v71JsAQe012102	for <meta-arago@arago-project.org>;
	Tue, 1 Aug 2017 14:54:19 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 1 Aug 2017 15:54:06 -0400
Message-ID: <1501617248-46185-3-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1501617248-46185-1-git-send-email-e-ruei1@ti.com>
References: <1501617248-46185-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
Subject: [morty/master][PATCH v2 2/4] matix-gui-browser-demos: add browser demos
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
X-List-Received-Date: Tue, 01 Aug 2017 19:54:20 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../recipes-core/matrix/matrix-gui-browser-demos_2.0.bb  | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-browser-demos_2.0.bb

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser-demos_2.0.bb
new file mode 100644
index 0000000..482991f
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser-demos_2.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Various Demo Browsers for Matrix v2"
+HOMEPAGE = "https://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps"
+
+require matrix-gui-apps-git.inc
+
+PR = "${INC_PR}.0"
+
+inherit allarch
+
+S = "${WORKDIR}/git/browser_apps"
+
+# Make sure browser submenu and app images has been installed
+RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-browser"
+
+FILES_${PN} += "${MATRIX_BASE_DIR}/*"
+FILES_${PN} += "${bindir}/runGoogleChrome.sh"
-- 
1.9.1


