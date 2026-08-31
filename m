Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A95F9C61DD3
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 21:02:17 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6696.1788210133686678033
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 31 Aug 2026 14:02:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CC4FF40C3E;
	Mon, 31 Aug 2026 21:02:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DoJJxUM_3Dzd; Mon, 31 Aug 2026 21:02:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A17BE40B13;
	Mon, 31 Aug 2026 21:02:11 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 9368B1741B8;
	Mon, 31 Aug 2026 17:02:10 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
Subject: [master][PATCH] open62541: update bbappend for new version
Date: Mon, 31 Aug 2026 17:02:10 -0400
Message-Id: <20260831210210.1908432-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 31 Aug 2026 21:02:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17627

From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>

meta-openembedded has bumped the version recently [1], update our
bbappend accordingly.

[1] https://git.openembedded.org/meta-openembedded/commit/?id=3Db6c09f663=
0d5e88a993252cb7e5ee23aec9fd569

Signed-off-by: Denys Dmytriyenko (TI) <denys@konsulko.com>
---
 .../{open62541_1.5.6.bbappend =3D> open62541_1.5.7.bbappend}        | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-extras/recipes-connectivity/open62541/{open62541_1.5.6=
.bbappend =3D> open62541_1.5.7.bbappend} (100%)

diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541_1=
.5.6.bbappend b/meta-arago-extras/recipes-connectivity/open62541/open6254=
1_1.5.7.bbappend
similarity index 100%
rename from meta-arago-extras/recipes-connectivity/open62541/open62541_1.=
5.6.bbappend
rename to meta-arago-extras/recipes-connectivity/open62541/open62541_1.5.=
7.bbappend
--=20
2.25.1


