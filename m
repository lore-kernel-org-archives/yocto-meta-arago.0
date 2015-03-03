Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 5F23952A6D
	for <meta-arago@arago-project.org>;
	Tue,  3 Mar 2015 08:19:34 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.236]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NKM000Y8N43UK70@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 03 Mar 2015 02:19:16 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=QtXpBu2Y c=1 sm=1 tr=0	a=SSUdfGXV8XCffJJ8+gLrig==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=emO1SXQWCLwA:10
	a=sozttTNsAAAA:8	a=JFCdW3A0tfpWilNXZIoA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id E15B72010D;	Tue,
	3 Mar 2015 03:19:14 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 03 Mar 2015 03:19:13 -0500
Message-id: <1425370754-22484-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 1/2] qt5: rename bbappends for the new 5.4.1 version
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
X-List-Received-Date: Tue, 03 Mar 2015 08:19:34 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-qt/qt5/{qtbase_5.4.0.bbappend => qtbase_5.4.1.bbappend}       | 0
 .../recipes-qt/qt5/{qtwebkit_5.4.0.bbappend => qtwebkit_5.4.1.bbappend}   | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-distro/recipes-qt/qt5/{qtbase_5.4.0.bbappend => qtbase_5.4.1.bbappend} (100%)
 rename meta-arago-distro/recipes-qt/qt5/{qtwebkit_5.4.0.bbappend => qtwebkit_5.4.1.bbappend} (100%)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.0.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-qt/qt5/qtbase_5.4.0.bbappend
rename to meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.4.0.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.4.1.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-qt/qt5/qtwebkit_5.4.0.bbappend
rename to meta-arago-distro/recipes-qt/qt5/qtwebkit_5.4.1.bbappend
-- 
2.2.0


