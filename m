Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 113F3C6FA82
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 04:03:07 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.899.1663041778372038701
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 21:02:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CFA3C40D6E
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ze36_4GN-SYB for <meta-arago@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 04:02:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 828DD40D8C
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:48 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 1FDC01749D1
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 00:02:47 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 49/52] ti-llvm3.6: inherit pkgconfig
Date: Tue, 13 Sep 2022 04:02:43 +0000
Message-Id: <20220913040246.2365077-50-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913040246.2365077-1-denis@denix.org>
References: <20220913040246.2365077-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Sep 2022 04:03:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14035

From: Denys Dmytriyenko <denys@konsulko.com>

In order to use pkg-config tool.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb b/meta=
-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
index 959b1f4b..03240e68 100644
--- a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
+++ b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
@@ -15,6 +15,8 @@ do_configure:prepend() {
=20
 require recipes-core/llvm/llvm.inc
=20
+inherit pkgconfig
+
 LIC_FILES_CHKSUM =3D "file://LICENSE.TXT;md5=3D47e311aa9caedd1b3abf098bd=
7814d1d"
=20
 DEPENDS +=3D "libxml2 groff-native"
--=20
2.25.1


