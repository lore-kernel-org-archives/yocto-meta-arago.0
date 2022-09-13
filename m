Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07B05C54EE9
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 04:03:07 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.863.1663041778367934232
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 21:02:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CE46940D44
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XAveAUFsdgFU for <meta-arago@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 04:02:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8368540D95
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:48 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 089EB1749E0
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 00:02:47 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 47/52] ltp-ddt: update to the latest
Date: Tue, 13 Sep 2022 04:02:41 +0000
Message-Id: <20220913040246.2365077-48-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913040246.2365077-1-denis@denix.org>
References: <20220913040246.2365077-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Sep 2022 04:03:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14036

From: Denys Dmytriyenko <denys@konsulko.com>

This matches latest commit in Dunfell.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.=
bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
index 9ea0df36..bf6e48c7 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
@@ -14,7 +14,7 @@ PE =3D "1"
 PR =3D "r5"
 PV:append =3D "+git${SRCPV}"
=20
-SRCREV =3D "cfff0a2c889f29c03b9a3ee547a147b1c6727e2c"
+SRCREV =3D "b79e1ec3e4f5501891fdf307548a9d6616b00bd0"
 BRANCH ?=3D "master"
=20
 SRC_URI:remove =3D "git://github.com/linux-test-project/ltp.git;protocol=
=3Dhttps;branch=3Dmaster"
--=20
2.25.1


