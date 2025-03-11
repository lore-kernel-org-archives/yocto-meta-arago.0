Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 725E1C282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 16:51:52 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.14947.1741711910379064518
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 09:51:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A922040CB0;
	Tue, 11 Mar 2025 16:51:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M747m-re64SY; Tue, 11 Mar 2025 16:51:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8B9F240CAA;
	Tue, 11 Mar 2025 16:51:48 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id E121D1642C8;
	Tue, 11 Mar 2025 12:51:47 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/scarthgap][PATCH] open62541: fix examples binaries packaging
Date: Tue, 11 Mar 2025 12:51:46 -0400
Message-Id: <20250311165146.3713480-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Mar 2025 16:51:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15973

From: Denys Dmytriyenko <denys@konsulko.com>

Recent update in upstream meta-oe changed FILES list to only include
libraries, which is correct when no examples are built. Our bbappend
enables building examples and those are placed into own directory.
But there are 2 exceptions where ua_client and ua_server are placed
under ${bindir} and now those trigger a QA error about unpackaged
files. While these 2 files should probably go along with other example
binaries, for now restore the previous behavior of packaging them
into ${bindir} in case some downstream usage expects them there.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-connectivity/open62541/open62541-arago.inc           | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541-a=
rago.inc b/meta-arago-extras/recipes-connectivity/open62541/open62541-ara=
go.inc
index 3d72f0e9..745c88a1 100644
--- a/meta-arago-extras/recipes-connectivity/open62541/open62541-arago.in=
c
+++ b/meta-arago-extras/recipes-connectivity/open62541/open62541-arago.in=
c
@@ -28,6 +28,7 @@ do_install:append() {
 }
=20
 PACKAGES =3D+ "${PN}-examples ${PN}-tests"
+FILES:${PN} +=3D "${bindir}"
 FILES:${PN}-dev +=3D "${libdir}/cmake/* ${datadir}/${BPN}/tools"
 FILES:${PN}-examples +=3D "${datadir}/${BPN}/examples"
 FILES:${PN}-tests +=3D "${datadir}/${BPN}/tests"
--=20
2.25.1


