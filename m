Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF9AC369A2
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 15:47:51 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.79365.1744127264038874162
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 08 Apr 2025 08:47:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 48BD140C88;
	Tue,  8 Apr 2025 15:47:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7uqbOtqOwi0S; Tue,  8 Apr 2025 15:47:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 32ED040C61;
	Tue,  8 Apr 2025 15:47:42 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 0C62116593E;
	Tue,  8 Apr 2025 11:47:41 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/scarthgap][PATCH 3/3] arago.conf: don't use ASSUME_PROVIDED for skipping perl
Date: Tue,  8 Apr 2025 11:47:39 -0400
Message-Id: <20250408154739.2716116-3-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250408154739.2716116-1-denis@denix.org>
References: <20250408154739.2716116-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 08 Apr 2025 15:47:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16162

From: Denys Dmytriyenko <denys@konsulko.com>

Use "dummy-sdk-package" facility to avoid packaging nativesdk perl
into the SDK, instead of less flexible ASSUME_PROVIDED mechanism
that causes build-deps QA errors.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/conf/distro/arago.conf | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro=
/conf/distro/arago.conf
index fb0f898f..6287cc44 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -142,9 +142,3 @@ SKIP_META_VIRT_SANITY_CHECK =3D "1"
 # included by default. If you enable any of those codecs you should chec=
k
 # if the below acceptance flags still work for your software distributio=
n
 LICENSE_FLAGS_ACCEPTED =3D "commercial_ffmpeg commercial_gstreamer1.0-li=
bav"
-
-# Do not package own copy of perl into devkit, rely on host one
-ASSUME_PROVIDED +=3D "nativesdk-perl"
-
-# https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15552
-INSANE_SKIP:nativesdk-openssl-misc +=3D "build-deps"
--=20
2.25.1


