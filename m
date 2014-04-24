Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id 0F86D52998
	for <meta-arago@arago-project.org>;
	Thu, 24 Apr 2014 19:14:11 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N4J00IVNURBF570@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 24 Apr 2014 14:14:10 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 83AF120091; Thu,
	24 Apr 2014 15:13:59 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 24 Apr 2014 15:13:58 -0400
Message-id: <1398366838-24825-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.9.2
Subject: [PATCH] README: correct branch names for dora dependencies
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
X-List-Received-Date: Thu, 24 Apr 2014 19:14:11 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/README | 8 ++++----
 meta-arago-extras/README | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-arago-distro/README b/meta-arago-distro/README
index eafb0f2..aed3b58 100644
--- a/meta-arago-distro/README
+++ b/meta-arago-distro/README
@@ -4,21 +4,21 @@ This layer works with the latest Yocto Project release (currently 1.5) and track
 the stable/maintenance branches (currently "dora") of the corresponding layers:
 
 URI: git://git.openembedded.org/openembedded-core
-branch: dylan
+branch: dora
 revision: HEAD
 layers: meta
 
 URI: git://git.openembedded.org/meta-openembedded
-branch: dylan
+branch: dora
 revision: HEAD
 layers: meta-oe, toolchain-layer, meta-networking
 
 URI: git://arago-project.org/git/meta-ti
-branch: dylan
+branch: dora
 revision: HEAD
 
 URI: git://git.linaro.org/openembedded/meta-linaro
-branch: dylan
+branch: dora
 revision: HEAD
 layers: meta-linaro-toolchain
 
diff --git a/meta-arago-extras/README b/meta-arago-extras/README
index dd61e6d..f303d14 100644
--- a/meta-arago-extras/README
+++ b/meta-arago-extras/README
@@ -4,21 +4,21 @@ This layer works with the latest Yocto Project release (currently 1.5) and track
 the stable/maintenance branches (currently "dora") of the corresponding layers:
 
 URI: git://git.openembedded.org/openembedded-core
-branch: dylan
+branch: dora
 revision: HEAD
 layers: meta
 
 URI: git://git.openembedded.org/meta-openembedded
-branch: dylan
+branch: dora
 revision: HEAD
 layers: meta-oe, toolchain-layers, meta-networking
 
 URI: git://arago-project.org/git/meta-ti
-branch: dylan
+branch: dora
 revision: HEAD
 
 URI: git://git.linaro.org/openembedded/meta-linaro
-branch: dylan
+branch: dora
 revision: HEAD
 layers: meta-linaro-toolchain
 
-- 
1.9.2


