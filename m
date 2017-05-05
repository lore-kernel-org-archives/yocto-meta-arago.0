Return-Path: <e-ruei1@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 322E152090
	for <meta-arago@arago-project.org>;
	Fri,  5 May 2017 23:10:07 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v45NA6gX002369
	for <meta-arago@arago-project.org>; Fri, 5 May 2017 18:10:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1494025806;
	bh=Kjgga1pCENGDEPibVHp6jt5j9n5KLA7m4HgnO4jJwo0=;
	h=From:To:Subject:Date;
	b=qFRjM7mnvKnUWEIq2arLP6lD2hYPu185cdYpspsloriGAr2F/AjljQiNY2GiaAyfu
	hWNe4Rs51C7wUIWuq4zxP6TCNLnJfbwufXDuTW1sMKqWkxzbfrBjecwKKdJuOraFO3
	Qk7Dpa5dC59+udVRHGzUrhTavKyxtwCB1LXFqfBI=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v45NA6OZ031056
	for <meta-arago@arago-project.org>; Fri, 5 May 2017 18:10:06 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 5 May 2017 18:10:06 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v45NA6ER012610	for <meta-arago@arago-project.org>;
	Fri, 5 May 2017 18:10:06 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 5 May 2017 19:10:01 -0400
Message-ID: <1494025801-22765-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] packagegroup-arago-qte: add qmlplugins and plugins of qtgraphicaleffects and qtvirtualkeyboard
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
X-List-Received-Date: Fri, 05 May 2017 23:10:08 -0000
Content-Type: text/plain

qtgraphicaleffects and qtvirtualkeyboard are required by certain QT
applications such as QT webbrowser

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
index 74fb85e..e9d7a3f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
@@ -41,6 +41,9 @@ QT5_ESSENTIALS = "\
     qtquick1-qmlplugins \
     qtquickcontrols-qmlplugins \
     qtquickcontrols2-qmlplugins \
+    qtgraphicaleffects-qmlplugins \
+    qtvirtualkeyboard-plugins \
+    qtvirtualkeyboard-qmlplugins \
     qtwebengine-qmlplugins \
     liberation-fonts \
 "
-- 
1.9.1


