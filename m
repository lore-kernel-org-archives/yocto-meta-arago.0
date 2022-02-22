Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.9107.1645504914221780328
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:41:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A78C440C7B
	for <meta-arago@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:41:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D3-jUo6BdUKD for <meta-arago@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:41:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B257840C7F
	for <meta-arago@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:41:51 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 6FECB174772
	for <meta-arago@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:41:51 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [PATCH 07/23] arago.conf: update curl PACKAGECONFIG
Date: Tue, 22 Feb 2022 04:41:35 +0000
Message-Id: <20220222044151.2844138-8-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222044151.2844138-1-denis@denix.org>
References: <20220222044151.2844138-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

curl recently changed PACKAGECONFIG from ssl to openssl, update according=
ly.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/conf/distro/arago.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro=
/conf/distro/arago.conf
index 0aab847b..f4e935dc 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -116,7 +116,7 @@ PACKAGECONFIG:append:pn-qtwayland =3D " examples"
 PACKAGECONFIG:append:pn-qtwebengine =3D " examples"
=20
 # Prefer OpenSSL over GnuTLS for curl due to TSU exemptions
-PACKAGECONFIG:pn-curl =3D "${@bb.utils.contains("DISTRO_FEATURES", "ipv6=
", "ipv6", "", d)} ssl zlib"
+PACKAGECONFIG:pn-curl =3D "${@bb.utils.contains("DISTRO_FEATURES", "ipv6=
", "ipv6", "", d)} openssl zlib"
=20
 PACKAGECONFIG:pn-glmark2 =3D "drm-gles2 wayland-gles2"
=20
--=20
2.25.1

