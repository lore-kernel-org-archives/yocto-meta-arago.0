Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 543EA529CF
	for <meta-arago@arago-project.org>;
	Tue,  4 Nov 2014 01:43:19 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NEH00LD5RFP6X40@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 03 Nov 2014 19:43:03 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=HrPBwPXX c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=sozttTNsAAAA:8
	a=Ct2wXlCzWt7UElHsjvkA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 4909520201;	Mon,
	3 Nov 2014 20:43:01 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 03 Nov 2014 20:42:47 -0500
Message-id: <1415065371-27167-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.1.2
In-reply-to: <1415065371-27167-1-git-send-email-denis@denix.org>
References: <1415065371-27167-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/6] qtwayland: move patches from extras to distro
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
X-List-Received-Date: Tue, 04 Nov 2014 01:43:20 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-qt/qt5/qtwayland/0001-Fix-touch-with-Weston.patch             | 0
 .../0001-Wayland-can-drag-a-window-by-its-titlebar-using-the-.patch       | 0
 .../recipes-qt/qt5/qtwayland/0001-Wayland-correct-touch-location.patch    | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-arago-extras => meta-arago-distro}/recipes-qt/qt5/qtwayland/0001-Fix-touch-with-Weston.patch (100%)
 rename {meta-arago-extras => meta-arago-distro}/recipes-qt/qt5/qtwayland/0001-Wayland-can-drag-a-window-by-its-titlebar-using-the-.patch (100%)
 rename {meta-arago-extras => meta-arago-distro}/recipes-qt/qt5/qtwayland/0001-Wayland-correct-touch-location.patch (100%)

diff --git a/meta-arago-extras/recipes-qt/qt5/qtwayland/0001-Fix-touch-with-Weston.patch b/meta-arago-distro/recipes-qt/qt5/qtwayland/0001-Fix-touch-with-Weston.patch
similarity index 100%
rename from meta-arago-extras/recipes-qt/qt5/qtwayland/0001-Fix-touch-with-Weston.patch
rename to meta-arago-distro/recipes-qt/qt5/qtwayland/0001-Fix-touch-with-Weston.patch
diff --git a/meta-arago-extras/recipes-qt/qt5/qtwayland/0001-Wayland-can-drag-a-window-by-its-titlebar-using-the-.patch b/meta-arago-distro/recipes-qt/qt5/qtwayland/0001-Wayland-can-drag-a-window-by-its-titlebar-using-the-.patch
similarity index 100%
rename from meta-arago-extras/recipes-qt/qt5/qtwayland/0001-Wayland-can-drag-a-window-by-its-titlebar-using-the-.patch
rename to meta-arago-distro/recipes-qt/qt5/qtwayland/0001-Wayland-can-drag-a-window-by-its-titlebar-using-the-.patch
diff --git a/meta-arago-extras/recipes-qt/qt5/qtwayland/0001-Wayland-correct-touch-location.patch b/meta-arago-distro/recipes-qt/qt5/qtwayland/0001-Wayland-correct-touch-location.patch
similarity index 100%
rename from meta-arago-extras/recipes-qt/qt5/qtwayland/0001-Wayland-correct-touch-location.patch
rename to meta-arago-distro/recipes-qt/qt5/qtwayland/0001-Wayland-correct-touch-location.patch
-- 
2.1.2


