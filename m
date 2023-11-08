Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A73BAC4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 00:03:42 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2358.1699401812834275799
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 07 Nov 2023 16:03:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 30F6F40CCB;
	Wed,  8 Nov 2023 00:03:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oZJPiVs5D96a; Wed,  8 Nov 2023 00:03:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B9FBB40CA7;
	Wed,  8 Nov 2023 00:03:30 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 746C7163D4E;
	Tue,  7 Nov 2023 19:03:30 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH] arago.conf: bump distro version
Date: Wed,  8 Nov 2023 00:03:29 +0000
Message-Id: <20231108000329.3065800-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 08 Nov 2023 00:03:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15002

From: Denys Dmytriyenko <denys@konsulko.com>

A bit arbitrary, but it seems like a good point in time to bump Arago Dis=
tro
version, since things are relatively stable currently and to coincide wit=
h
the Yocto Project Nanbield release.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/conf/distro/arago.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro=
/conf/distro/arago.conf
index 8232ca27..83b1a18a 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -1,6 +1,6 @@
 # Name and version of the distribution
 DISTRO_NAME =3D "Arago"
-DISTRO_VERSION =3D "2023.04"
+DISTRO_VERSION =3D "2023.10"
 DISTRO_FEED_URI ?=3D "http://lcpd.itg.ti.com"
 BUILD_VARIANT =3D "${@['prod','rt','systest'][int(d.getVar('ARAGO_RT_ENA=
BLE'))+int(d.getVar('ARAGO_SYSTEST_ENABLE'))*2]}"
 TISDK_VERSION ?=3D "live"
--=20
2.25.1


