Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 648AD52993
	for <meta-arago@arago-project.org>;
	Thu, 13 Sep 2018 13:00:58 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8DD0oVc021806
	for <meta-arago@arago-project.org>; Thu, 13 Sep 2018 08:00:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536843650;
	bh=9Sj4LeRwITmRJesChawN4yfk4n/diLgHQhHD2tjRn8k=;
	h=From:To:Subject:Date;
	b=FNhpxBgcX7FIFmL1BTTWcg5km0m7RjpaL2Bn+KNxcAEUivLVmEbKZID5ebBice/8z
	rKhATwvKhbde6gUHQ3f8zjx8YqivPjOeqH6GIK+WWlOwr5206e98PVX6I21c9eo2ta
	RurkzAkxFgOG4GiOqRcwEUa3OYGyZh/Hh07YfFU0=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DD0ndj016639
	for <meta-arago@arago-project.org>; Thu, 13 Sep 2018 08:00:50 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 13 Sep 2018 08:00:47 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 13 Sep 2018 08:00:46 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DD0kBi009720
	for <meta-arago@arago-project.org>; Thu, 13 Sep 2018 08:00:46 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 13 Sep 2018 09:00:42 -0400
Message-ID: <1536843642-41755-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [matrix-gui-v2-apps][PATCH] add qt5 webkit-based browser app
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
X-List-Received-Date: Thu, 13 Sep 2018 13:00:59 -0000
Content-Type: text/plain

The default browser app is webengine-based. This patch adds a webkit-based
browser which may be required for some SoCs.

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 qt5_apps/qt5_webkit_browser/qt5_webkit_browser.desktop | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 qt5_apps/qt5_webkit_browser/qt5_webkit_browser.desktop

diff --git a/qt5_apps/qt5_webkit_browser/qt5_webkit_browser.desktop b/qt5_apps/qt5_webkit_browser/qt5_webkit_browser.desktop
new file mode 100644
index 0000000..f259c01
--- /dev/null
+++ b/qt5_apps/qt5_webkit_browser/qt5_webkit_browser.desktop
@@ -0,0 +1,12 @@
+#!/usr/bin/env xdg-open
+
+[Desktop Entry]
+Name=Browser
+GenericName=Demo App
+Icon=/usr/share/matrix-gui-2.0/apps/images/web-icon.png
+Exec=/usr/share/qt5/examples/webkitwidgets/browser/browser http://www.ti.com
+Type=Application
+ProgramType=gui
+Categories=Qt5
+X-MATRIX-Lock=qt
+Name[en_US]=qt5_webkit_browser.desktop
-- 
1.9.1


