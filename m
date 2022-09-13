Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA319C6FD33
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 04:02:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.929.1663041768993542043
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 21:02:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6895840D7E
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UNKCKPTVzKm7 for <meta-arago@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 04:02:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 517E440D76
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:47 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 79C8A1749D3
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 00:02:45 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 07/52] packagegroup-arago-base-tisdk: Fix
 issue with optee pkgs not being included
Date: Tue, 13 Sep 2022 04:02:01 +0000
Message-Id: <20220913040246.2365077-8-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913040246.2365077-1-denis@denix.org>
References: <20220913040246.2365077-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Sep 2022 04:02:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13992

From: Yogesh Siraswar <yogeshs@ti.com>

In core-sdk 7.1 meta-ti OPTEEMACHINE description was updated to use combi=
ned
OPTEE_MACHINE and OPTEE_FLAVOR.

8ac0c757 conf/machine: pass OPTEEFLAVOR via OPTEEMACHINE as
<mach>-<flavor>

This caused the OPTEEMACHINE check to fail that was used to add
optee-client and optee-test. Fixing the issue by using
OPTEEOUTPUTMACHINE since it still uses ti/k3 as parameter.

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../packagegroups/packagegroup-arago-base-tisdk.bb            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-base-tisdk.bb b/meta-arago-distro/recipes-core/packagegroups/packageg=
roup-arago-base-tisdk.bb
index a27a13ef..7812f981 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bas=
e-tisdk.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bas=
e-tisdk.bb
@@ -1,6 +1,6 @@
 DESCRIPTION =3D "Additional packages beyond console packages shared by T=
I SDKs"
 LICENSE =3D "MIT"
-PR =3D "r22"
+PR =3D "r23"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
@@ -26,5 +26,5 @@ RDEPENDS:${PN} =3D "\
     nfs-utils-client \
     cifs-utils \
     phytool \
-    ${@bb.utils.contains_any('OPTEEMACHINE', 'ti k3', "${OPTEE_PKGS}", "=
", d)} \
+    ${@bb.utils.contains_any('OPTEEOUTPUTMACHINE', 'ti k3', "${OPTEE_PKG=
S}", "", d)} \
 "
--=20
2.25.1


