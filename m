Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 26E37529E6
	for <meta-arago@arago-project.org>;
	Fri,  1 Apr 2016 22:59:01 +0000 (UTC)
Received: from vz-proxy-l002.mx.aol.com ([64.236.82.153])
	by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O4Z003LE95X1D80@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 01 Apr 2016 17:58:46 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=_QCN6CeHC_ScWIrFMEkA:9
Received: by 100.15.86.14 with SMTP id 52bfa3ef; Fri, 01 Apr 2016 22:58:46 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 6DD08161F56;	Fri,
	1 Apr 2016 18:58:45 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 01 Apr 2016 18:58:45 -0400
Message-id: <1459551525-10397-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] qtdeclarative, qtquickcontrols: allow accessing patches locally
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
X-List-Received-Date: Fri, 01 Apr 2016 22:59:01 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-qt/qt5/qtdeclarative_%.bbappend   | 2 ++
 meta-arago-distro/recipes-qt/qt5/qtquickcontrols_%.bbappend | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtdeclarative_%.bbappend b/meta-arago-distro/recipes-qt/qt5/qtdeclarative_%.bbappend
index 96cd201..3d4d269 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtdeclarative_%.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtdeclarative_%.bbappend
@@ -1,3 +1,5 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
 SRC_URI += " \
     file://0001-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch \
 "
diff --git a/meta-arago-distro/recipes-qt/qt5/qtquickcontrols_%.bbappend b/meta-arago-distro/recipes-qt/qt5/qtquickcontrols_%.bbappend
index d666f8c..d263ff3 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtquickcontrols_%.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtquickcontrols_%.bbappend
@@ -1,3 +1,5 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
 SRC_URI += " \
     file://0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch \
 "
-- 
2.2.0


