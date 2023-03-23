Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8188FC7619A
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 13:50:30 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.72698.1679579428571992536
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 23 Mar 2023 06:50:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=JDrm3aLh;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32NDoROO094068;
	Thu, 23 Mar 2023 08:50:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1679579427;
	bh=/UrAdDk/do7gU5W8tltkOijgPJ4UEhQg7Nejs3Mk750=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=JDrm3aLhkcz0/7h7gEcDmMKeGzf73nA6Xww6JHZcdg+Z7LwGe4s9niza4VIFZR65d
	 XOdMAScUbmQsRs3ECp/AP3eHShgTdGDMmHWpNPX0JhxI74fjOYcFSAG2lXcqpEFacS
	 kAD3jXOsK4IYqrjNDKONYIhUsdZGW1soHNzUOtwM=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32NDoRK4089843
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 Mar 2023 08:50:27 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 23
 Mar 2023 08:50:26 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 23 Mar 2023 08:50:27 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32NDoRp7084414;
	Thu, 23 Mar 2023 08:50:27 -0500
From: Nishanth Menon <nm@ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>,
        Nishanth
 Menon <nm@ti.com>
Subject: [oe-layersetup][master][PATCH V2 2/2] configs: Stop using git:// urls
Date: Thu, 23 Mar 2023 08:50:26 -0500
Message-ID: <20230323135026.1842186-3-nm@ti.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230323135026.1842186-1-nm@ti.com>
References: <20230323135026.1842186-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 23 Mar 2023 13:50:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14275

From: Randolph Sapp <rs@ti.com>

We did this in meta-ti and meta-arago but I didn't propagate back into
oe-layersetup yet so I'll give it a go. git:// is no longer functional
proxies over on latest git versions (example: poky crops container for
ubuntu 22.04), also git:// is highly susceptible to man-in-the-middle
attacks[1]. Dump git:// in favor of https.

NOTE: We leave the current release configurations as they are, and
we depend on the recommended git-config example to do the re-routing

[1] https://github.blog/2021-09-01-improving-git-protocol-security-github/

Signed-off-by: Randolph Sapp <rs@ti.com>
[nm@ti.com: Updates to commit message and subject to indicate improvements]
Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes since v1:
* Drop the changes to release config files
* Update commit message to indicate we are already broken atm.

V1: https://lore.kernel.org/yocto-meta-arago/20230309190858.395668-1-rs@ti.com/
 configs/arago-dunfell-config.txt        | 16 ++++++++--------
 configs/arago-dunfell-next-config.txt   | 16 ++++++++--------
 configs/arago-dunfell-wip-config.txt    | 16 ++++++++--------
 configs/arago-kirkstone-config.txt      | 14 +++++++-------
 configs/arago-kirkstone-next-config.txt | 14 +++++++-------
 configs/arago-kirkstone-wip-config.txt  | 14 +++++++-------
 configs/arago-master-config.txt         | 14 +++++++-------
 configs/arago-master-wip-config.txt     | 14 +++++++-------
 configs/distroless-dunfell-config.txt   |  8 ++++----
 configs/distroless-kirkstone-config.txt |  8 ++++----
 configs/distroless-master-config.txt    |  8 ++++----
 configs/poky-dunfell-config.txt         |  8 ++++----
 configs/poky-kirkstone-config.txt       | 12 ++++++------
 configs/poky-master-config.txt          | 12 ++++++------
 configs/poky-master-wip-config.txt      | 12 ++++++------
 15 files changed, 93 insertions(+), 93 deletions(-)

diff --git a/configs/arago-dunfell-config.txt b/configs/arago-dunfell-config.txt
index c5084a069562..bff059dd2811 100644
--- a/configs/arago-dunfell-config.txt
+++ b/configs/arago-dunfell-config.txt
@@ -1,16 +1,16 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.46,HEAD
-meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,HEAD,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.46,HEAD
+meta-arago,https://git.yoctoproject.org/meta-arago,dunfell,HEAD,layers=meta-arago-distro:meta-arago-extras
 # meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
-# meta-python2,git://git.openembedded.org/meta-python2,dunfell,HEAD,layers=
+# meta-python2,https://git.openembedded.org/meta-python2,dunfell,HEAD,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,HEAD,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,HEAD,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,HEAD,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,HEAD,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,HEAD,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 # if meta-browser/5f365ef0f842ba4651efe88787cf9c63bc8b6cb3 above is enabled,
 # use below for OECORELAYERCONF to mark it compatible with dunfell
diff --git a/configs/arago-dunfell-next-config.txt b/configs/arago-dunfell-next-config.txt
index 7ad9f923059b..3c0c3f47d0bb 100644
--- a/configs/arago-dunfell-next-config.txt
+++ b/configs/arago-dunfell-next-config.txt
@@ -1,16 +1,16 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.46,HEAD
-meta-arago,git://git.yoctoproject.org/meta-arago,dunfell-next,HEAD,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.46,HEAD
+meta-arago,https://git.yoctoproject.org/meta-arago,dunfell-next,HEAD,layers=meta-arago-distro:meta-arago-extras
 # meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
-# meta-python2,git://git.openembedded.org/meta-python2,dunfell,HEAD,layers=
+# meta-python2,https://git.openembedded.org/meta-python2,dunfell,HEAD,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,HEAD,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell-next,HEAD,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,HEAD,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,HEAD,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell-next,HEAD,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 # if meta-browser/5f365ef0f842ba4651efe88787cf9c63bc8b6cb3 above is enabled,
 # use below for OECORELAYERCONF to mark it compatible with dunfell
diff --git a/configs/arago-dunfell-wip-config.txt b/configs/arago-dunfell-wip-config.txt
index b8c9cce6404e..7bdc0cd42d61 100644
--- a/configs/arago-dunfell-wip-config.txt
+++ b/configs/arago-dunfell-wip-config.txt
@@ -1,16 +1,16 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.46,HEAD
-meta-arago,git://git.yoctoproject.org/meta-arago,dunfell-wip,HEAD,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.46,HEAD
+meta-arago,https://git.yoctoproject.org/meta-arago,dunfell-wip,HEAD,layers=meta-arago-distro:meta-arago-extras
 # meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
-# meta-python2,git://git.openembedded.org/meta-python2,dunfell,HEAD,layers=
+# meta-python2,https://git.openembedded.org/meta-python2,dunfell,HEAD,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,HEAD,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell-wip,HEAD,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,HEAD,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,HEAD,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell-wip,HEAD,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 # if meta-browser/5f365ef0f842ba4651efe88787cf9c63bc8b6cb3 above is enabled,
 # use below for OECORELAYERCONF to mark it compatible with dunfell
diff --git a/configs/arago-kirkstone-config.txt b/configs/arago-kirkstone-config.txt
index ebe130a154f4..890076f856a0 100644
--- a/configs/arago-kirkstone-config.txt
+++ b/configs/arago-kirkstone-config.txt
@@ -1,15 +1,15 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,2.0,HEAD
-meta-arago,git://git.yoctoproject.org/meta-arago,kirkstone,HEAD,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,2.0,HEAD
+meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone,HEAD,layers=meta-arago-distro:meta-arago-extras
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,HEAD,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,kirkstone,HEAD,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,kirkstone,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,kirkstone,HEAD,layers=meta-ti-extras:meta-ti-bsp
-meta-arm,git://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,HEAD,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,HEAD,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
 BITBAKE_INCLUSIVE_VARS=yes
diff --git a/configs/arago-kirkstone-next-config.txt b/configs/arago-kirkstone-next-config.txt
index 4d5844584bd1..52143025b2d7 100644
--- a/configs/arago-kirkstone-next-config.txt
+++ b/configs/arago-kirkstone-next-config.txt
@@ -1,15 +1,15 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,2.0,HEAD
-meta-arago,git://git.yoctoproject.org/meta-arago,kirkstone-next,HEAD,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,2.0,HEAD
+meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone-next,HEAD,layers=meta-arago-distro:meta-arago-extras
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,HEAD,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,kirkstone,HEAD,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,kirkstone,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,kirkstone-next,HEAD,layers=meta-ti-extras:meta-ti-bsp
-meta-arm,git://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,HEAD,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone-next,HEAD,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
 BITBAKE_INCLUSIVE_VARS=yes
diff --git a/configs/arago-kirkstone-wip-config.txt b/configs/arago-kirkstone-wip-config.txt
index b293632f4cfb..9f0b0c2723b7 100644
--- a/configs/arago-kirkstone-wip-config.txt
+++ b/configs/arago-kirkstone-wip-config.txt
@@ -1,15 +1,15 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,2.0,HEAD
-meta-arago,git://git.yoctoproject.org/meta-arago,kirkstone-wip,HEAD,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,2.0,HEAD
+meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone-wip,HEAD,layers=meta-arago-distro:meta-arago-extras
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,HEAD,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,kirkstone,HEAD,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,kirkstone,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,kirkstone-wip,HEAD,layers=meta-ti-extras:meta-ti-bsp
-meta-arm,git://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,HEAD,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone-wip,HEAD,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
 BITBAKE_INCLUSIVE_VARS=yes
diff --git a/configs/arago-master-config.txt b/configs/arago-master-config.txt
index 93d93b559dfe..d5fc21feb01f 100644
--- a/configs/arago-master-config.txt
+++ b/configs/arago-master-config.txt
@@ -1,15 +1,15 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,master,HEAD
-meta-arago,git://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,master,HEAD
+meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-distro:meta-arago-extras
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-ti-bsp
-meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
 BITBAKE_INCLUSIVE_VARS=yes
diff --git a/configs/arago-master-wip-config.txt b/configs/arago-master-wip-config.txt
index 55c883b91802..54fed42ebcb3 100644
--- a/configs/arago-master-wip-config.txt
+++ b/configs/arago-master-wip-config.txt
@@ -1,15 +1,15 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,master,HEAD
-meta-arago,git://git.yoctoproject.org/meta-arago,master-wip,HEAD,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,master,HEAD
+meta-arago,https://git.yoctoproject.org/meta-arago,master-wip,HEAD,layers=meta-arago-distro:meta-arago-extras
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,master-wip,HEAD,layers=meta-ti-extras:meta-ti-bsp
-meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,master-wip,HEAD,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
 BITBAKE_INCLUSIVE_VARS=yes
diff --git a/configs/distroless-dunfell-config.txt b/configs/distroless-dunfell-config.txt
index bb03ac78f5c3..8f15d398fd33 100644
--- a/configs/distroless-dunfell-config.txt
+++ b/configs/distroless-dunfell-config.txt
@@ -1,9 +1,9 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
-bitbake,git://git.openembedded.org/bitbake,1.46,HEAD
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,HEAD,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,HEAD,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,HEAD,layers=meta
+bitbake,https://git.openembedded.org/bitbake,1.46,HEAD
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,HEAD,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,HEAD,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local.conf.sample
 BITBAKE_INCLUSIVE_VARS=no
diff --git a/configs/distroless-kirkstone-config.txt b/configs/distroless-kirkstone-config.txt
index 4cafca73b9ab..bbd7a62b76e1 100644
--- a/configs/distroless-kirkstone-config.txt
+++ b/configs/distroless-kirkstone-config.txt
@@ -1,9 +1,9 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
-bitbake,git://git.openembedded.org/bitbake,2.0,HEAD
-meta-ti,git://git.yoctoproject.org/meta-ti,kirkstone,HEAD,layers=meta-ti-extras:meta-ti-bsp
-meta-arm,git://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
+bitbake,https://git.openembedded.org/bitbake,2.0,HEAD
+meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,HEAD,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-v2.conf.sample
 BITBAKE_INCLUSIVE_VARS=yes
diff --git a/configs/distroless-master-config.txt b/configs/distroless-master-config.txt
index e67f9169176b..b938035deacb 100644
--- a/configs/distroless-master-config.txt
+++ b/configs/distroless-master-config.txt
@@ -1,9 +1,9 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
-bitbake,git://git.openembedded.org/bitbake,master,HEAD
-meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-ti-bsp
-meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
+bitbake,https://git.openembedded.org/bitbake,master,HEAD
+meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-v2.conf.sample
 BITBAKE_INCLUSIVE_VARS=yes
diff --git a/configs/poky-dunfell-config.txt b/configs/poky-dunfell-config.txt
index 5f6c45b7453f..72facf28c630 100644
--- a/configs/poky-dunfell-config.txt
+++ b/configs/poky-dunfell-config.txt
@@ -1,9 +1,9 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
-bitbake,git://git.openembedded.org/bitbake,1.46,HEAD
-poky,git://git.yoctoproject.org/poky,dunfell,HEAD,layers=meta:meta-poky:meta-yocto-bsp
-meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,HEAD,layers=meta-arm:meta-arm-toolchain
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,HEAD,layers=
+bitbake,https://git.openembedded.org/bitbake,1.46,HEAD
+poky,https://git.yoctoproject.org/poky,dunfell,HEAD,layers=meta:meta-poky:meta-yocto-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,HEAD,layers=meta-arm:meta-arm-toolchain
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,HEAD,layers=
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-poky.conf.sample
 BITBAKE_INCLUSIVE_VARS=no
diff --git a/configs/poky-kirkstone-config.txt b/configs/poky-kirkstone-config.txt
index 5f72081d672b..dc94b1d01c76 100644
--- a/configs/poky-kirkstone-config.txt
+++ b/configs/poky-kirkstone-config.txt
@@ -1,12 +1,12 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,2.0,HEAD
-meta-yocto,git://git.yoctoproject.org/meta-yocto,kirkstone,HEAD,layers=meta-poky:meta-yocto-bsp
-meta-ti,git://git.yoctoproject.org/meta-ti,kirkstone,HEAD,layers=meta-ti-extras:meta-ti-bsp
-meta-arm,git://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
-meta-arago,git://git.yoctoproject.org/meta-arago,kirkstone,HEAD,layers=meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,2.0,HEAD
+meta-yocto,https://git.yoctoproject.org/meta-yocto,kirkstone,HEAD,layers=meta-poky:meta-yocto-bsp
+meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,HEAD,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
+meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone,HEAD,layers=meta-arago-extras
 
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-poky-v2.conf.sample
diff --git a/configs/poky-master-config.txt b/configs/poky-master-config.txt
index be2201879464..5cb0383b1960 100644
--- a/configs/poky-master-config.txt
+++ b/configs/poky-master-config.txt
@@ -1,12 +1,12 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,master,HEAD
-meta-yocto,git://git.yoctoproject.org/meta-yocto,master,HEAD,layers=meta-poky:meta-yocto-bsp
-meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-ti-bsp
-meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
-meta-arago,git://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,master,HEAD
+meta-yocto,https://git.yoctoproject.org/meta-yocto,master,HEAD,layers=meta-poky:meta-yocto-bsp
+meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
+meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-extras
 
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-poky-v2.conf.sample
diff --git a/configs/poky-master-wip-config.txt b/configs/poky-master-wip-config.txt
index 657dcb8d9e50..3fa74bfc1722 100644
--- a/configs/poky-master-wip-config.txt
+++ b/configs/poky-master-wip-config.txt
@@ -1,12 +1,12 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,master,HEAD
-meta-yocto,git://git.yoctoproject.org/meta-yocto,master,HEAD,layers=meta-poky:meta-yocto-bsp
-meta-ti,git://git.yoctoproject.org/meta-ti,master-wip,HEAD,layers=meta-ti-extras:meta-ti-bsp
-meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
-meta-arago,git://git.yoctoproject.org/meta-arago,master-wip,HEAD,layers=meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,master,HEAD
+meta-yocto,https://git.yoctoproject.org/meta-yocto,master,HEAD,layers=meta-poky:meta-yocto-bsp
+meta-ti,https://git.yoctoproject.org/meta-ti,master-wip,HEAD,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
+meta-arago,https://git.yoctoproject.org/meta-arago,master-wip,HEAD,layers=meta-arago-extras
 
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-poky-v2.conf.sample
-- 
2.40.0


