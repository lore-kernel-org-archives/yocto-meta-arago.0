Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A86C6C3DA4A
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 20:01:53 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.20220.1741723306414371380
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 13:01:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7F5F940CB6;
	Tue, 11 Mar 2025 20:01:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 08QxvBSBAxyn; Tue, 11 Mar 2025 20:01:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 673C540CAA;
	Tue, 11 Mar 2025 20:01:44 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 668DF1642ED;
	Tue, 11 Mar 2025 16:01:41 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master-wip][PATCH 6/8] nw-configurator: move and clean up
Date: Tue, 11 Mar 2025 16:01:37 -0400
Message-Id: <20250311200139.3845524-6-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250311200139.3845524-1-denis@denix.org>
References: <20250311200139.3845524-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Mar 2025 20:01:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15986

From: Denys Dmytriyenko <denys@konsulko.com>

* Move into recipes-extended
* Set SUMMARY instead of DESCRIPTION
* FILES_${PN}-dev is incorrect - old syntax and is not needed
* Tabs/spaces cleanup

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../sysrepo}/nw-configurator.bb                             | 6 ++----
 .../sysrepo/nw-configurator}/nw-configurator.c              | 0
 2 files changed, 2 insertions(+), 4 deletions(-)
 rename meta-arago-extras/{recipes-sysrepo/nw-configurator =3D> recipes-e=
xtended/sysrepo}/nw-configurator.bb (74%)
 rename meta-arago-extras/{recipes-sysrepo/nw-configurator/files =3D> rec=
ipes-extended/sysrepo/nw-configurator}/nw-configurator.c (100%)

diff --git a/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configu=
rator.bb b/meta-arago-extras/recipes-extended/sysrepo/nw-configurator.bb
similarity index 74%
rename from meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configur=
ator.bb
rename to meta-arago-extras/recipes-extended/sysrepo/nw-configurator.bb
index b383571d..50debb36 100644
--- a/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.b=
b
+++ b/meta-arago-extras/recipes-extended/sysrepo/nw-configurator.bb
@@ -1,4 +1,4 @@
-DESCRIPTION =3D "Sysrepo based repo to configure EST"
+SUMMARY =3D "Sysrepo based repo to configure EST"
=20
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://nw-configurator.c;beginline=3D1;endline=3D3=
3;md5=3D3538caaf9bfb8372347877ad393660fa"
@@ -8,14 +8,12 @@ SRC_URI =3D "file://nw-configurator.c"
 S =3D "${WORKDIR}/sources"
 UNPACKDIR =3D "${S}"
=20
-FILES_${PN}-dev =3D "${includedir}"
-
 DEPENDS =3D "sysrepo"
=20
 inherit autotools pkgconfig
=20
 do_compile() {
-	${CC} ${CFLAGS} ${LDFLAGS} -I=3D${STAGING_INCDIR}	${S}/nw-configurator.=
c -o nw-configurator -lsysrepo
+	${CC} ${CFLAGS} ${LDFLAGS} -I=3D${STAGING_INCDIR} ${S}/nw-configurator.=
c -o nw-configurator -lsysrepo
 }
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-arago-extras/recipes-sysrepo/nw-configurator/files/nw-c=
onfigurator.c b/meta-arago-extras/recipes-extended/sysrepo/nw-configurato=
r/nw-configurator.c
similarity index 100%
rename from meta-arago-extras/recipes-sysrepo/nw-configurator/files/nw-co=
nfigurator.c
rename to meta-arago-extras/recipes-extended/sysrepo/nw-configurator/nw-c=
onfigurator.c
--=20
2.25.1


