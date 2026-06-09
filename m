Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E186CD8CB2
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 18:52:57 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3176.1781031169678460255
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 11:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 246BF40CB0;
	Tue,  9 Jun 2026 18:52:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LAwBLwqKj-tz; Tue,  9 Jun 2026 18:52:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 079B440C56;
	Tue,  9 Jun 2026 18:52:47 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id B961317ED76;
	Tue,  9 Jun 2026 14:52:47 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
Subject: [master][PATCH] README: update and clean up
Date: Tue,  9 Jun 2026 14:52:47 -0400
Message-Id: <20260609185247.2659774-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 09 Jun 2026 18:52:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17565

From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>

Update READMEs as follows:
* Use https:// instead of git:// protocol due to deprecation
* Correct some sub-layer dependencies

Signed-off-by: Denys Dmytriyenko (TI) <denys@konsulko.com>
---
 meta-arago-distro/README | 25 ++++++++++++++++---------
 meta-arago-extras/README | 16 +++++++++-------
 2 files changed, 25 insertions(+), 16 deletions(-)

diff --git a/meta-arago-distro/README b/meta-arago-distro/README
index d5ec23af..5fc196bb 100644
--- a/meta-arago-distro/README
+++ b/meta-arago-distro/README
@@ -1,29 +1,36 @@
 meta-arago-distro provides Arago distribution configuration for TI produ=
cts
=20
-This layer works with the latest Yocto Project release (currently 2.2+) =
and tracks
-the stable/maintenance branches (currently "master") of the correspondin=
g layers:
+The source repository is hosted at https://git.yoctoproject.org/meta-ara=
go
=20
-URI: git://git.openembedded.org/openembedded-core
+This layer works with the latest Yocto Project and tracks the "master"
+branches of the corresponding layers:
+
+URI: https://git.openembedded.org/openembedded-core
 branch: master
 revision: HEAD
 layers: meta
=20
-URI: git://git.yoctoproject.org/meta-ti
+URI: https://git.yoctoproject.org/meta-ti
 branch: master
 revision: HEAD
-layers: meta-ti-bsp, meta-ti-extras
+layers: meta-ti-bsp, meta-ti-extras, meta-ti-test
=20
-URI: git://git.yoctoproject.org/meta-arm
+URI: https://git.yoctoproject.org/meta-arm
 branch: master
 revision: HEAD
 layers: meta-arm, meta-arm-toolchain
=20
-URI: git://git.openembedded.org/meta-openembedded
+URI: https://git.openembedded.org/meta-openembedded
+branch: master
+revision: HEAD
+layers: meta-oe, meta-multimedia, meta-networking, meta-python
+
+URI: https://git.yoctoproject.org/meta-virtualization
 branch: master
 revision: HEAD
-layers: meta-oe, meta-networking, meta-python
+layers: meta-virtualization
=20
-URI: git://git.yoctoproject.org/meta-arago
+URI: https://git.yoctoproject.org/meta-arago
 branch: master
 revision: HEAD
 layers: meta-arago-extras
diff --git a/meta-arago-extras/README b/meta-arago-extras/README
index 9a4c5b25..cb9ee9a1 100644
--- a/meta-arago-extras/README
+++ b/meta-arago-extras/README
@@ -1,27 +1,29 @@
 meta-arago-extras provides additional TI applications that are distro-ag=
nostic
=20
-This layer works with the latest Yocto Project release (currently 2.2+) =
and tracks
-the stable/maintenance branches (currently "master") of the correspondin=
g layers:
+The source repository is hosted at https://git.yoctoproject.org/meta-ara=
go
=20
-URI: git://git.openembedded.org/openembedded-core
+This layer works with the latest Yocto Project and tracks the "master"
+branches of the corresponding layers:
+
+URI: https://git.openembedded.org/openembedded-core
 branch: master
 revision: HEAD
 layers: meta
=20
-URI: git://git.yoctoproject.org/meta-ti
+URI: https://git.yoctoproject.org/meta-ti
 branch: master
 revision: HEAD
 layers: meta-ti-bsp, meta-ti-extras
=20
-URI: git://git.yoctoproject.org/meta-arm
+URI: https://git.yoctoproject.org/meta-arm
 branch: master
 revision: HEAD
 layers: meta-arm, meta-arm-toolchain
=20
-URI: git://git.openembedded.org/meta-openembedded
+URI: https://git.openembedded.org/meta-openembedded
 branch: master
 revision: HEAD
-layers: meta-oe, meta-networking, meta-python
+layers: meta-oe, meta-networking
=20
 Send pull requests, patches, comments or questions to:
 meta-arago@lists.yoctoproject.org
--=20
2.25.1


