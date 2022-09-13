Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ADB8C6FD39
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 04:02:57 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.901.1663041776314749680
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 21:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C1EFF40D6E
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z0YknxglVV2q for <meta-arago@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 04:02:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 82B5040D94
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:48 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 142C21749E4
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 00:02:47 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 48/52] ti-llvm3.6: specify SRCREV_FORMAT
Date: Tue, 13 Sep 2022 04:02:42 +0000
Message-Id: <20220913040246.2365077-49-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913040246.2365077-1-denis@denix.org>
References: <20220913040246.2365077-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Sep 2022 04:02:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14033

From: Denys Dmytriyenko <denys@konsulko.com>

When multiple SCMs are used, SRCREV_FORMAT is required for sstate to work=
 properly.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb b/meta=
-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
index 31e9ea8c..959b1f4b 100644
--- a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
+++ b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
@@ -45,6 +45,8 @@ SRC_URI =3D " \
 SRCREV_${LLVM_GIT_NAME} =3D "${LLVM_GIT_SRCREV}"
 SRCREV_${CLANG_GIT_NAME} =3D "${CLANG_GIT_SRCREV}"
=20
+SRCREV_FORMAT =3D "${LLVM_GIT_NAME}"
+
 S =3D "${WORKDIR}/git"
=20
 LIBXML2_INC =3D "`pkg-config libxml-2.0 --cflags`"
--=20
2.25.1


