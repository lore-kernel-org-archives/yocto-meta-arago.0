Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.9173.1645504918619260320
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:41:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1655F40A28
	for <meta-arago@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:41:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QYsomTxPh3aS for <meta-arago@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:41:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3BDEC40C8E
	for <meta-arago@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:41:52 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 01E86174770
	for <meta-arago@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:41:52 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [PATCH 22/23] HACK: packagegroup-arago-tisdk-addons: disable pruss-lld-apps for AM3/4/5
Date: Tue, 22 Feb 2022 04:41:50 +0000
Message-Id: <20220222044151.2844138-23-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222044151.2844138-1-denis@denix.org>
References: <20220222044151.2844138-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

This requires building FW from sources using PDK, CSL, etc. that have bee=
n
deprecated in meta-ti. Disable for now, until binary version can be resto=
red.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons.bb        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packag=
egroup-arago-tisdk-addons.bb
index 90f60e1f..600da50f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons.bb
@@ -112,10 +112,10 @@ EXTRA_PACKAGES:append:omap-a15 =3D " \
 "
=20
 # acontis-atemsys
-EXTRA_PACKAGES:append:am335x-evm =3D " pruss-lld-apps"
-EXTRA_PACKAGES:append:am437x-evm =3D " pruss-lld-apps"
+#EXTRA_PACKAGES:append:am335x-evm =3D " pruss-lld-apps"
+#EXTRA_PACKAGES:append:am437x-evm =3D " pruss-lld-apps"
 # acontis-atemsys
-EXTRA_PACKAGES:append:am57xx-evm =3D " pruss-lld-apps"
+#EXTRA_PACKAGES:append:am57xx-evm =3D " pruss-lld-apps"
=20
 RDEPENDS:${PN} =3D "\
     ${UTILS} \
--=20
2.25.1

