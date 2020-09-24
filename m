Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 21A5152982
	for <meta-arago@arago-project.org>;
	Thu, 24 Sep 2020 01:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 98DD340BD1;
	Thu, 24 Sep 2020 01:07:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id NacxPW6gTDwN; Thu, 24 Sep 2020 01:07:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 848FE40B96;
	Thu, 24 Sep 2020 01:07:55 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 4CBCB17446E;
	Wed, 23 Sep 2020 21:07:55 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 23 Sep 2020 21:07:55 -0400
Message-Id: <1600909675-39661-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [dunfell][PATCH] README: fix branch name for dunfell
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
X-List-Received-Date: Thu, 24 Sep 2020 01:10:54 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/README | 14 +++++++-------
 meta-arago-extras/README | 12 ++++++------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta-arago-distro/README b/meta-arago-distro/README
index 0e09d31..cf37459 100644
--- a/meta-arago-distro/README
+++ b/meta-arago-distro/README
@@ -1,33 +1,33 @@
 meta-arago-distro provides Arago distribution configuration for TI SDK products
 
 This layer works with the latest Yocto Project release (currently 2.2+) and tracks
-the stable/maintenance branches (currently "master") of the corresponding layers:
+the stable/maintenance branches (currently "dunfell") of the corresponding layers:
 
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: dunfell
 revision: HEAD
 layers: meta
 
 URI: git://git.yoctoproject.org/meta-ti
-branch: master
+branch: dunfell
 revision: HEAD
 
 URI: git://git.yoctoproject.org/meta-arm
-branch: master
+branch: dunfell
 revision: HEAD
 layers: meta-arm, meta-arm-toolchain
 
 URI: git://git.openembedded.org/meta-openembedded
-branch: master
+branch: dunfell
 revision: HEAD
 layers: meta-oe, meta-networking, meta-python
 
 URI: https://github.com/meta-qt5/meta-qt5
-branch: master
+branch: dunfell
 revision: HEAD
 
 URI: git://arago-project.org/git/meta-arago
-branch: master
+branch: dunfell
 revision: HEAD
 layers: meta-arago-extras
 
diff --git a/meta-arago-extras/README b/meta-arago-extras/README
index 25d564e..b0eb76c 100644
--- a/meta-arago-extras/README
+++ b/meta-arago-extras/README
@@ -1,29 +1,29 @@
 meta-arago-extras provides additional TI SDK applications that are distro-agnostic
 
 This layer works with the latest Yocto Project release (currently 2.2+) and tracks
-the stable/maintenance branches (currently "master") of the corresponding layers:
+the stable/maintenance branches (currently "dunfell") of the corresponding layers:
 
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: dunfell
 revision: HEAD
 layers: meta
 
 URI: git://git.yoctoproject.org/meta-ti
-branch: master
+branch: dunfell
 revision: HEAD
 
 URI: git://git.yoctoproject.org/meta-arm
-branch: master
+branch: dunfell
 revision: HEAD
 layers: meta-arm, meta-arm-toolchain
 
 URI: git://git.openembedded.org/meta-openembedded
-branch: master
+branch: dunfell
 revision: HEAD
 layers: meta-oe, meta-networking, meta-python
 
 URI: https://github.com/meta-qt5/meta-qt5
-branch: master
+branch: dunfell
 revision: HEAD
 
 Send pull requests to meta-arago@arago-project.org
-- 
2.7.4


