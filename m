Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 41419520DE
	for <meta-arago@arago-project.org>;
	Thu, 22 Oct 2020 01:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7392F40C35;
	Thu, 22 Oct 2020 01:04:33 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id V_RbhZKnEBbL; Thu, 22 Oct 2020 01:04:33 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 560AA40C2B;
	Thu, 22 Oct 2020 01:04:32 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 7C9C117449B;
	Wed, 21 Oct 2020 21:04:31 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 21 Oct 2020 21:04:22 -0400
Message-Id: <1603328662-36316-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [oe-layersetup][PATCH] distroless/poky-master: drop meta-oe and meta-python layers, add meta-arm-toolchain
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
X-List-Received-Date: Thu, 22 Oct 2020 01:07:38 -0000

From: Denys Dmytriyenko <denys@ti.com>

There have been dependencies on meta-python and meta-oe from optee recipes in
meta-arm, but those got moved to oe-core some time ago and the corresponding
layers are no longer needed.

Also, meta-arm gained extra dependency by trusted-firmware-m for baremetal
toolchain from meta-arm-toolchain, so add that layer too.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/distroless-master-config.txt | 3 +--
 configs/poky-master-config.txt       | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/configs/distroless-master-config.txt b/configs/distroless-master-config.txt
index 0c26f7a..c8c400c 100644
--- a/configs/distroless-master-config.txt
+++ b/configs/distroless-master-config.txt
@@ -1,9 +1,8 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 bitbake,git://git.openembedded.org/bitbake,master,HEAD
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-python:meta-oe
 meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm
+meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
 oe-core,git://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local.conf.sample
diff --git a/configs/poky-master-config.txt b/configs/poky-master-config.txt
index 1298a05..1dc261f 100644
--- a/configs/poky-master-config.txt
+++ b/configs/poky-master-config.txt
@@ -2,8 +2,7 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 bitbake,git://git.openembedded.org/bitbake,master,HEAD
 poky,git://git.yoctoproject.org/poky,master,HEAD,layers=meta:meta-poky:meta-yocto-bsp
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-python:meta-oe
 meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm
+meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-poky.conf.sample
-- 
2.7.4


