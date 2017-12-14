Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 6F56552985
	for <meta-arago@arago-project.org>;
	Thu, 14 Dec 2017 20:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DD96720B2C;
	Thu, 14 Dec 2017 20:01:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Ezojul_leZSk; Thu, 14 Dec 2017 20:01:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BBB0D20AD6;
	Thu, 14 Dec 2017 20:00:59 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 57F22162770;
	Thu, 14 Dec 2017 15:00:59 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 14 Dec 2017 15:00:58 -0500
Message-Id: <1513281658-4302-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1513281658-4302-1-git-send-email-denys@ti.com>
References: <1513281658-4302-1-git-send-email-denys@ti.com>
Subject: [morty/master][PATCH 2/2] qt-provider, qt-vars: set class defaults to qt5
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
X-List-Received-Date: Thu, 14 Dec 2017 20:01:02 -0000

While qt4e is being deprecated, keep the support for now, but use qt5 by default.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/classes/qt-provider.bbclass | 2 +-
 meta-arago-extras/classes/qt-vars.bbclass     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/classes/qt-provider.bbclass b/meta-arago-extras/classes/qt-provider.bbclass
index a0dbdef..40ec7a0 100644
--- a/meta-arago-extras/classes/qt-provider.bbclass
+++ b/meta-arago-extras/classes/qt-provider.bbclass
@@ -7,7 +7,7 @@
 # 3. May need to use below QT_DEPENDS_* and QT_RDEPENDS_* variables
 #    instead of the actual Qt-version specific values
 
-QT_PROVIDER ?= "qt4e"
+QT_PROVIDER ?= "qt5"
 
 inherit ${QT_PROVIDER}
 inherit qt-vars
diff --git a/meta-arago-extras/classes/qt-vars.bbclass b/meta-arago-extras/classes/qt-vars.bbclass
index 866b5ad..d516a69 100644
--- a/meta-arago-extras/classes/qt-vars.bbclass
+++ b/meta-arago-extras/classes/qt-vars.bbclass
@@ -1,6 +1,6 @@
 # Class to define many useful variables that differ between Qt4 and Qt5
 
-QT_PROVIDER ?= "qt4e"
+QT_PROVIDER ?= "qt5"
 
 # Build-time dependencies - those are now separate modules in Qt5 and
 # require separate dependencies, unlike Qt4 that provides everything
-- 
2.7.4


