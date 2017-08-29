Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 34C7652ABA
	for <meta-arago@arago-project.org>;
	Tue, 29 Aug 2017 14:50:47 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7TEobMi027208
	for <meta-arago@arago-project.org>; Tue, 29 Aug 2017 09:50:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504018237;
	bh=vpiE6jjtNDH6y4Tl4NSzrcdrg4+JQVh8mmbP9btx7N4=;
	h=From:To:Subject:Date;
	b=QBn8xd6fNi7RKPNh1IsrA+wKHsYYzpESmwnS+yURlPQvoLxAbSMkNqNMsFXG0ckUE
	D2DO9r5zcR7gE1uflEbUQBLjGhGEc15EDG80MPscCQ6wtMd42XBxBI6glD6c/y7SbP
	4feFFgM4wRfbrS9/vX3Rpc6zxwu89HPJNlpLGFaQ=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7TEoWSe031855
	for <meta-arago@arago-project.org>; Tue, 29 Aug 2017 09:50:32 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 29 Aug 2017 09:50:31 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 29 Aug 2017 09:50:31 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7TEoV9f022771
	for <meta-arago@arago-project.org>; Tue, 29 Aug 2017 09:50:31 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 29 Aug 2017 10:50:27 -0400
Message-ID: <1504018227-58339-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [matrix-gui-v2-apps][PATCH v2] qt5_browser & browser_apps: replace webkit-based demo browsers with webengine-based ones
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
X-List-Received-Date: Tue, 29 Aug 2017 14:50:47 -0000
Content-Type: text/plain

Replace webkit-based demo browser because webkit is obsolete and will be
removed soon.

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../browser_webengine.desktop}                                      | 6 +++---
 qt5_apps/qt5_browser/qt5_browser.desktop                            | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename browser_apps/{browser_webkit/browser_webkit.desktop => browser_webengine/browser_webengine.desktop} (56%)

diff --git a/browser_apps/browser_webkit/browser_webkit.desktop b/browser_apps/browser_webengine/browser_webengine.desktop
similarity index 56%
rename from browser_apps/browser_webkit/browser_webkit.desktop
rename to browser_apps/browser_webengine/browser_webengine.desktop
index 7140a4b..53b95ca 100644
--- a/browser_apps/browser_webkit/browser_webkit.desktop
+++ b/browser_apps/browser_webengine/browser_webengine.desktop
@@ -1,12 +1,12 @@
 #!/usr/bin/env xdg-open
 
 [Desktop Entry]
-Name=Webkit Browser
+Name=WebEngine Browser
 GenericName=Demo App
 Icon=/usr/share/matrix-gui-2.0/apps/images/web-icon.png
-Exec=/usr/share/qt5/examples/webkitwidgets/browser/browser http://www.ti.com
+Exec=/usr/share/qt5/examples/webenginewidgets/demobrowser/demobrowser http://www.ti.com
 Type=Application
 ProgramType=gui
 Categories=Browser
 X-MATRIX-Lock=browser
-Name[en_US]=browser_webkit.desktop
+Name[en_US]=browser_webengine.desktop
diff --git a/qt5_apps/qt5_browser/qt5_browser.desktop b/qt5_apps/qt5_browser/qt5_browser.desktop
index 2f6636f..a5d3953 100644
--- a/qt5_apps/qt5_browser/qt5_browser.desktop
+++ b/qt5_apps/qt5_browser/qt5_browser.desktop
@@ -4,7 +4,7 @@
 Name=Browser
 GenericName=Demo App
 Icon=/usr/share/matrix-gui-2.0/apps/images/web-icon.png
-Exec=/usr/share/qt5/examples/webkitwidgets/browser/browser http://www.ti.com
+Exec=/usr/share/qt5/examples/webenginewidgets/demobrowser/demobrowser http://www.ti.com
 Type=Application
 ProgramType=gui
 Categories=Qt5
-- 
1.9.1


