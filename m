Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.8990.1645504915408037418
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:41:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CC22340C79
	for <meta-arago@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:41:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yT-owMgXXNRi for <meta-arago@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:41:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 12D6540AE9
	for <meta-arago@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:41:52 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id EB5BF17476E
	for <meta-arago@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:41:51 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [PATCH 21/23] HACK: packagegroup-arago-tisdk-addons: disable pru-swuart-fw for am335x
Date: Tue, 22 Feb 2022 04:41:49 +0000
Message-Id: <20220222044151.2844138-22-denis@denix.org>
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
 .../packagegroups/packagegroup-arago-tisdk-addons.bb            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packag=
egroup-arago-tisdk-addons.bb
index 60bf372a..90f60e1f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons.bb
@@ -30,10 +30,10 @@ UTILS_DSP =3D " \
     ${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'gdbc6x dsptop', '',=
 d)} \
 "
=20
+#                       pru-swuart-fw=20
 UTILS:append:ti33x =3D " mmc-utils \
                        switch-config \
                        pru-icss \
-                       pru-swuart-fw \
                        uio-module-drv-test \
                        uio-test-pruss \
 "
--=20
2.25.1

