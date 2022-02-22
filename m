Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.9111.1645504915445636395
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:41:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CEBD540C87
	for <meta-arago@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:41:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RCjHyFLd7YNh for <meta-arago@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:41:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2363E40C2E
	for <meta-arago@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:41:52 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 0CA71174773
	for <meta-arago@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:41:52 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [PATCH 23/23] HACK: arago-image: disable make_bootfiles_symlinks_relative postprocess due to bashisms
Date: Tue, 22 Feb 2022 04:41:51 +0000
Message-Id: <20220222044151.2844138-24-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222044151.2844138-1-denis@denix.org>
References: <20220222044151.2844138-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/recipes-core/images/arago-image.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta=
-arago-distro/recipes-core/images/arago-image.inc
index 12446185..73c49ce4 100644
--- a/meta-arago-distro/recipes-core/images/arago-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-image.inc
@@ -38,7 +38,7 @@ make_bootfiles_symlinks_relative() {
     done
 }
=20
-ROOTFS_POSTPROCESS_COMMAND +=3D "make_bootfiles_symlinks_relative;"
+#ROOTFS_POSTPROCESS_COMMAND +=3D "make_bootfiles_symlinks_relative;"
=20
 BAD_RECOMMENDATIONS +=3D " \
     ti-llvm3.6-dev \
--=20
2.25.1

