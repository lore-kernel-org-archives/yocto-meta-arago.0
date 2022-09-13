Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C2BC6FA8E
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 04:02:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.887.1663041770961035764
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 21:02:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8DB4640D96
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 56Z76R6iRZ29 for <meta-arago@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 04:02:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7F86840D73
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:48 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id F20AF1749DE
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 00:02:46 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 46/52] packagegroup-arago-base-tisdk: Add
 optee-examples
Date: Tue, 13 Sep 2022 04:02:40 +0000
Message-Id: <20220913040246.2365077-47-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913040246.2365077-1-denis@denix.org>
References: <20220913040246.2365077-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Sep 2022 04:02:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14023

From: Andrew Davis <afd@ti.com>

This includes demos of secure storage that we can use for testing DKEK an=
d
RPMB support. Add this package next to the other OP-TEE support packages.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-base-tisdk.bb b/meta-arago-distro/recipes-core/packagegroups/packageg=
roup-arago-base-tisdk.bb
index 7812f981..292676c1 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bas=
e-tisdk.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bas=
e-tisdk.bb
@@ -9,6 +9,7 @@ inherit packagegroup
 OPTEE_PKGS =3D " \
     optee-client \
     optee-test \
+    optee-examples \
 "
=20
 RDEPENDS:${PN} =3D "\
--=20
2.25.1


