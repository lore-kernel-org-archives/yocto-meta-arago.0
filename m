Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7F7CC6FD28
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 04:02:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.886.1663041770694036707
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 21:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 29CCC40D93
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WjAs78KLwK7l for <meta-arago@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 04:02:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2056440D8C
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:48 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id B5A6D1749D3
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 00:02:46 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 40/52] pcitest: upgrade 5.4 -> 5.10
Date: Tue, 13 Sep 2022 04:02:34 +0000
Message-Id: <20220913040246.2365077-41-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913040246.2365077-1-denis@denix.org>
References: <20220913040246.2365077-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Sep 2022 04:02:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14019

From: Denys Dmytriyenko <denys@konsulko.com>

pcitest resides in kernel tree - use the same tree and commit ID as for t=
he
kernel and linux-libc-headers.

COPYING file had minor changes, adjust checksum accordingly.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../pcitest/{pcitest_5.4.bb =3D> pcitest_5.10.bb}             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-arago-extras/recipes-kernel/pcitest/{pcitest_5.4.bb =3D> pci=
test_5.10.bb} (73%)

diff --git a/meta-arago-extras/recipes-kernel/pcitest/pcitest_5.4.bb b/me=
ta-arago-extras/recipes-kernel/pcitest/pcitest_5.10.bb
similarity index 73%
rename from meta-arago-extras/recipes-kernel/pcitest/pcitest_5.4.bb
rename to meta-arago-extras/recipes-kernel/pcitest/pcitest_5.10.bb
index 2d7f370f..02188c97 100644
--- a/meta-arago-extras/recipes-kernel/pcitest/pcitest_5.4.bb
+++ b/meta-arago-extras/recipes-kernel/pcitest/pcitest_5.10.bb
@@ -1,9 +1,9 @@
 SUMMARY =3D "Linux Kernel PCI test"
 LICENSE =3D "GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b8=
814"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
=20
-BRANCH =3D "ti-linux-5.4.y"
-SRCREV =3D "738552d0b0292e148b35d60ec47ca3c8dd6007b4"
+BRANCH =3D "ti-linux-5.10.y"
+SRCREV =3D "73aa709ca10103b61fba3a07471dbb4dcb56db45"
 SRC_URI =3D "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protoc=
ol=3Dgit;branch=3D${BRANCH}"
=20
 S =3D "${WORKDIR}/git"
--=20
2.25.1


