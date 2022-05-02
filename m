Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 205D9C433EF
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 19:50:58 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.2094.1651521050609279013
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 02 May 2022 12:50:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5253A40C2A;
	Mon,  2 May 2022 19:50:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QC4EEvk9YCaA; Mon,  2 May 2022 19:50:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 38E1A40B86;
	Mon,  2 May 2022 19:50:48 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 61E02174913;
	Mon,  2 May 2022 15:50:47 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [oe-layersetup][PATCH] configs: add Kirkstone configs for arago,
 poky and distroless
Date: Mon,  2 May 2022 19:50:46 +0000
Message-Id: <20220502195046.728435-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 02 May 2022 19:50:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13830

From: Denys Dmytriyenko <denys@konsulko.com>

The following layers have not branched off yet and will be updated later:

meta-virtualization
meta-ti
meta-arago

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 configs/arago-kirkstone-config.txt      | 14 ++++++++++++++
 configs/distroless-kirkstone-config.txt |  8 ++++++++
 configs/poky-kirkstone-config.txt       | 10 ++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 configs/arago-kirkstone-config.txt
 create mode 100644 configs/distroless-kirkstone-config.txt
 create mode 100644 configs/poky-kirkstone-config.txt

diff --git a/configs/arago-kirkstone-config.txt b/configs/arago-kirkstone=
-config.txt
new file mode 100644
index 0000000..00c96d6
--- /dev/null
+++ b/configs/arago-kirkstone-config.txt
@@ -0,0 +1,14 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:=
layern]
+
+bitbake,git://git.openembedded.org/bitbake,2.0,HEAD
+meta-arago,git://git.yoctoproject.org/meta-arago,master,HEAD,layers=3Dme=
ta-arago-distro:meta-arago-extras
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365=
ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=3D
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,HEAD,layers=3D
+meta-virtualization,git://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
+meta-openembedded,git://git.openembedded.org/meta-openembedded,kirkstone=
,HEAD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesy=
stems
+meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=3Dmeta-ti-=
extras:meta-ti-bsp
+meta-arm,git://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=3Dmet=
a-arm:meta-arm-toolchain
+oe-core,git://git.openembedded.org/openembedded-core,kirkstone,HEAD,laye=
rs=3Dmeta
+OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
+OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
diff --git a/configs/distroless-kirkstone-config.txt b/configs/distroless=
-kirkstone-config.txt
new file mode 100644
index 0000000..dc9c088
--- /dev/null
+++ b/configs/distroless-kirkstone-config.txt
@@ -0,0 +1,8 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:=
layern]
+bitbake,git://git.openembedded.org/bitbake,2.0,HEAD
+meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=3Dmeta-ti-=
extras:meta-ti-bsp
+meta-arm,git://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=3Dmet=
a-arm:meta-arm-toolchain
+oe-core,git://git.openembedded.org/openembedded-core,kirkstone,HEAD,laye=
rs=3Dmeta
+OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
+OECORELOCALCONF=3D./sample-files/local-v2.conf.sample
diff --git a/configs/poky-kirkstone-config.txt b/configs/poky-kirkstone-c=
onfig.txt
new file mode 100644
index 0000000..024e1c6
--- /dev/null
+++ b/configs/poky-kirkstone-config.txt
@@ -0,0 +1,10 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:=
layern]
+
+bitbake,git://git.openembedded.org/bitbake,2.0,HEAD
+meta-yocto,git://git.yoctoproject.org/meta-yocto,kirkstone,HEAD,layers=3D=
meta-poky:meta-yocto-bsp
+meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=3Dmeta-ti-=
extras:meta-ti-bsp
+meta-arm,git://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=3Dmet=
a-arm:meta-arm-toolchain
+oe-core,git://git.openembedded.org/openembedded-core,kirkstone,HEAD,laye=
rs=3Dmeta
+OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
+OECORELOCALCONF=3D./sample-files/local-poky-v2.conf.sample
--=20
2.25.1


