Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 0669A5298F
	for <meta-arago@arago-project.org>;
	Fri, 31 Jan 2014 19:50:41 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0VJofbb014368
	for <meta-arago@arago-project.org>; Fri, 31 Jan 2014 13:50:41 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0VJofJq019278
	for <meta-arago@arago-project.org>; Fri, 31 Jan 2014 13:50:41 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Fri, 31 Jan 2014 13:50:41 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>, "Hingolikar, Mrinmayee" <mrinmayee@ti.com>
Thread-Topic: [PATCH 1/2] branding-glsdk: pin to GLSDK libdrm version
Thread-Index: AQHPHr1pNZDqcRZHD0KjvZI5nuKsW5qfPdWA
Date: Fri, 31 Jan 2014 19:50:39 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015993D972@DLEE11.ent.ti.com>
References: <1391197703-29424-1-git-send-email-chase.maupin@ti.com>
In-Reply-To: <1391197703-29424-1-git-send-email-chase.maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] branding-glsdk: pin to GLSDK libdrm version
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
X-List-Received-Date: Fri, 31 Jan 2014 19:50:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Mrinmayee,

Can you comment on the below need for 2.4.41?

>-----Original Message-----
>From: Maupin, Chase
>Sent: Friday, January 31, 2014 1:48 PM
>To: meta-arago@arago-project.org
>Cc: Maupin, Chase
>Subject: [PATCH 1/2] branding-glsdk: pin to GLSDK libdrm version
>
>* The GLSDK prefers to use the 2.4.41 version of libdrm from
>  meta-ti so pin that version in the branding file.
>
>Signed-off-by: Chase Maupin <chase.maupin@ti.com>
>---
> .../conf/distro/include/branding-glsdk.inc         |    4 ++++
> 1 file changed, 4 insertions(+)
>
>diff --git a/meta-arago-distro/conf/distro/include/branding-
>glsdk.inc b/meta-arago-distro/conf/distro/include/branding-
>glsdk.inc
>index d1c30f3..b33b21d 100644
>--- a/meta-arago-distro/conf/distro/include/branding-glsdk.inc
>+++ b/meta-arago-distro/conf/distro/include/branding-glsdk.inc
>@@ -2,3 +2,7 @@
>
> # Use the SDK supported kernel and kernel version
> PREFERRED_PROVIDER_virtual/kernel =3D "linux-ti-glsdk"
>+
>+# Set the PREFERRED_VERSION of libdrm to the glsdk version for
>the
>+# glsdk branded builds
>+PREFERRED_VERSION_libdrm =3D "2.4.41"
>--
>1.7.9.5


