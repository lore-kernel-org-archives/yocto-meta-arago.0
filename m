Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by arago-project.org (Postfix) with ESMTP id EDA1B52AB0
	for <meta-arago@arago-project.org>;
	Mon, 14 Oct 2013 00:35:55 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MUM00J09UZ7J5D0@vms173007.mailsrvcs.net> for
	meta-arago@arago-project.org; Sun, 13 Oct 2013 19:35:32 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id EF87E21C1D; Sun,
	13 Oct 2013 20:35:30 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sun, 13 Oct 2013 20:35:23 -0400
Message-id: <1381710923-22471-10-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1381710923-22471-1-git-send-email-denis@denix.org>
References: <1381710923-22471-1-git-send-email-denis@denix.org>
Subject: [PATCH 9/9] README: update dependency information for dylan base
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
X-List-Received-Date: Mon, 14 Oct 2013 00:35:56 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/README | 17 +++++++++++------
 meta-arago-extras/README | 17 +++++++++++------
 2 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/meta-arago-distro/README b/meta-arago-distro/README
index f966cea..c7f505e 100644
--- a/meta-arago-distro/README
+++ b/meta-arago-distro/README
@@ -1,22 +1,27 @@
 meta-arago-distro provides Arago distribution configuration for TI SDK products
 
-This layer works with the latest Yocto Project release (currently 1.3) and tracks
-the stable/maintenance branches (currently "danny") of the corresponding layers:
+This layer works with the latest Yocto Project release (currently 1.4) and tracks
+the stable/maintenance branches (currently "dylan") of the corresponding layers:
 
 URI: git://git.openembedded.org/openembedded-core
-branch: danny
+branch: dylan
 revision: HEAD
 layers: meta
 
 URI: git://git.openembedded.org/meta-openembedded
-branch: danny
+branch: dylan
 revision: HEAD
-layers: meta-oe, toolchain-layer
+layers: meta-oe, toolchain-layer, meta-networking
 
 URI: git://arago-project.org/git/meta-ti
-branch: danny
+branch: dylan
 revision: HEAD
 
+URI: git://git.linaro.org/openembedded/meta-linaro
+branch: dylan
+revision: HEAD
+layers: meta-linaro-toolchain
+
 Send pull requests to meta-arago@arago-project.org
 
 Layer maintainers: Chase Maupin <chase.maupin@ti.com>
diff --git a/meta-arago-extras/README b/meta-arago-extras/README
index 52eaed4..3ec39da 100644
--- a/meta-arago-extras/README
+++ b/meta-arago-extras/README
@@ -1,22 +1,27 @@
 meta-arago-extras provides additional TI SDK applications that are distro-agnostic
 
-This layer works with the latest Yocto Project release (currently 1.3) and tracks
-the stable/maintenance branches (currently "danny") of the corresponding layers:
+This layer works with the latest Yocto Project release (currently 1.4) and tracks
+the stable/maintenance branches (currently "dylan") of the corresponding layers:
 
 URI: git://git.openembedded.org/openembedded-core
-branch: danny
+branch: dylan
 revision: HEAD
 layers: meta
 
 URI: git://git.openembedded.org/meta-openembedded
-branch: danny
+branch: dylan
 revision: HEAD
-layers: meta-oe, toolchain-layers
+layers: meta-oe, toolchain-layers, meta-networking
 
 URI: git://arago-project.org/git/meta-ti
-branch: danny
+branch: dylan
 revision: HEAD
 
+URI: git://git.linaro.org/openembedded/meta-linaro
+branch: dylan
+revision: HEAD
+layers: meta-linaro-toolchain
+
 Send pull requests to meta-arago@arago-project.org
 
 Layer maintainers: Chase Maupin <chase.maupin@ti.com>
-- 
1.8.3.2


