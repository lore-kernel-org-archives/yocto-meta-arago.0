Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 505525296D
	for <meta-arago@arago-project.org>;
	Tue, 16 Oct 2018 04:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 552B720D08;
	Tue, 16 Oct 2018 04:05:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id rKY9lgE2NC-E; Tue, 16 Oct 2018 04:05:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2C9B320CC4;
	Tue, 16 Oct 2018 04:05:22 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 9D23D164802;
	Tue, 16 Oct 2018 00:05:21 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 16 Oct 2018 00:05:20 -0400
Message-Id: <1539662721-45556-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH 1/2] qt-vars.bbclass: nativesdk-qtbase no longer produces tools package
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
X-List-Received-Date: Tue, 16 Oct 2018 04:05:33 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/classes/qt-vars.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/classes/qt-vars.bbclass b/meta-arago-extras/classes/qt-vars.bbclass
index 83e4360..5a8cc79 100644
--- a/meta-arago-extras/classes/qt-vars.bbclass
+++ b/meta-arago-extras/classes/qt-vars.bbclass
@@ -13,5 +13,5 @@ QT_DEPENDS_WEBENGINE = "${@oe.utils.conditional('QT_PROVIDER', 'qt5', 'qtwebengi
 
 # Run-time dependencies
 QT_RDEPENDS_FONTS = "${@oe.utils.conditional('QT_PROVIDER', 'qt5', '', 'qt4-embedded-fonts', d)}"
-QT_RDEPENDS_NATIVESDK_TOOLS = "${@oe.utils.conditional('QT_PROVIDER', 'qt5', 'nativesdk-qtbase-tools nativesdk-qttools', 'nativesdk-qt4-tools', d)}"
+QT_RDEPENDS_NATIVESDK_TOOLS = "${@oe.utils.conditional('QT_PROVIDER', 'qt5', 'nativesdk-qtbase nativesdk-qttools', 'nativesdk-qt4-tools', d)}"
 QT_RDEPENDS_MKSPECS = "${@oe.utils.conditional('QT_PROVIDER', 'qt5', 'qtbase-mkspecs', 'qt4-embedded-mkspecs', d)}"
-- 
2.7.4


