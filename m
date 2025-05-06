Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64496C3ABBE
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 20:01:07 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.85396.1746561661720021607
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 06 May 2025 13:01:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BA06E40CC0;
	Tue,  6 May 2025 20:01:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1U5MIpqgSl1P; Tue,  6 May 2025 20:01:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9D91A40CC5;
	Tue,  6 May 2025 20:00:59 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 5772C167925;
	Tue,  6 May 2025 16:00:59 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/scarthgap][PATCH 2/2] arm-benchmarks: force older GNU/C standard
Date: Tue,  6 May 2025 16:00:58 -0400
Message-Id: <20250506200058.1227765-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250506200058.1227765-1-denis@denix.org>
References: <20250506200058.1227765-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 06 May 2025 20:01:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16184

From: Denys Dmytriyenko <denys@konsulko.com>

This is an old code base based on Dhrystone and hasn't been updated in
a very long time. It now fails to compile with gcc-15 (C23 standard).
Force compilation with GNU/C11 standard instead.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-benchmark/arm-benchmarks/arm-benchma=
rks_1.3.bb b/meta-arago-test/recipes-benchmark/arm-benchmarks/arm-benchma=
rks_1.3.bb
index 3e67b960..208f65dd 100644
--- a/meta-arago-test/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3=
.bb
+++ b/meta-arago-test/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3=
.bb
@@ -15,7 +15,7 @@ S =3D "${WORKDIR}/git"
=20
 do_compile() {
 	export CROSS_COMPILE=3D${TARGET_PREFIX}
-	export CFLAGS=3D'${TARGET_CC_ARCH}'
+	export CFLAGS=3D'${TARGET_CC_ARCH} -std=3Dgnu11'
 	# build the release version
 	oe_runmake release CC=3D"${CC}"
 }
--=20
2.25.1


