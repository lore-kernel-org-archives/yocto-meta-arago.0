Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 33A6D52A14
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2019 20:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DC49D40301;
	Fri, 25 Jan 2019 20:03:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ZiQ50Fcb-gVb; Fri, 25 Jan 2019 20:03:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2E63240B5E;
	Fri, 25 Jan 2019 20:03:37 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 44B09169B35;
	Fri, 25 Jan 2019 15:03:36 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 25 Jan 2019 15:03:22 -0500
Message-Id: <1548446604-5460-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH 1/3] meta-toolchain-arago-qte: QT_DIR_NAME is now empty in upstream meta-qt5
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
X-List-Received-Date: Fri, 25 Jan 2019 20:03:53 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
index 8cfbcfb..b03b639 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
@@ -8,8 +8,8 @@ require meta-toolchain-arago.bb
 PR = "r19"
 
 # There could be qt5, qt4e and qt4x11 providers, but we don't support qt4x11 for now
-QT_DIR_NAME = "${@oe.utils.conditional('QT_PROVIDER', 'qt5', 'qt5', 'qtopia', d)}"
-QT_BIN_PREFIX = "${@oe.utils.conditional('QT_PROVIDER', 'qt5', "${QT_DIR_NAME}/", '', d)}"
+QT_DIR_NAME = "${@oe.utils.conditional('QT_PROVIDER', 'qt5', '', 'qtopia', d)}"
+QT_BIN_PREFIX = "${@oe.utils.conditional('QT_PROVIDER', 'qt5', '', '', d)}"
 QT_BIN_SUFFIX = "${@oe.utils.conditional('QT_PROVIDER', 'qt5', '', '4', d)}"
 QT_MKSPECS_LOCATION = "${@oe.utils.conditional('QT_PROVIDER', 'qt5', "${libdir}", "${datadir}", d)}"
 QT_MKSPECS_DIR = "${@oe.utils.conditional('QT_PROVIDER', 'qt5', "linux-oe-g++", "linux-gnueabi-oe-g++", d)}"
-- 
2.7.4


