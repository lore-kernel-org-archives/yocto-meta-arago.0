Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTP id 2A47052A2F
	for <meta-arago@arago-project.org>;
	Wed, 16 Jul 2014 18:58:35 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N8T00ENTJCSOZA0@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 16 Jul 2014 13:58:19 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 2276220120; Wed,
	16 Jul 2014 14:58:04 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 16 Jul 2014 14:58:02 -0400
Message-id: <1405537082-11326-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
Subject: [dora][PATCH] qt5: rename bbappends back to 5.1.1 version in Dora
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
X-List-Received-Date: Wed, 16 Jul 2014 18:58:35 -0000

From: Denys Dmytriyenko <denys@ti.com>

During recent development that led to Daisy release, bbappends were renamed
to match then current version 5.2.0. Since now Dora has been branched off
and master tracks Daisy, we can rename those bbappends back to 5.1.1 to
match the version available in meta-qt5/dora.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-qt/qt5/{qtbase_5.2.0.bbappend => qtbase_5.1.1.bbappend}       | 0
 .../recipes-qt/qt5/{qtwebkit_5.2.0.bbappend => qtwebkit_5.1.1.bbappend}   | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-distro/recipes-qt/qt5/{qtbase_5.2.0.bbappend => qtbase_5.1.1.bbappend} (100%)
 rename meta-arago-distro/recipes-qt/qt5/{qtwebkit_5.2.0.bbappend => qtwebkit_5.1.1.bbappend} (100%)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.0.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_5.1.1.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-qt/qt5/qtbase_5.2.0.bbappend
rename to meta-arago-distro/recipes-qt/qt5/qtbase_5.1.1.bbappend
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.2.0.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.1.1.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-qt/qt5/qtwebkit_5.2.0.bbappend
rename to meta-arago-distro/recipes-qt/qt5/qtwebkit_5.1.1.bbappend
-- 
2.0.0


