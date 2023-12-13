Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C3AC19774
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 17:58:54 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.43505.1702490333706858446
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Dec 2023 09:58:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0FA2A40C3A;
	Wed, 13 Dec 2023 17:58:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RQYUhtnLzUr5; Wed, 13 Dec 2023 17:58:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E7EA940C2E;
	Wed, 13 Dec 2023 17:58:51 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id AB48D163DB9;
	Wed, 13 Dec 2023 12:58:51 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [kirkstone][PATCH] README: update with kirkstone-specific info
Date: Wed, 13 Dec 2023 17:58:49 +0000
Message-Id: <20231213175849.523803-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Dec 2023 17:58:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15059

From: Denys Dmytriyenko <denys@konsulko.com>

All READMEs were still mentioning master and old release version, update =
that.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-demos/README  | 14 +++++++-------
 meta-arago-distro/README | 16 ++++++++--------
 meta-arago-extras/README | 14 +++++++-------
 meta-arago-test/README   | 12 ++++++------
 4 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/meta-arago-demos/README b/meta-arago-demos/README
index bb586c14..2649a90e 100644
--- a/meta-arago-demos/README
+++ b/meta-arago-demos/README
@@ -1,30 +1,30 @@
 meta-arago-demos provides demo applications to showcase in TI SDK produc=
ts
=20
-This layer works with the latest Yocto Project release (currently 2.2+) =
and tracks
-the stable/maintenance branches (currently "master") of the correspondin=
g layers:
+This layer works with the latest Yocto Project release (currently 4.0) a=
nd tracks
+the stable/maintenance branches (currently "kirkstone") of the correspon=
ding layers:
=20
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: kirkstone
 revision: HEAD
 layers: meta
=20
 URI: git://git.yoctoproject.org/meta-ti
-branch: master
+branch: kirkstone
 revision: HEAD
 layers: meta-ti-bsp, meta-ti-extras
=20
 URI: git://git.yoctoproject.org/meta-arm
-branch: master
+branch: kirkstone
 revision: HEAD
 layers: meta-arm, meta-arm-toolchain
=20
 URI: git://git.openembedded.org/meta-openembedded
-branch: master
+branch: kirkstone
 revision: HEAD
 layers: meta-oe, meta-networking, meta-python
=20
 URI: https://github.com/meta-qt5/meta-qt5
-branch: master
+branch: kirkstone
 revision: HEAD
=20
 Send pull requests to meta-arago@lists.yoctoproject.org
diff --git a/meta-arago-distro/README b/meta-arago-distro/README
index 49e9d9e1..063e0a78 100644
--- a/meta-arago-distro/README
+++ b/meta-arago-distro/README
@@ -1,34 +1,34 @@
 meta-arago-distro provides Arago distribution configuration for TI SDK p=
roducts
=20
-This layer works with the latest Yocto Project release (currently 2.2+) =
and tracks
-the stable/maintenance branches (currently "master") of the correspondin=
g layers:
+This layer works with the latest Yocto Project release (currently 4.0) a=
nd tracks
+the stable/maintenance branches (currently "kirkstone") of the correspon=
ding layers:
=20
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: kirkstone
 revision: HEAD
 layers: meta
=20
 URI: git://git.yoctoproject.org/meta-ti
-branch: master
+branch: kirkstone
 revision: HEAD
 layers: meta-ti-bsp, meta-ti-extras
=20
 URI: git://git.yoctoproject.org/meta-arm
-branch: master
+branch: kirkstone
 revision: HEAD
 layers: meta-arm, meta-arm-toolchain
=20
 URI: git://git.openembedded.org/meta-openembedded
-branch: master
+branch: kirkstone
 revision: HEAD
 layers: meta-oe, meta-networking, meta-python
=20
 URI: https://github.com/meta-qt5/meta-qt5
-branch: master
+branch: kirkstone
 revision: HEAD
=20
 URI: git://git.yoctoproject.org/meta-arago
-branch: master
+branch: kirkstone
 revision: HEAD
 layers: meta-arago-extras
=20
diff --git a/meta-arago-extras/README b/meta-arago-extras/README
index 5b6e8a15..bf6beb36 100644
--- a/meta-arago-extras/README
+++ b/meta-arago-extras/README
@@ -1,30 +1,30 @@
 meta-arago-extras provides additional TI SDK applications that are distr=
o-agnostic
=20
-This layer works with the latest Yocto Project release (currently 2.2+) =
and tracks
-the stable/maintenance branches (currently "master") of the correspondin=
g layers:
+This layer works with the latest Yocto Project release (currently 4.0) a=
nd tracks
+the stable/maintenance branches (currently "kirkstone") of the correspon=
ding layers:
=20
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: kirkstone
 revision: HEAD
 layers: meta
=20
 URI: git://git.yoctoproject.org/meta-ti
-branch: master
+branch: kirkstone
 revision: HEAD
 layers: meta-ti-bsp, meta-ti-extras
=20
 URI: git://git.yoctoproject.org/meta-arm
-branch: master
+branch: kirkstone
 revision: HEAD
 layers: meta-arm, meta-arm-toolchain
=20
 URI: git://git.openembedded.org/meta-openembedded
-branch: master
+branch: kirkstone
 revision: HEAD
 layers: meta-oe, meta-networking, meta-python
=20
 URI: https://github.com/meta-qt5/meta-qt5
-branch: master
+branch: kirkstone
 revision: HEAD
=20
 Send pull requests to meta-arago@lists.yoctoproject.org
diff --git a/meta-arago-test/README b/meta-arago-test/README
index 8f1f9993..a05cadc0 100644
--- a/meta-arago-test/README
+++ b/meta-arago-test/README
@@ -1,25 +1,25 @@
 meta-arago-test provides an additional packagegroup ti-test and some of =
the recipes that go into that group
=20
-This layer works with the latest Yocto Project release (currently 2.2+) =
and tracks
-the stable/maintenance branches (currently "master") of the correspondin=
g layers:
+This layer works with the latest Yocto Project release (currently 4.0) a=
nd tracks
+the stable/maintenance branches (currently "kirkstone") of the correspon=
ding layers:
=20
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: kirkstone
 revision: HEAD
 layers: meta
=20
 URI: git://git.yoctoproject.org/meta-ti
-branch: master
+branch: kirkstone
 revision: HEAD
 layers: meta-ti-bsp, meta-ti-extras
=20
 URI: git://git.yoctoproject.org/meta-arm
-branch: master
+branch: kirkstone
 revision: HEAD
 layers: meta-arm, meta-arm-toolchain
=20
 URI: git://git.openembedded.org/meta-openembedded
-branch: master
+branch: kirkstone
 revision: HEAD
 layers: meta-oe, meta-networking, meta-python
=20
--=20
2.25.1


