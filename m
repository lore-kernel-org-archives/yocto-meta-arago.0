Return-Path: <vchengalvala@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id B285A5298C
	for <meta-arago@arago-project.org>;
	Tue, 15 May 2018 18:45:11 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w4FIj78q028871
	for <meta-arago@arago-project.org>; Tue, 15 May 2018 13:45:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1526409907;
	bh=VnixSqXFGAso6NDUQ8cKETmWEsoWqF0jJNFh4yR4v5w=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=C6p9JFQt8lX8GNZz2pjvaMDPFfU2V7ox3mR8PH48/6NLvP8TghXkrIPR45ZMNVp8N
	3T8hPvrNofVEvjif3L25z4bt6zc6aniVT66ZunwL0PwWO1F1k4F6XcpBP9mOOua1LY
	UPQIftiyC6Q3CMd4IQ5Cj+FbNEmOaRslIasJVyxo=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4FIj7Bt000520
	for <meta-arago@arago-project.org>; Tue, 15 May 2018 13:45:07 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 15 May 2018 13:45:07 -0500
Received: from DLEE112.ent.ti.com ([fe80::65b1:e788:3000:d26d]) by
	DLEE112.ent.ti.com ([fe80::65b1:e788:3000:d26d%17]) with mapi id
	15.01.1466.003; Tue, 15 May 2018 13:45:07 -0500
From: "Chengalvala, Vivek" <vchengalvala@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [rocko/master][PATCH 2/2]
	packagegroup-*-base-tisdk: switch back from iperf3 to iperf2
Thread-Index: AQHT4x0BhfwApG8Rs0CkQVrGfNfVnaQxMnVg
Date: Tue, 15 May 2018 18:44:45 +0000
Deferred-Delivery: Tue, 15 May 2018 18:44:00 +0000
Message-ID: <dce529ac60f147ae9fdd6f1f1d159e7e@ti.com>
References: <1525379171-19544-1-git-send-email-denys@ti.com>
	<1525379171-19544-2-git-send-email-denys@ti.com>
In-Reply-To: <1525379171-19544-2-git-send-email-denys@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.218.109.175]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "Karicheri, Muralidharan" <m-karicheri2@ti.com>
Subject: Re: [EXTERNAL] [rocko/master][PATCH 2/2] packagegroup-*-base-tisdk: switch back from iperf3 to iperf2
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Tue, 15 May 2018 18:45:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

Can we have both iperf2 and iperf3? With iperf3, we see that packet loss/re=
-ordering stats are better accounted.

Regards,
Vivek

-----Original Message-----
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Dmytriyenko, Denys
Sent: Thursday, May 03, 2018 4:26 PM
To: meta-arago@arago-project.org
Subject: [EXTERNAL] [meta-arago] [rocko/master][PATCH 2/2] packagegroup-*-b=
ase-tisdk: switch back from iperf3 to iperf2

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb       | 4 =
++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-base-tisdk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup=
-arago-base-tisdk.bb
index 8238b1b..7a59fea 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-=
tisdk.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-=
tisdk.bb
@@ -1,6 +1,6 @@
 DESCRIPTION =3D "Additional packages beyond console packages shared by TI =
SDKs"
 LICENSE =3D "MIT"
-PR =3D "r19"
+PR =3D "r20"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
@@ -19,7 +19,7 @@ RDEPENDS_${PN} =3D "\
     libxml2 \
     libpcre \
     iptables \
-    iperf3 \
+    iperf \
     arago-gpl-notice \
     arago-feed-config \
     nfs-utils-client \
--=20
2.7.4

_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

