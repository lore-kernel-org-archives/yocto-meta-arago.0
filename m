Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 98B4252AA0
	for <meta-arago@arago-project.org>;
	Thu, 20 Oct 2016 02:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 30BFD20058;
	Thu, 20 Oct 2016 02:48:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id bQVecsGAsFmy; Thu, 20 Oct 2016 02:48:04 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1440920911;
	Thu, 20 Oct 2016 02:48:02 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id 3ECB7162177;
	Wed, 19 Oct 2016 22:48:02 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 19 Oct 2016 22:47:54 -0400
Message-Id: <1476931679-4689-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1476931679-4689-1-git-send-email-denis@denix.org>
References: <1476931679-4689-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 3/8] qt-vars: qt 5.7+ no longer provides fonts
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
X-List-Received-Date: Thu, 20 Oct 2016 02:48:05 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/qt-vars.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/classes/qt-vars.bbclass b/meta-arago-distro/classes/qt-vars.bbclass
index b5efee2..4c4cb11 100644
--- a/meta-arago-distro/classes/qt-vars.bbclass
+++ b/meta-arago-distro/classes/qt-vars.bbclass
@@ -11,6 +11,6 @@ QT_DEPENDS_SVG = "${@base_conditional('QT_PROVIDER', 'qt5', 'qtsvg', '', d)}"
 QT_DEPENDS_SCRIPT = "${@base_conditional('QT_PROVIDER', 'qt5', 'qtscript', '', d)}"
 
 # Run-time dependencies
-QT_RDEPENDS_FONTS = "${@base_conditional('QT_PROVIDER', 'qt5', 'qtbase-fonts', 'qt4-embedded-fonts', d)}"
+QT_RDEPENDS_FONTS = "${@base_conditional('QT_PROVIDER', 'qt5', '', 'qt4-embedded-fonts', d)}"
 QT_RDEPENDS_NATIVESDK_TOOLS = "${@base_conditional('QT_PROVIDER', 'qt5', 'nativesdk-qtbase-tools nativesdk-qttools', 'nativesdk-qt4-tools', d)}"
 QT_RDEPENDS_MKSPECS = "${@base_conditional('QT_PROVIDER', 'qt5', 'qtbase-mkspecs', 'qt4-embedded-mkspecs', d)}"
-- 
2.7.4


