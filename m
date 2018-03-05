Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id A384352994
	for <meta-arago@arago-project.org>;
	Mon,  5 Mar 2018 23:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3151820855;
	Mon,  5 Mar 2018 23:29:33 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 82Zz_FsjaGFI; Mon,  5 Mar 2018 23:29:33 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1359B20059;
	Mon,  5 Mar 2018 23:29:32 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id C47261632FA;
	Mon,  5 Mar 2018 18:29:31 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon,  5 Mar 2018 18:29:31 -0500
Message-Id: <1520292571-33202-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko][PATCH] README: update references to rocko
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
X-List-Received-Date: Mon, 05 Mar 2018 23:30:15 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/README | 16 ++++++++--------
 meta-arago-extras/README | 14 +++++++-------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta-arago-distro/README b/meta-arago-distro/README
index 03157ae..c1133cd 100644
--- a/meta-arago-distro/README
+++ b/meta-arago-distro/README
@@ -1,33 +1,33 @@
 meta-arago-distro provides Arago distribution configuration for TI SDK products
 
-This layer works with the latest Yocto Project release (currently 2.2+) and tracks
-the stable/maintenance branches (currently "master") of the corresponding layers:
+This layer works with the latest Yocto Project release (currently 2.4+) and tracks
+the stable/maintenance branches (currently "rocko") of the corresponding layers:
 
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: rocko
 revision: HEAD
 layers: meta
 
 URI: git://git.openembedded.org/meta-openembedded
-branch: master
+branch: rocko
 revision: HEAD
 layers: meta-oe, meta-networking, meta-python
 
 URI: git://git.yoctoproject.org/meta-ti
-branch: master
+branch: rocko
 revision: HEAD
 
 URI: https://github.com/meta-qt5/meta-qt5
-branch: master
+branch: rocko
 revision: HEAD
 
 URI: git://arago-project.org/git/meta-arago
-branch: master
+branch: rocko
 revision: HEAD
 layers: meta-arago-extras
 
 URI: git://git.linaro.org/openembedded/meta-linaro
-branch: master
+branch: rocko
 revision: HEAD
 layers: meta-linaro-toolchain, meta-optee
 
diff --git a/meta-arago-extras/README b/meta-arago-extras/README
index 62416cd..a5184b6 100644
--- a/meta-arago-extras/README
+++ b/meta-arago-extras/README
@@ -1,28 +1,28 @@
 meta-arago-extras provides additional TI SDK applications that are distro-agnostic
 
-This layer works with the latest Yocto Project release (currently 2.2+) and tracks
-the stable/maintenance branches (currently "master") of the corresponding layers:
+This layer works with the latest Yocto Project release (currently 2.4+) and tracks
+the stable/maintenance branches (currently "rocko") of the corresponding layers:
 
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: rocko
 revision: HEAD
 layers: meta
 
 URI: git://git.openembedded.org/meta-openembedded
-branch: master
+branch: rocko
 revision: HEAD
 layers: meta-oe, meta-networking, meta-python
 
 URI: git://git.yoctoproject.org/meta-ti
-branch: master
+branch: rocko
 revision: HEAD
 
 URI: https://github.com/meta-qt5/meta-qt5
-branch: master
+branch: rocko
 revision: HEAD
 
 URI: git://git.linaro.org/openembedded/meta-linaro
-branch: master
+branch: rocko
 revision: HEAD
 layers: meta-linaro-toolchain
 
-- 
2.7.4


