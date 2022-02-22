Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.8989.1645504915296007947
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:41:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BD60B40CA7
	for <meta-arago@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:41:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zfEv5VrObbg5 for <meta-arago@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:41:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C796940C87
	for <meta-arago@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:41:51 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 9378D17476E
	for <meta-arago@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:41:51 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [PATCH 10/23] packagegroup-arago-base: remove kms++-python
Date: Tue, 22 Feb 2022 04:41:38 +0000
Message-Id: <20220222044151.2844138-11-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222044151.2844138-1-denis@denix.org>
References: <20220222044151.2844138-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

As kms++-python is currectly disabled due to missing dependencies.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-base.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-a=
rago-base.bb
index caa0bc01..31d9ad5b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bas=
e.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bas=
e.bb
@@ -27,6 +27,7 @@ ARAGO_BASE =3D "\
 "
=20
 # these require meta-openembedded/meta-oe layer
+#    kms++-python is not provided yet
 ARAGO_EXTRA =3D "\
     devmem2 \
     tcpdump \
@@ -34,7 +35,6 @@ ARAGO_EXTRA =3D "\
     dropbear \
     openssh-sftp-server \
     kms++ \
-    kms++-python \
     can-utils \
     docker \
 "
--=20
2.25.1

