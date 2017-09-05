Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id AF2B4529D0
	for <meta-arago@arago-project.org>;
	Tue,  5 Sep 2017 23:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3493B209AE;
	Tue,  5 Sep 2017 23:09:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id A84Iagz8Lk1K; Tue,  5 Sep 2017 23:09:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1164D208FB;
	Tue,  5 Sep 2017 23:09:54 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 902FD1625ED;
	Tue,  5 Sep 2017 19:09:53 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue,  5 Sep 2017 19:09:50 -0400
Message-Id: <1504652992-35063-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1504652992-35063-1-git-send-email-denys@ti.com>
References: <1504652992-35063-1-git-send-email-denys@ti.com>
Subject: [morty/master][PATCH 2/4] matrix-gui-browser: Matrix browser is now QtWebEngine based, update DEPENDS
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
 meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
index 1f91f57..0455962 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
@@ -9,9 +9,9 @@ inherit qt-provider
 # Make sure that QT font libraries have been installed
 RDEPENDS_${PN} += "${QT_RDEPENDS_FONTS}"
 
-DEPENDS += "${QT_DEPENDS_WEBKIT}"
+DEPENDS += "${QT_DEPENDS_WEBENGINE}"
 
-PR = "r14"
+PR = "r15"
 
 QT4_SRCREV = "83019b46fb3dec1a12667d251d35ba8682953a79"
 QT5_SRCREV = "d3ecf8d0dff3e4f901d588ea0dfe485733dfc9dc"
-- 
2.7.4


