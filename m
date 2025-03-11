Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A83E5C282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 20:01:53 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.19981.1741723304970926808
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 13:01:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3315040A20;
	Tue, 11 Mar 2025 20:01:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 21NFt_m-zkWN; Tue, 11 Mar 2025 20:01:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1915640B66;
	Tue, 11 Mar 2025 20:01:43 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 4DCE61642E9;
	Tue, 11 Mar 2025 16:01:41 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master-wip][PATCH 3/8] libyang: move bbappend
Date: Tue, 11 Mar 2025 16:01:34 -0400
Message-Id: <20250311200139.3845524-3-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250311200139.3845524-1-denis@denix.org>
References: <20250311200139.3845524-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Mar 2025 20:01:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15981

From: Denys Dmytriyenko <denys@konsulko.com>

* Move into recipes-extended

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../libyang =3D> recipes-extended/sysrepo}/libyang_%.bbappend       | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-extras/{recipes-sysrepo/libyang =3D> recipes-extended/=
sysrepo}/libyang_%.bbappend (100%)

diff --git a/meta-arago-extras/recipes-sysrepo/libyang/libyang_%.bbappend=
 b/meta-arago-extras/recipes-extended/sysrepo/libyang_%.bbappend
similarity index 100%
rename from meta-arago-extras/recipes-sysrepo/libyang/libyang_%.bbappend
rename to meta-arago-extras/recipes-extended/sysrepo/libyang_%.bbappend
--=20
2.25.1


