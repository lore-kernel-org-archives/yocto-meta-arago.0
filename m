Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id EB4EB520E5
	for <meta-arago@arago-project.org>;
	Thu,  8 Oct 2020 23:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AC78C40BD6;
	Thu,  8 Oct 2020 23:49:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id FTUkYmT3JobB; Thu,  8 Oct 2020 23:49:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8951640020;
	Thu,  8 Oct 2020 23:49:57 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 479F0174480;
	Thu,  8 Oct 2020 19:49:57 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu,  8 Oct 2020 19:49:57 -0400
Message-Id: <1602200997-36918-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [oe-layersetup][PATCH] arago-dunfell/next: un-pin meta-arm layer
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
X-List-Received-Date: Thu, 08 Oct 2020 23:53:00 -0000

From: Denys Dmytriyenko <denys@ti.com>

It was pinned down some time ago due to baremetal toolchain conflicts, which
got resolved since.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/arago-dunfell-config.txt      | 2 +-
 configs/arago-dunfell-next-config.txt | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/arago-dunfell-config.txt b/configs/arago-dunfell-config.txt
index c9428d9..e8ad1fa 100644
--- a/configs/arago-dunfell-config.txt
+++ b/configs/arago-dunfell-config.txt
@@ -8,7 +8,7 @@ meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,HEAD,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,d13eb333bf96282c840c290c396d797da2e5e619,layers=meta-arm:meta-arm-toolchain
+meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,HEAD,layers=meta-arm:meta-arm-toolchain
 oe-core,git://git.openembedded.org/openembedded-core,dunfell,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/arago-dunfell-next-config.txt b/configs/arago-dunfell-next-config.txt
index 3f225b7..8820086 100644
--- a/configs/arago-dunfell-next-config.txt
+++ b/configs/arago-dunfell-next-config.txt
@@ -8,7 +8,7 @@ meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,dunfell-next,HEAD,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,d13eb333bf96282c840c290c396d797da2e5e619,layers=meta-arm:meta-arm-toolchain
+meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,HEAD,layers=meta-arm:meta-arm-toolchain
 oe-core,git://git.openembedded.org/openembedded-core,dunfell,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
2.7.4


