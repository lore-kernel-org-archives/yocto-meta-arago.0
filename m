Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF26C369A5
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 15:47:51 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.78917.1744127264018928859
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 08 Apr 2025 08:47:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id ED1B240CB7;
	Tue,  8 Apr 2025 15:47:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yYR4cd6_Xnmx; Tue,  8 Apr 2025 15:47:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D256340C1E;
	Tue,  8 Apr 2025 15:47:41 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 01901165939;
	Tue,  8 Apr 2025 11:47:41 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/scarthgap][PATCH 2/3] meta-toolchain-arago: also use nativesdk-sdk-provides-dummy
Date: Tue,  8 Apr 2025 11:47:38 -0400
Message-Id: <20250408154739.2716116-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250408154739.2716116-1-denis@denix.org>
References: <20250408154739.2716116-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 08 Apr 2025 15:47:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16161

From: Denys Dmytriyenko <denys@konsulko.com>

Besides nativesdk-buildtools-perl-dummy for perl packages, also use
nativesdk-sdk-provides-dummy for basic host tools like pkgconfig and
shell.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/recipes-core/meta/meta-toolchain-arago.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago.bb =
b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago.bb
index fa8ed3d4..f815bd0b 100644
--- a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago.bb
@@ -1,5 +1,5 @@
 TOOLCHAIN_HOST_TASK ?=3D "nativesdk-packagegroup-sdk-host"
-TOOLCHAIN_HOST_TASK:append =3D " nativesdk-buildtools-perl-dummy"
+TOOLCHAIN_HOST_TASK:append =3D " nativesdk-sdk-provides-dummy nativesdk-=
buildtools-perl-dummy"
 TOOLCHAIN_HOST_TASK:append =3D " packagegroup-cross-canadian-${MACHINE}"
 TOOLCHAIN_TARGET_TASK ?=3D "packagegroup-arago-standalone-sdk-target"
 TOOLCHAIN_SUFFIX ?=3D "-sdk"
--=20
2.25.1


