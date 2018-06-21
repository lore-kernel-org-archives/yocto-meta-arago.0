Return-Path: <x0038811@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 04605529CA
	for <meta-arago@arago-project.org>;
	Thu, 21 Jun 2018 06:50:16 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w5L6oBkB023028
	for <meta-arago@arago-project.org>; Thu, 21 Jun 2018 01:50:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1529563811;
	bh=u8mYZf+Q61jp7zsPq4DOO4fF4cZVVkenNXEMFXc2VdU=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=J1banfJ+zIUb+fVxBSFCRuPeDarBpL+mQ4W3r/nq62VpQ6aqxhyP9+9T0CUBZ8QWL
	zsTMMdRKhSU86sOVcnJppax9bYXqkYBf2Qa9MIZQsC5KsVOAMNcsdTEB7THV3n3HSk
	cnYdrWngUuCTyb1rOmRkEcEFVMkgcctuQsdbHezU=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5L6oBji006222
	for <meta-arago@arago-project.org>; Thu, 21 Jun 2018 01:50:11 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 21 Jun 2018 01:50:10 -0500
Received: from DFLE106.ent.ti.com ([fe80::4dc:7374:f90c:1f12]) by
	DFLE106.ent.ti.com ([fe80::4dc:7374:f90c:1f12%17]) with mapi id
	15.01.1466.003; Thu, 21 Jun 2018 01:50:10 -0500
From: "Prasad, Ram" <x0038811@ti.com>
To: "R, Karthik" <karthik.ramanan@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [krogoth] gst1.0-plugins-bad:
	gstwaylandsink: Update SRCREV
Thread-Index: AQHUCSlHXW8TEyJlzUqFgoaLh8ED2KRqRcSQ
Date: Thu, 21 Jun 2018 06:50:10 +0000
Message-ID: <7594a1c8f759453788d088f76b43552e@ti.com>
References: <1529562587-46299-1-git-send-email-a0393906@ti.com>
In-Reply-To: <1529562587-46299-1-git-send-email-a0393906@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.145.0]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [krogoth] gst1.0-plugins-bad: gstwaylandsink: Update SRCREV
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
X-List-Received-Date: Thu, 21 Jun 2018 06:50:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acknowledged.


-----Original Message-----
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of R, Karthik
Sent: Thursday, June 21, 2018 12:00 PM
To: meta-arago@arago-project.org
Subject: [EXTERNAL] [meta-arago] [krogoth] gst1.0-plugins-bad: gstwaylandsi=
nk: Update SRCREV

This patch resets the redraw_pending in PAUSE to READY transition

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend                 | 4 =
++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-pl=
ugins-bad_1.6.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/g=
streamer1.0-plugins-bad_1.6.3.bbappend
index f732a02..9d297c5 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-b=
ad_1.6.3.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-b=
ad_1.6.3.bbappend
@@ -38,8 +38,8 @@ SRC_URI =3D "git://git.ti.com/glsdk/gstreamer1-0-plugins-=
bad.git;protocol=3Dgit;bran
=20
 S =3D "${WORKDIR}/git"
=20
-SRCREV_omap-a15 =3D "3a5a7f778b3c3259faab04748e7b10f0fd696aab"
+SRCREV_omap-a15 =3D "9a1cd733fa57e1eace21524456b652087d04168e"
 SRCREV_ti43x =3D "3a5a7f778b3c3259faab04748e7b10f0fd696aab"
 SRCREV =3D "d0160ca810be30bf2b2e7681f5047933402efb52"
=20
-PR =3D "r27"
+PR =3D "r29"
--=20
1.9.1

_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

