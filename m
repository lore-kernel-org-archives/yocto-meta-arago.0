Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTP id E84BB529C3
	for <meta-arago@arago-project.org>;
	Fri, 20 Jun 2014 17:57:21 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7H0096PB757KF0@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 20 Jun 2014 12:57:06 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 62DF320184; Fri,
	20 Jun 2014 13:57:05 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 20 Jun 2014 13:56:31 -0400
Message-id: <1403287009-11256-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
In-reply-to: <1403287009-11256-1-git-send-email-denis@denix.org>
References: <1403287009-11256-1-git-send-email-denis@denix.org>
Subject: [PATCH 01/19] README: update with Daisy info
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
X-List-Received-Date: Fri, 20 Jun 2014 17:57:22 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/README | 12 ++++++------
 meta-arago-extras/README | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta-arago-distro/README b/meta-arago-distro/README
index aed3b58..05b0261 100644
--- a/meta-arago-distro/README
+++ b/meta-arago-distro/README
@@ -1,24 +1,24 @@
 meta-arago-distro provides Arago distribution configuration for TI SDK products
 
-This layer works with the latest Yocto Project release (currently 1.5) and tracks
-the stable/maintenance branches (currently "dora") of the corresponding layers:
+This layer works with the latest Yocto Project release (currently 1.6) and tracks
+the stable/maintenance branches (currently "daisy") of the corresponding layers:
 
 URI: git://git.openembedded.org/openembedded-core
-branch: dora
+branch: daisy
 revision: HEAD
 layers: meta
 
 URI: git://git.openembedded.org/meta-openembedded
-branch: dora
+branch: daisy
 revision: HEAD
 layers: meta-oe, toolchain-layer, meta-networking
 
 URI: git://arago-project.org/git/meta-ti
-branch: dora
+branch: daisy
 revision: HEAD
 
 URI: git://git.linaro.org/openembedded/meta-linaro
-branch: dora
+branch: daisy
 revision: HEAD
 layers: meta-linaro-toolchain
 
diff --git a/meta-arago-extras/README b/meta-arago-extras/README
index f303d14..1c6e8e5 100644
--- a/meta-arago-extras/README
+++ b/meta-arago-extras/README
@@ -1,24 +1,24 @@
 meta-arago-extras provides additional TI SDK applications that are distro-agnostic
 
-This layer works with the latest Yocto Project release (currently 1.5) and tracks
-the stable/maintenance branches (currently "dora") of the corresponding layers:
+This layer works with the latest Yocto Project release (currently 1.6) and tracks
+the stable/maintenance branches (currently "daisy") of the corresponding layers:
 
 URI: git://git.openembedded.org/openembedded-core
-branch: dora
+branch: daisy
 revision: HEAD
 layers: meta
 
 URI: git://git.openembedded.org/meta-openembedded
-branch: dora
+branch: daisy
 revision: HEAD
 layers: meta-oe, toolchain-layers, meta-networking
 
 URI: git://arago-project.org/git/meta-ti
-branch: dora
+branch: daisy
 revision: HEAD
 
 URI: git://git.linaro.org/openembedded/meta-linaro
-branch: dora
+branch: daisy
 revision: HEAD
 layers: meta-linaro-toolchain
 
-- 
2.0.0


