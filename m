Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D35C1C4321E
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 22:39:06 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.27285.1669847944765307487
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 30 Nov 2022 14:39:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3BAE640AC9;
	Wed, 30 Nov 2022 22:39:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ccglGt23E75v; Wed, 30 Nov 2022 22:39:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2A280400CF;
	Wed, 30 Nov 2022 22:39:03 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id ED075163689;
	Wed, 30 Nov 2022 17:38:55 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH] strongswan: fix missing strongswap-plugin-mgf1
Date: Wed, 30 Nov 2022 22:39:00 +0000
Message-Id: <20221130223900.330559-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 30 Nov 2022 22:39:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14126

From: Denys Dmytriyenko <denys@konsulko.com>

Upstream strongswan recipe in meta-openembedded/meta-networking sets
runtime dependency for MGF1 plugin, but it is not enabled by default
and hence no such package gets produced.

The patch will be sent upsream, for now fix it in our bbappend.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-support/strongswan/strongswan_%.bbappend             | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-support/strongswan/strongswan_%.bb=
append b/meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappe=
nd
index 0af8c9c2..ae313c74 100644
--- a/meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend
+++ b/meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend
@@ -8,6 +8,7 @@ PACKAGECONFIG =3D "charon curl openssl stroke sqlite3 \
 EXTRA_OECONF +=3D " \
         --enable-ctr \
         --enable-pkcs11 \
+        --enable-mgf1 \
 "
=20
 SRC_URI +=3D "file://pkcs11_plugin.conf"
--=20
2.25.1


