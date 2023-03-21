Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 690D2C6FD20
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 22:10:29 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.28511.1679436622194931414
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 21 Mar 2023 15:10:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3591440C46
	for <meta-arago@lists.yoctoproject.org>; Tue, 21 Mar 2023 22:10:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rsujH2tG2ASp for <meta-arago@lists.yoctoproject.org>;
	Tue, 21 Mar 2023 22:10:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 21D2340C06
	for <meta-arago@lists.yoctoproject.org>; Tue, 21 Mar 2023 22:10:20 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id E42391637C3
	for <meta-arago@lists.yoctoproject.org>; Tue, 21 Mar 2023 18:09:46 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [kirkstone/master][PATCH v2 4/4] packagegroup-arago-base-tisdk: adjust for removal of OPTEEOUTPUTMACHINE
Date: Tue, 21 Mar 2023 22:10:19 +0000
Message-Id: <20230321221019.2819330-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 21 Mar 2023 22:10:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14269

From: Denys Dmytriyenko <denys@konsulko.com>

OPTEEOUTPUTMACHINE usage was removed from K3 platforms in meta-ti. Since =
K3
platforms all use optee, include corresponding components unconditionally=
.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
v2 - add leading whitespace for :append override - it doesn't break now a=
s
RDEPENDS has a trailing newline, but it's best practice to have one here.

 .../packagegroups/packagegroup-arago-base-tisdk.bb            | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-base-tisdk.bb b/meta-arago-distro/recipes-core/packagegroups/packageg=
roup-arago-base-tisdk.bb
index 292676c1..6a21bdd7 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bas=
e-tisdk.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bas=
e-tisdk.bb
@@ -27,5 +27,7 @@ RDEPENDS:${PN} =3D "\
     nfs-utils-client \
     cifs-utils \
     phytool \
-    ${@bb.utils.contains_any('OPTEEOUTPUTMACHINE', 'ti k3', "${OPTEE_PKG=
S}", "", d)} \
+    ${@bb.utils.contains_any('OPTEEOUTPUTMACHINE', 'ti', "${OPTEE_PKGS}"=
, "", d)} \
 "
+
+RDEPENDS:${PN}:append:k3 =3D " ${OPTEE_PKGS}"
--=20
2.25.1


