Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.1052.1645573756080144984
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 22 Feb 2022 15:49:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BFE0C40A77;
	Tue, 22 Feb 2022 23:49:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sryuY2QYOzC0; Tue, 22 Feb 2022 23:49:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A729140C2E;
	Tue, 22 Feb 2022 23:49:13 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 7B0D317478A;
	Tue, 22 Feb 2022 18:49:12 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 2/2] arago.conf: bump distro version
Date: Tue, 22 Feb 2022 23:49:10 +0000
Message-Id: <20220222234910.614211-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222234910.614211-1-denis@denix.org>
References: <20220222234910.614211-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

A lot of incompatible change have been merged recently, so it's a good ti=
me
to bump the distro version. It is 2/22/22 after all!

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/conf/distro/arago.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro=
/conf/distro/arago.conf
index b0482e5c..d3f03f2e 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -1,6 +1,6 @@
 # Name and version of the distribution
 DISTRO_NAME =3D "Arago"
-DISTRO_VERSION =3D "2021.09"
+DISTRO_VERSION =3D "2022.02"
 DISTRO_FEED_URI ?=3D "http://lcpd.itg.ti.com"
 BUILD_VARIANT =3D "${@['prod','rt','systest'][int(d.getVar('ARAGO_RT_ENA=
BLE'))+int(d.getVar('ARAGO_SYSTEST_ENABLE'))*2]}"
 TISDK_VERSION ?=3D "live"
--=20
2.25.1

