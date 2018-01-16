Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 702B452A60
	for <meta-arago@arago-project.org>;
	Tue, 16 Jan 2018 02:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C4F3020B99;
	Tue, 16 Jan 2018 02:17:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id gY5yrhDDTRce; Tue, 16 Jan 2018 02:17:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A8E7220B93;
	Tue, 16 Jan 2018 02:17:03 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 3C479163266;
	Mon, 15 Jan 2018 21:17:03 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon, 15 Jan 2018 21:17:02 -0500
Message-Id: <1516069022-80006-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] qtwebengine: explicitly depend on bison-native
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
X-List-Received-Date: Tue, 16 Jan 2018 02:17:18 -0000

The fix was submitted upstream to meta-qt5 - overlay locally until it gets
backported to rocko.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend
index 664fdf9..a64231d 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend
@@ -7,3 +7,5 @@ SRC_URI += " \
     file://0002-qtwebengine-set-default-logging-level-back-to-LOG_FA.patch \
     file://0003-qtwebengine-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch \
 "
+
+DEPENDS += "bison-native"
-- 
2.7.4


