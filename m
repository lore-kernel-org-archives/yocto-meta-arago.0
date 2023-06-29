Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4746EB64D9
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 18:22:51 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.4421.1688062967454513153
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 29 Jun 2023 11:22:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7291640C30;
	Thu, 29 Jun 2023 18:22:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8k-mugS6vQeT; Thu, 29 Jun 2023 18:22:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5579C40031;
	Thu, 29 Jun 2023 18:22:45 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 62920163BB1;
	Thu, 29 Jun 2023 14:22:44 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH] arago-prefs: pin down mbedtls version for open62541
Date: Thu, 29 Jun 2023 18:22:44 +0000
Message-Id: <20230629182244.3533996-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 29 Jun 2023 18:22:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14737

From: Denys Dmytriyenko <denys@konsulko.com>

Our patched version of open62541 uses entropy_poll.h header from mbedtls
that is no longer being exported by version 3.x, pin to version 2.x for
now.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta=
-arago-distro/conf/distro/include/arago-prefs.inc
index 34c3c539..60d7838c 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -10,6 +10,10 @@ PREFERRED_PROVIDER_virtual/kernel:append =3D "${ARAGO_=
KERNEL_SUFFIX}"
=20
 PREFERRED_PROVIDER_jpeg =3D "libjpeg-turbo"
=20
+# open62541 requires entropy_poll.h which is not provided by mbedtls 3.x
+PREFERRED_VERSION_mbedtls =3D "2.%"
+PREFERRED_VERSION_nativesdk-mbedtls =3D "2.%"
+
 # Setting PREFERRED_VERSIONS due to selecting a specific version of a li=
brary or
 # application that does not have a GPLv3 license
 PREFERRED_VERSION_crda =3D "3.18"
--=20
2.25.1


