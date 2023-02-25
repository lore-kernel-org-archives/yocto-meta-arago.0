Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56699C7EE30
	for <webhook@archiver.kernel.org>; Sat, 25 Feb 2023 04:42:45 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.38586.1677300160058956399
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 24 Feb 2023 20:42:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 62DC140C5F;
	Sat, 25 Feb 2023 04:42:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7A1Ggxh8aP-j; Sat, 25 Feb 2023 04:42:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 47C3240C8E;
	Sat, 25 Feb 2023 04:42:38 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 0188A163768;
	Fri, 24 Feb 2023 23:42:12 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 6/6] libnl: update bbappend 3.5.0 -> 3.7.0
Date: Sat, 25 Feb 2023 04:42:35 +0000
Message-Id: <20230225044235.1967733-6-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230225044235.1967733-1-denis@denix.org>
References: <20230225044235.1967733-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 25 Feb 2023 04:42:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14233

From: Denys Dmytriyenko <denys@konsulko.com>

oe-core now provides libnl 3.7.0, update bbappend accordingly.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../libnl/{libnl_3.5.0.bbappend =3D> libnl_3.7.0.bbappend}          | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-distro/recipes-support/libnl/{libnl_3.5.0.bbappend =3D=
> libnl_3.7.0.bbappend} (100%)

diff --git a/meta-arago-distro/recipes-support/libnl/libnl_3.5.0.bbappend=
 b/meta-arago-distro/recipes-support/libnl/libnl_3.7.0.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-support/libnl/libnl_3.5.0.bbappend
rename to meta-arago-distro/recipes-support/libnl/libnl_3.7.0.bbappend
--=20
2.25.1


