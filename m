Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id AB49A529CD
	for <meta-arago@arago-project.org>;
	Tue,  5 Sep 2017 23:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3A1CD20A31;
	Tue,  5 Sep 2017 23:09:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 6ygn6-YShK_K; Tue,  5 Sep 2017 23:09:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0EF3F2005C;
	Tue,  5 Sep 2017 23:09:54 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 84C5E1625EC;
	Tue,  5 Sep 2017 19:09:53 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue,  5 Sep 2017 19:09:49 -0400
Message-Id: <1504652992-35063-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH 1/4] qt-vars: add QtWebEngine dependency variable
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
X-List-Received-Date: Tue, 05 Sep 2017 23:09:56 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/qt-vars.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/classes/qt-vars.bbclass b/meta-arago-distro/classes/qt-vars.bbclass
index 4c4cb11..866b5ad 100644
--- a/meta-arago-distro/classes/qt-vars.bbclass
+++ b/meta-arago-distro/classes/qt-vars.bbclass
@@ -9,6 +9,7 @@ QT_DEPENDS_BASE = "${@base_conditional('QT_PROVIDER', 'qt5', 'qtbase', 'qt4-embe
 QT_DEPENDS_WEBKIT = "${@base_conditional('QT_PROVIDER', 'qt5', 'qtwebkit', '', d)}"
 QT_DEPENDS_SVG = "${@base_conditional('QT_PROVIDER', 'qt5', 'qtsvg', '', d)}"
 QT_DEPENDS_SCRIPT = "${@base_conditional('QT_PROVIDER', 'qt5', 'qtscript', '', d)}"
+QT_DEPENDS_WEBENGINE = "${@base_conditional('QT_PROVIDER', 'qt5', 'qtwebengine', '', d)}"
 
 # Run-time dependencies
 QT_RDEPENDS_FONTS = "${@base_conditional('QT_PROVIDER', 'qt5', '', 'qt4-embedded-fonts', d)}"
-- 
2.7.4


