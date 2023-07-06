Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61142EB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 16:43:01 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.29608.1688661775341941835
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Jul 2023 09:42:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 218D340C83;
	Thu,  6 Jul 2023 16:42:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lgiY5A2pb3qH; Thu,  6 Jul 2023 16:42:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0284140C13;
	Thu,  6 Jul 2023 16:42:52 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id ADCAF163BC2;
	Thu,  6 Jul 2023 12:42:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH 1/2] linuxptp: drop outdated bbappend
Date: Thu,  6 Jul 2023 16:42:49 +0000
Message-Id: <20230706164250.1888789-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Jul 2023 16:43:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14772

From: Denys Dmytriyenko <denys@konsulko.com>

The fork of the older version hasn't been maintained for few years and
upstream has a newer version, so this bbappend is not being used anyway.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../linuxptp/linuxptp_3.0.bbappend              | 17 -----------------
 1 file changed, 17 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linux=
ptp_3.0.bbappend

diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_3.0=
.bbappend b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_3.0.=
bbappend
deleted file mode 100644
index cf11b475..00000000
--- a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_3.0.bbappe=
nd
+++ /dev/null
@@ -1,17 +0,0 @@
-PR:append =3D ".arago0"
-PV =3D "3.0+git${SRCPV}"
-
-BRANCH =3D "ti-linuxptp"
-SRCREV =3D "f155c21283a0421f5e1e0b5e850c8a9a71d72453"
-
-SRC_URI =3D " \
-    git://git.ti.com/git/processor-sdk/linuxptp.git;branch=3D${BRANCH} \
-    file://build-Allow-CC-and-prefix-to-be-overriden.patch \
-    file://Use-cross-cpp-in-incdefs.patch \
-"
-
-S =3D "${WORKDIR}/git"
-
-do_install:append () {
-    install -p ${S}/phc2pwm ${D}/${bindir}
-}
--=20
2.25.1


