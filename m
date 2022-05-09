Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A08E2C4332F
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 18:00:53 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.632.1652119252739336567
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 09 May 2022 11:00:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1082B40C56
	for <meta-arago@lists.yoctoproject.org>;
 Mon,  9 May 2022 18:00:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c1Xurs9L3b5f for <meta-arago@lists.yoctoproject.org>;
	Mon,  9 May 2022 18:00:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 032C7407DA
	for <meta-arago@lists.yoctoproject.org>;
 Mon,  9 May 2022 18:00:51 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id C127E1748EE
	for <meta-arago@lists.yoctoproject.org>;
 Mon,  9 May 2022 14:00:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master][PATCH 1/3] glsdk-util-scripts: update to the latest and
 specify branch
Date: Mon,  9 May 2022 18:00:49 +0000
Message-Id: <20220509180051.2146987-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 09 May 2022 18:00:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13843

From: Denys Dmytriyenko <denys@konsulko.com>

Fixes these warnings:

| WARNING: glsdk-util-scripts-1.0-r1 do_fetch: URL: git://git.ti.com/glsd=
k/util-scripts.git
| does not set any branch parameter. The future default branch used by to=
ols and repositories
| is uncertain and we will therefore soon require this is set in all git =
urls.
| WARNING: glsdk-util-scripts-1.0-r1 do_unpack: URL: git://git.ti.com/gls=
dk/util-scripts.git
| does not set any branch parameter. The future default branch used by to=
ols and repositories
| is uncertain and we will therefore soon require this is set in all git =
urls.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-devtools/util-scripts/glsdk-util-scripts.bb      | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-s=
cripts.bb b/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-sc=
ripts.bb
index cf187a29..5ed4e034 100644
--- a/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.=
bb
+++ b/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.=
bb
@@ -1,15 +1,14 @@
 DESCRIPTION =3D "Utility scripts for debug"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://debug/filter-dmesg-rproc.sh;md5=3Dce264e7cb=
c036fd2f37073947c2f0800"
-PR =3D "r1"
=20
 COMPATIBLE_MACHINE =3D "omap-a15|j7"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 RDEPENDS:${PN} +=3D "bash"
=20
-SRC_URI =3D "git://git.ti.com/glsdk/util-scripts.git"
+SRC_URI =3D "git://git.ti.com/glsdk/util-scripts.git;branch=3Dmaster"
=20
-SRCREV =3D "df50ca1592cae97ad0c7285686d602926b4f7305"
+SRCREV =3D "5a3f8eca444a5c4bf8855705a3018d482e3e19cd"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.25.1


