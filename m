Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id E1FB5529D1
	for <meta-arago@arago-project.org>;
	Tue,  5 Mar 2019 20:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F35A840BFC;
	Tue,  5 Mar 2019 20:50:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id NkFCmbJjviqg; Tue,  5 Mar 2019 20:50:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DAE9D40BFA;
	Tue,  5 Mar 2019 20:50:31 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 90B7116BDD9;
	Tue,  5 Mar 2019 15:50:31 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue,  5 Mar 2019 15:50:27 -0500
Message-Id: <1551819028-6530-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud][PATCH 1/2] README: indicate dependencies on thud branch of other layers
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
X-List-Received-Date: Tue, 05 Mar 2019 20:50:40 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/README | 14 +++++++-------
 meta-arago-extras/README | 12 ++++++------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta-arago-distro/README b/meta-arago-distro/README
index 03157ae..965e20f 100644
--- a/meta-arago-distro/README
+++ b/meta-arago-distro/README
@@ -1,33 +1,33 @@
 meta-arago-distro provides Arago distribution configuration for TI SDK products
 
 This layer works with the latest Yocto Project release (currently 2.2+) and tracks
-the stable/maintenance branches (currently "master") of the corresponding layers:
+the stable/maintenance branches (currently "thud") of the corresponding layers:
 
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: thud
 revision: HEAD
 layers: meta
 
 URI: git://git.openembedded.org/meta-openembedded
-branch: master
+branch: thud
 revision: HEAD
 layers: meta-oe, meta-networking, meta-python
 
 URI: git://git.yoctoproject.org/meta-ti
-branch: master
+branch: thud
 revision: HEAD
 
 URI: https://github.com/meta-qt5/meta-qt5
-branch: master
+branch: thud
 revision: HEAD
 
 URI: git://arago-project.org/git/meta-arago
-branch: master
+branch: thud
 revision: HEAD
 layers: meta-arago-extras
 
 URI: git://git.linaro.org/openembedded/meta-linaro
-branch: master
+branch: thud
 revision: HEAD
 layers: meta-linaro-toolchain, meta-optee
 
diff --git a/meta-arago-extras/README b/meta-arago-extras/README
index 62416cd..5df5376 100644
--- a/meta-arago-extras/README
+++ b/meta-arago-extras/README
@@ -1,28 +1,28 @@
 meta-arago-extras provides additional TI SDK applications that are distro-agnostic
 
 This layer works with the latest Yocto Project release (currently 2.2+) and tracks
-the stable/maintenance branches (currently "master") of the corresponding layers:
+the stable/maintenance branches (currently "thud") of the corresponding layers:
 
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: thud
 revision: HEAD
 layers: meta
 
 URI: git://git.openembedded.org/meta-openembedded
-branch: master
+branch: thud
 revision: HEAD
 layers: meta-oe, meta-networking, meta-python
 
 URI: git://git.yoctoproject.org/meta-ti
-branch: master
+branch: thud
 revision: HEAD
 
 URI: https://github.com/meta-qt5/meta-qt5
-branch: master
+branch: thud
 revision: HEAD
 
 URI: git://git.linaro.org/openembedded/meta-linaro
-branch: master
+branch: thud
 revision: HEAD
 layers: meta-linaro-toolchain
 
-- 
2.7.4


