Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AEC6C6FD3A
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 04:02:57 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.902.1663041776326997023
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 21:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C16ED40D44
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JKlsmeFnYYox for <meta-arago@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 04:02:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7833840D77
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:47 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 13A941749D2
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 00:02:46 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 23/52] arm-benchmarks: Bump SRCREV to fix
 for CPU frequency calculations
Date: Tue, 13 Sep 2022 04:02:17 +0000
Message-Id: <20220913040246.2365077-24-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913040246.2365077-1-denis@denix.org>
References: <20220913040246.2365077-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Sep 2022 04:02:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14034

From: Ryan Eatmon <reatmon@ti.com>

New commit changes logic for determining the CPU frequency for the TI
processors to what the k3conf tool says it is.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-bench=
marks_1.3.bb b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-ben=
chmarks_1.3.bb
index e0f826e9..356b8d91 100644
--- a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1=
.3.bb
+++ b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1=
.3.bb
@@ -7,7 +7,7 @@ SECTION =3D "system"
 PR =3D "r13"
=20
 BRANCH ?=3D "master"
-SRCREV =3D "a3126fd88edd911fff33ace5b813652397bf4cfe"
+SRCREV =3D "fefaf9bdd6f36ab0cebaab8dbf34e5beb50f471c"
=20
 SRC_URI =3D "git://git.ti.com/apps/arm_benchmarks.git;protocol=3Dgit;bra=
nch=3D${BRANCH}"
=20
--=20
2.25.1


