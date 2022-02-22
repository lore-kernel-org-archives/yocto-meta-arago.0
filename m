Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.9184.1645504914272992530
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:41:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B2D1F40CA8
	for <meta-arago@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:41:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mjnTC4oaPgfn for <meta-arago@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:41:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BE78B40C86
	for <meta-arago@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:41:51 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 87D5E17476C
	for <meta-arago@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:41:51 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [PATCH 09/23] kms++: inherit pkgconfig class
Date: Tue, 22 Feb 2022 04:41:37 +0000
Message-Id: <20220222044151.2844138-10-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222044151.2844138-1-denis@denix.org>
References: <20220222044151.2844138-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

This actually uses pkg-config, so needs to inherit the correct class.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-extras/recipes-graphics/kms++/kms++_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb b/meta=
-arago-extras/recipes-graphics/kms++/kms++_git.bb
index 519b8299..eb39736c 100644
--- a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
+++ b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
@@ -24,7 +24,7 @@ FILES:${PN}-python +=3D "${libdir}/python*/site-package=
s"
=20
 S =3D "${WORKDIR}/git"
=20
-inherit python3native meson update-alternatives
+inherit python3native meson pkgconfig update-alternatives
=20
 ALTERNATIVE_PRIORITY =3D "100"
 ALTERNATIVE:${PN} =3D "kmstest"
--=20
2.25.1

