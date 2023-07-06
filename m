Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1FABEB64DC
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 21:23:12 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.36324.1688678590036084942
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Jul 2023 14:23:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CD73F40C8C;
	Thu,  6 Jul 2023 21:23:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ffnmqutJp7F3; Thu,  6 Jul 2023 21:23:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A7D6140027;
	Thu,  6 Jul 2023 21:23:07 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 30C3A163BEF;
	Thu,  6 Jul 2023 17:23:05 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 2/6] tisdk-core-bundle: simplify toolchain/SDK selection
Date: Thu,  6 Jul 2023 21:23:00 +0000
Message-Id: <20230706212304.1893414-3-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230706212304.1893414-1-denis@denix.org>
References: <20230706212304.1893414-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Jul 2023 21:23:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14777

From: Denys Dmytriyenko <denys@konsulko.com>

We used to generate a different toolchain/SDK based on whether the target
was graphics-enabled or headless. Now we build the same full toolchain/SD=
K
regardles, so there's no need to check for "opengl" distro feature inside
TISDK bundle, as it's enabled in our distro unconditionally anyway.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc =
b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
index c7bd9629..43b1ef5f 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
@@ -31,8 +31,8 @@ DTB_FILTER:j721s2 =3D "j721s2"
 # List of target side images to build for the SDK
 TARGET_IMAGES =3D "tisdk-base-image tisdk-default-image tisdk-thinlinux-=
image tisdk-bootstrap-image"
=20
-TISDK_TOOLCHAIN =3D "${@bb.utils.contains('DISTRO_FEATURES','opengl','me=
ta-toolchain-arago-tisdk','meta-toolchain-arago-tisdk-server',d)}"
-TOOLCHAIN_SUFFIX =3D "${@bb.utils.contains('DISTRO_FEATURES','opengl','-=
tisdk','-tisdk-server',d)}"
+TISDK_TOOLCHAIN =3D "meta-toolchain-arago-tisdk"
+TOOLCHAIN_SUFFIX =3D "-tisdk"
=20
 IMAGE_INSTALL =3D "\
     packagegroup-arago-tisdk-amsdk-sdk-host \
--=20
2.25.1


