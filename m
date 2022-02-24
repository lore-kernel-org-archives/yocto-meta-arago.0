Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.325.1645733099867568510
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 24 Feb 2022 12:05:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BA05540C22;
	Thu, 24 Feb 2022 20:04:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pp32fzM-0dQJ; Thu, 24 Feb 2022 20:04:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A5CB840C85;
	Thu, 24 Feb 2022 20:04:57 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 2051B1747B2;
	Thu, 24 Feb 2022 15:04:56 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 3/3] HACK: ti-test: disable viddev-test-app for now due to breakage
Date: Thu, 24 Feb 2022 20:04:55 +0000
Message-Id: <20220224200455.2601205-3-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224200455.2601205-1-denis@denix.org>
References: <20220224200455.2601205-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

https://lists.yoctoproject.org/g/meta-ti/message/14477

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/recipes-core/packagegroups/ti-test.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/me=
ta-arago-distro/recipes-core/packagegroups/ti-test.bb
index f0efe607..07dbdf38 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
@@ -81,9 +81,10 @@ ARAGO_TI_TEST:append:k3 =3D " \
     k3conf \
 "
=20
+# Disable due to breakage
+#    viddec-test-app=20
 ARAGO_TI_TEST:append:j7 =3D " \
     ufs-utils \
-    viddec-test-app \
     videnc-test-app \
 "
=20
--=20
2.25.1

