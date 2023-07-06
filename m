Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFEF4C001DF
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 21:23:42 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.36479.1688678620710627176
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Jul 2023 14:23:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1218640C8C;
	Thu,  6 Jul 2023 21:23:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pm6fxz3-RVwG; Thu,  6 Jul 2023 21:23:40 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EF18040C16;
	Thu,  6 Jul 2023 21:23:38 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id AC687163BED;
	Thu,  6 Jul 2023 17:23:38 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [kirkstone][PATCH 0/6] Rework secondary toolchain for K3R5
Date: Thu,  6 Jul 2023 21:23:29 +0000
Message-Id: <20230706212335.1893675-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Jul 2023 21:23:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14785

From: Denys Dmytriyenko <denys@konsulko.com>

The old approach using external toolchain no longer works since meta-arag=
o
migrated away and now uses internal toolchain. This patch series adds the
secondary k3r5 toolchain into the TISDK bundle using multiconfig, while
cleaning up and removing the legacy external toolchain support.

The TISDK bundle for K3 devices now also provides k3r5-devkit.sh toolchai=
n
installer along with the main linux-devkit.sh one. Some basic testing has
been done installing them separate from each other. Whether they can be
installed in the same directory hasn't been tested yet. May need to follo=
w
with additional meta-toolchain clean ups later.

PS. The only difference between master and kirkstone sets is due to
upstream GCC version specified in toolchain-gcc.inc (13 vs 11)

Denys Dmytriyenko (6):
  recipe-data: deprecate
  tisdk-core-bundle: simplify toolchain/SDK selection
  meta-arago-distro: remove old secondary toolchain support
  meta-arago: remove external toolchain support
  meta-arago: remove extra plumbing for internal toolchain
  tisdk-bundle: package up secondary K3R5 toolchain

 meta-arago-distro/classes/recipe-data.bbclass | 100 -------------
 .../classes/tisdk-bundle.bbclass              |  80 +++++------
 meta-arago-distro/conf/distro/arago.conf      |  13 --
 .../conf/distro/include/toolchain-arm.inc     | 118 ----------------
 .../distro/include/toolchain-external.inc     |   4 -
 .../conf/distro/include/toolchain-gcc.inc     |  41 ------
 .../distro/include/toolchain-internal.inc     |   4 -
 .../recipes-core/images/tisdk-core-bundle.inc |   4 +-
 .../external-arm-secondary-sdk-toolchain.bb   |   4 -
 .../meta/external-arm-toolchain.bbappend      |  36 -----
 .../packagegroup-cross-canadian.bbappend      |  10 --
 .../meta/external-arm-bfd-version.inc         |   8 --
 .../meta/external-arm-sdk-toolchain.bb        | 131 ------------------
 .../meta/external-arm-toolchain.bbappend      |  73 ----------
 .../recipes-core/meta/files/SUPPORTED         |   1 -
 .../recipes-core/meta/meta-toolchain-arago.bb |  54 ++------
 16 files changed, 47 insertions(+), 634 deletions(-)
 delete mode 100644 meta-arago-distro/classes/recipe-data.bbclass
 delete mode 100644 meta-arago-distro/conf/distro/include/toolchain-arm.i=
nc
 delete mode 100644 meta-arago-distro/conf/distro/include/toolchain-exter=
nal.inc
 delete mode 100644 meta-arago-distro/conf/distro/include/toolchain-gcc.i=
nc
 delete mode 100644 meta-arago-distro/conf/distro/include/toolchain-inter=
nal.inc
 delete mode 100644 meta-arago-distro/recipes-core/meta/external-arm-seco=
ndary-sdk-toolchain.bb
 delete mode 100644 meta-arago-distro/recipes-core/meta/external-arm-tool=
chain.bbappend
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packageg=
roup-cross-canadian.bbappend
 delete mode 100644 meta-arago-extras/recipes-core/meta/external-arm-bfd-=
version.inc
 delete mode 100644 meta-arago-extras/recipes-core/meta/external-arm-sdk-=
toolchain.bb
 delete mode 100644 meta-arago-extras/recipes-core/meta/external-arm-tool=
chain.bbappend
 delete mode 100644 meta-arago-extras/recipes-core/meta/files/SUPPORTED

--=20
2.25.1


