Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 2B21152AB1
	for <meta-arago@arago-project.org>;
	Fri, 19 Jul 2013 11:58:20 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6JBwJP6009643
	for <meta-arago@arago-project.org>; Fri, 19 Jul 2013 06:58:19 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6JBwJSt030007
	for <meta-arago@arago-project.org>; Fri, 19 Jul 2013 06:58:19 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Fri, 19 Jul 2013 06:58:19 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH-oe-layersetup 1/2] sample-files: Added
	conf.sample file for GLSDK.
Thread-Index: AQHOe8e+oM8kHwI0tUWgk+X2MHiQpZlrk++AgABihYA=
Date: Fri, 19 Jul 2013 11:58:18 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159663682@DLEE11.ent.ti.com>
References: <CF956B779D819D41BBC043B7082161D544074C@DBDE04.ent.ti.com>
In-Reply-To: <CF956B779D819D41BBC043B7082161D544074C@DBDE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH-oe-layersetup 1/2] sample-files: Added conf.sample file for GLSDK.
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
X-List-Received-Date: Fri, 19 Jul 2013 11:58:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Hingolikar, Mrinmayee
>Sent: Friday, July 19, 2013 1:04 AM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH-oe-layersetup 1/2] sample-files:
>Added conf.sample file for GLSDK.
>
>
> * The local-glsdk.conf.sample files conrains the GLSDK branding.
>   It will be used to generate local.conf by oe-layertool-setup.sh
>
>Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
>---
> ...-linaro.conf.sample =3D> local-glsdk.conf.sample} |    4 +++-
> 1 files changed, 3 insertions(+), 1 deletions(-)  copy sample-
>files/{local-arago-linaro.conf.sample =3D> local-glsdk.conf.sample}
>(99%)
>
>diff --git a/sample-files/local-arago-linaro.conf.sample b/sample-
>files/local-glsdk.conf.sample
>similarity index 99%
>copy from sample-files/local-arago-linaro.conf.sample
>copy to sample-files/local-glsdk.conf.sample
>index 24d14dc..a9abea2 100644
>--- a/sample-files/local-arago-linaro.conf.sample
>+++ b/sample-files/local-glsdk.conf.sample
>@@ -146,7 +146,6 @@ PARALLEL_MAKE =3D "-j 1"
> # be appropriate for example
>
> DISTRO   =3D "arago"
>-TOOLCHAIN_BRAND =3D "linaro"

Why are you removing this?

>
> # Set terminal types by default it expects gnome-terminal  # but
>we chose xterm @@ -158,3 +157,6 @@ BB_GENERATE_MIRROR_TARBALLS =3D
>"0"
>
> # Uncomment this to remove work directory after packaging to save
>disk space  #INHERIT +=3D "rm_work"
>+
>+# Use GLSDK branding
>+ARAGO_BRAND =3D "glsdk"

I'm curious why the AMSDK doesn't use this and can use the base config file=
.  I would suggest checking with them so you two can be aligned and consist=
ent between SDKs.

>--
>1.7.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

