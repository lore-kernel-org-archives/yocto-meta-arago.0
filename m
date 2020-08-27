Return-Path: <g-tammana@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 9A3BD520DE
	for <meta-arago@arago-project.org>;
	Thu, 27 Aug 2020 12:56:54 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07RCs3nx044212
	for <meta-arago@arago-project.org>; Thu, 27 Aug 2020 07:54:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1598532843;
	bh=HbRtRmM7twEk/Oby/cJ+HpoH2j/WI9wNzSleKra2avA=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=MS1dK4+R2wK4ZV5VJ92B/0q0CJLunr0fHPQN+DAgA4zH5nx1dvUyar2qBx96DHSam
	TOc6YQRWh0EE7CQHyRZ2XvNJ9pMz/tumacPbI+ntBWhk+ZbwDkHAoFxifdeOfMeZ/I
	bYhd2IUr/MJ89SIzzHt9a2xMbLrtBPKwg8JhoTfo=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07RCs2A6056400
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 27 Aug 2020 07:54:03 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 27 Aug 2020 07:54:03 -0500
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
	DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
	15.01.1979.003; Thu, 27 Aug 2020 07:54:03 -0500
From: "Tammana, Gowtham" <g-tammana@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>,
	"Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-araga][dunfell/master][PATCH]
	nativesdk-packagegroup-arago-tisdk-host: remove nativesdk-meson
Thread-Index: AQHWfG/ZeUtLK8YbFkGm+ey7q61+nalL5xBw
Date: Thu, 27 Aug 2020 12:54:03 +0000
Message-ID: <0a5c5d27a72a4bb0bab8f38829b6d7f2@ti.com>
References: <20200827124446.12684-1-g-tammana@ti.com>
In-Reply-To: <20200827124446.12684-1-g-tammana@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.49.252]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [meta-araga][dunfell/master][PATCH] nativesdk-packagegroup-arago-tisdk-host: remove nativesdk-meson
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
X-List-Received-Date: Thu, 27 Aug 2020 12:56:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Mis-spelled the meta-arago in the header, will send v2.

Thanks,
Gowtham

>-----Original Message-----
>From: Tammana, Gowtham
>Sent: Thursday, August 27, 2020 7:45 AM
>To: meta-arago@arago-project.org; Dmytriyenko, Denys
>Cc: Tammana, Gowtham
>Subject: [meta-araga][dunfell/master][PATCH] nativesdk-packagegroup-arago-
>tisdk-host: remove nativesdk-meson
>
>nativesdk-meson creates a wrapper with a predefined cross file. However
>it is picking up some of the dependencies from the host machine causing
>conflicts if there is version mismatch between host and nativesdk
>version. Remove nativesdk-meson from tisdk-host until it is resolved.
>
>Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
>---
> .../nativesdk-packagegroup-arago-tisdk-host.bb              | 6 +++++-
> 1 file changed, 5 insertions(+), 1 deletion(-)
>
>diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-
>packagegroup-arago-tisdk-host.bb b/meta-arago-extras/recipes-
>core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
>index 1ced42c1..4185f9c1 100644
>--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-
>arago-tisdk-host.bb
>+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-
>arago-tisdk-host.bb
>@@ -1,5 +1,5 @@
> SUMMARY =3D "Host packages for a standalone Arago SDK with TI tools"
>-PR =3D "r1"
>+PR =3D "r2"
> LICENSE =3D "MIT"
>
> inherit packagegroup nativesdk
>@@ -32,3 +32,7 @@ RDEPENDS_${PN} =3D "\
>     nativesdk-mtd-utils-ubifs \
>     ${EXTRA_TI_TOOLS} \
> "
>+
>+RDEPENDS_${PN}_remove =3D "\
>+    nativesdk-meson \
>+"
>--
>2.17.1


