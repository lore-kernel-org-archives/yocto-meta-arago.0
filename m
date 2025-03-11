Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A842BC28B2F
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 20:01:53 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.19982.1741723304985409581
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 13:01:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 263CA40CB5;
	Tue, 11 Mar 2025 20:01:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mLjO3oC19QBS; Tue, 11 Mar 2025 20:01:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1188A40A20;
	Tue, 11 Mar 2025 20:01:43 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 646A41642EB;
	Tue, 11 Mar 2025 16:01:41 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master-wip][PATCH 5/8] libredblack: move and clean up
Date: Tue, 11 Mar 2025 16:01:36 -0400
Message-Id: <20250311200139.3845524-5-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250311200139.3845524-1-denis@denix.org>
References: <20250311200139.3845524-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Mar 2025 20:01:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15980

From: Denys Dmytriyenko <denys@konsulko.com>

* Move into recipes-extended
* Clean unnecessary comments

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>

libredblack cleanup

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../sysrepo}/libredblack_git.bb                             | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)
 rename meta-arago-extras/{recipes-sysrepo/libredblack =3D> recipes-exten=
ded/sysrepo}/libredblack_git.bb (62%)

diff --git a/meta-arago-extras/recipes-sysrepo/libredblack/libredblack_gi=
t.bb b/meta-arago-extras/recipes-extended/sysrepo/libredblack_git.bb
similarity index 62%
rename from meta-arago-extras/recipes-sysrepo/libredblack/libredblack_git=
.bb
rename to meta-arago-extras/recipes-extended/sysrepo/libredblack_git.bb
index 412d08d8..80283c73 100644
--- a/meta-arago-extras/recipes-sysrepo/libredblack/libredblack_git.bb
+++ b/meta-arago-extras/recipes-extended/sysrepo/libredblack_git.bb
@@ -10,12 +10,8 @@ SRCREV =3D "a399310d99b61eec4d3c0677573ab5dddcf9395d"
=20
 S =3D "${WORKDIR}/git"
=20
-# NOTE: if this software is not capable of being built in a separate bui=
ld directory
-# from the source, you should replace autotools with autotools-brokensep=
 in the
-# inherit line
 inherit python3native autotools
=20
-# Specify any options you want to pass to the configure script using EXT=
RA_OECONF:
-EXTRA_OECONF =3D " --without-rbgen "
+EXTRA_OECONF =3D "--without-rbgen"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


