Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8249C433F5
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 22:09:15 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3541.1652220552873377555
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 10 May 2022 15:09:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B341D40C2C
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 10 May 2022 22:09:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 11qmYhTU1TPT for <meta-arago@lists.yoctoproject.org>;
	Tue, 10 May 2022 22:09:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A3C74400CF
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 10 May 2022 22:09:11 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 6B6BC174925;
	Tue, 10 May 2022 18:09:11 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [oe-layersetup][PATCH] configs: update kirkstone configs with more
 layers
Date: Tue, 10 May 2022 22:09:08 +0000
Message-Id: <20220510220908.994694-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 10 May 2022 22:09:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13846

Now that meta-virtualization, meta-ti and meta-arago got their kirkstone =
branches,
switch to using them in corresponding configs.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 configs/arago-kirkstone-config.txt      | 6 +++---
 configs/distroless-kirkstone-config.txt | 2 +-
 configs/poky-kirkstone-config.txt       | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/configs/arago-kirkstone-config.txt b/configs/arago-kirkstone=
-config.txt
index 00c96d6..0f3c001 100644
--- a/configs/arago-kirkstone-config.txt
+++ b/configs/arago-kirkstone-config.txt
@@ -2,12 +2,12 @@
 # repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:=
layern]
=20
 bitbake,git://git.openembedded.org/bitbake,2.0,HEAD
-meta-arago,git://git.yoctoproject.org/meta-arago,master,HEAD,layers=3Dme=
ta-arago-distro:meta-arago-extras
+meta-arago,git://git.yoctoproject.org/meta-arago,kirkstone,HEAD,layers=3D=
meta-arago-distro:meta-arago-extras
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365=
ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=3D
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,HEAD,layers=3D
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
+meta-virtualization,git://git.yoctoproject.org/meta-virtualization,kirks=
tone,HEAD,layers=3D
 meta-openembedded,git://git.openembedded.org/meta-openembedded,kirkstone=
,HEAD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesy=
stems
-meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=3Dmeta-ti-=
extras:meta-ti-bsp
+meta-ti,git://git.yoctoproject.org/meta-ti,kirkstone,HEAD,layers=3Dmeta-=
ti-extras:meta-ti-bsp
 meta-arm,git://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=3Dmet=
a-arm:meta-arm-toolchain
 oe-core,git://git.openembedded.org/openembedded-core,kirkstone,HEAD,laye=
rs=3Dmeta
 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
diff --git a/configs/distroless-kirkstone-config.txt b/configs/distroless=
-kirkstone-config.txt
index dc9c088..3b33992 100644
--- a/configs/distroless-kirkstone-config.txt
+++ b/configs/distroless-kirkstone-config.txt
@@ -1,7 +1,7 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:=
layern]
 bitbake,git://git.openembedded.org/bitbake,2.0,HEAD
-meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=3Dmeta-ti-=
extras:meta-ti-bsp
+meta-ti,git://git.yoctoproject.org/meta-ti,kirkstone,HEAD,layers=3Dmeta-=
ti-extras:meta-ti-bsp
 meta-arm,git://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=3Dmet=
a-arm:meta-arm-toolchain
 oe-core,git://git.openembedded.org/openembedded-core,kirkstone,HEAD,laye=
rs=3Dmeta
 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
diff --git a/configs/poky-kirkstone-config.txt b/configs/poky-kirkstone-c=
onfig.txt
index 024e1c6..0e57c64 100644
--- a/configs/poky-kirkstone-config.txt
+++ b/configs/poky-kirkstone-config.txt
@@ -3,7 +3,7 @@
=20
 bitbake,git://git.openembedded.org/bitbake,2.0,HEAD
 meta-yocto,git://git.yoctoproject.org/meta-yocto,kirkstone,HEAD,layers=3D=
meta-poky:meta-yocto-bsp
-meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=3Dmeta-ti-=
extras:meta-ti-bsp
+meta-ti,git://git.yoctoproject.org/meta-ti,kirkstone,HEAD,layers=3Dmeta-=
ti-extras:meta-ti-bsp
 meta-arm,git://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=3Dmet=
a-arm:meta-arm-toolchain
 oe-core,git://git.openembedded.org/openembedded-core,kirkstone,HEAD,laye=
rs=3Dmeta
 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
--=20
2.25.1


