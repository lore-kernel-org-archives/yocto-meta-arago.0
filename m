Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72590C46CD2
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 22:07:20 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.175.1706134032604820329
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 24 Jan 2024 14:07:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DAECD40C30;
	Wed, 24 Jan 2024 22:07:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ylwtTBk3u4uh; Wed, 24 Jan 2024 22:07:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CDB1440C2C;
	Wed, 24 Jan 2024 22:07:09 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 86257163DDD;
	Wed, 24 Jan 2024 17:07:09 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 2/2] nativesdk-packagegroup-arago-tisdk-host: replace distutils with setuptools
Date: Wed, 24 Jan 2024 17:07:08 -0500
Message-Id: <20240124220708.2031475-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240124220708.2031475-1-denis@denix.org>
References: <20240124220708.2031475-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 24 Jan 2024 22:07:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15091

From: Denys Dmytriyenko <denys@konsulko.com>

distutils was deprecated from latest Python, use setuptools intead.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packa=
gegroup-arago-tisdk-host.bb b/meta-arago-extras/recipes-core/packagegroup=
s/nativesdk-packagegroup-arago-tisdk-host.bb
index 859d9eab..7e77d12f 100644
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup=
-arago-tisdk-host.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup=
-arago-tisdk-host.bb
@@ -27,7 +27,7 @@ EXTRA_TI_TOOLS =3D " \
 RDEPENDS:${PN} =3D "\
     nativesdk-packagegroup-sdk-host \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'nativesdk-waylan=
d-dev', '', d)} \
-    nativesdk-python3-distutils \
+    nativesdk-python3-setuptools \
     nativesdk-python3-numpy \
     nativesdk-git \
     nativesdk-mtd-utils-ubifs \
--=20
2.25.1


