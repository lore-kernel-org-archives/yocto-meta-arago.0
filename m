Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6AB7C35FF2
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 20:01:53 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.19980.1741723304970714362
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 13:01:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 34ADF40CBE;
	Tue, 11 Mar 2025 20:01:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VxV28lW07Frq; Tue, 11 Mar 2025 20:01:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1C37040CAA;
	Tue, 11 Mar 2025 20:01:43 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 58A671642EA;
	Tue, 11 Mar 2025 16:01:41 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master-wip][PATCH 4/8] libnetconf2: move and clean up
Date: Tue, 11 Mar 2025 16:01:35 -0400
Message-Id: <20250311200139.3845524-4-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250311200139.3845524-1-denis@denix.org>
References: <20250311200139.3845524-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Mar 2025 20:01:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15982

From: Denys Dmytriyenko <denys@konsulko.com>

* Move into recipes-extended
* Shorten SUMMARY, split DESCRIPTION
* Don't hardcode /usr when passing to CMake

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../sysrepo}/libnetconf2_git.bb                          | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename meta-arago-extras/{recipes-sysrepo/libnetconf2 =3D> recipes-exten=
ded/sysrepo}/libnetconf2_git.bb (51%)

diff --git a/meta-arago-extras/recipes-sysrepo/libnetconf2/libnetconf2_gi=
t.bb b/meta-arago-extras/recipes-extended/sysrepo/libnetconf2_git.bb
similarity index 51%
rename from meta-arago-extras/recipes-sysrepo/libnetconf2/libnetconf2_git=
.bb
rename to meta-arago-extras/recipes-extended/sysrepo/libnetconf2_git.bb
index c55c9ff5..3ffd19ea 100644
--- a/meta-arago-extras/recipes-sysrepo/libnetconf2/libnetconf2_git.bb
+++ b/meta-arago-extras/recipes-extended/sysrepo/libnetconf2_git.bb
@@ -1,5 +1,6 @@
-SUMMARY =3D "libnetconf2 is a NETCONF library in C intended for building=
 NETCONF clients and servers"
-DESCRIPTION =3D "The library provides functions to connect NETCONF clien=
t and server to each other via SSH and to send, receive and process NETCO=
NF messages."
+SUMMARY =3D "NETCONF library in C for building NETCONF clients and serve=
rs"
+DESCRIPTION =3D "The library provides functions to connect NETCONF clien=
t and server \
+to each other via SSH and to send, receive and process NETCONF messages.=
"
 SECTION =3D "libs"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D08a5578c9bab06fb2ae84284630b9=
73f"
@@ -17,8 +18,6 @@ FILES:${PN} +=3D "${datadir}/yang/modules/libnetconf2/*=
"
=20
 inherit cmake pkgconfig
=20
-# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
-#EXTRA_OECMAKE =3D " -DCMAKE_INSTALL_PREFIX:PATH=3D/usr -DCMAKE_BUILD_TY=
PE:String=3DRelease -DLIBYANG_INCLUDE_DIR=3D/usr/include -DLIBYANG_LIBRAR=
Y=3D/usr/lib "
-EXTRA_OECMAKE =3D " -DCMAKE_INSTALL_PREFIX:PATH=3D/usr -DCMAKE_BUILD_TYP=
E:String=3DRelease "
+EXTRA_OECMAKE =3D "-DCMAKE_INSTALL_PREFIX:PATH=3D${prefix} -DCMAKE_BUILD=
_TYPE:String=3DRelease"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


