Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 7551852A81
	for <meta-arago@arago-project.org>;
	Thu, 27 Mar 2014 14:55:07 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s2REt6gr010107;
	Thu, 27 Mar 2014 09:55:06 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2REt5Na020799;
	Thu, 27 Mar 2014 09:55:06 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Thu, 27 Mar 2014 09:55:05 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] qt4-embedded-gles: skip package when sgx
	is not set in MACHINE_FEATURES
Thread-Index: AQHPSS2XUIjGOHObK0ivIlsQeHVZY5r1BoLQ
Date: Thu, 27 Mar 2014 14:55:05 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015CF5BE1B@DLEE11.ent.ti.com>
References: <1395863802-31820-1-git-send-email-denis@denix.org>
In-Reply-To: <1395863802-31820-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] qt4-embedded-gles: skip package when sgx is not set in MACHINE_FEATURES
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
X-List-Received-Date: Thu, 27 Mar 2014 14:55:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Wednesday, March 26, 2014 2:57 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH] qt4-embedded-gles: skip package when
>sgx is not set in MACHINE_FEATURES
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>qt4-embedded-gles depends on virtual/egl and libgles-omap3, but
>the latter has
>strict COMPATIBLE_MACHINE setting. Latest versions of BitBake
>report these
>missing dependencies as error during parsing, but treat as non-
>critical error
>and proceeds with the build. Unfortunately, the return code is
>non-zero, even
>though there were 0 build errors. One way to resolve this is to
>set similar
>COMPATIBLE_MACHINE list for qt4-embedded-gles recipe, or check for
>"sgx" flag
>in MACHINE_FEATURES.
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> .../recipes-qt/qt4/qt4-embedded-gles_4.8.5.bbappend         | 13
>++++++++++++-
> 1 file changed, 12 insertions(+), 1 deletion(-)
>
>diff --git a/meta-arago-distro/recipes-qt/qt4/qt4-embedded-
>gles_4.8.5.bbappend b/meta-arago-distro/recipes-qt/qt4/qt4-
>embedded-gles_4.8.5.bbappend
>index f9e5810..e7a1dad 100644
>--- a/meta-arago-distro/recipes-qt/qt4/qt4-embedded-
>gles_4.8.5.bbappend
>+++ b/meta-arago-distro/recipes-qt/qt4/qt4-embedded-
>gles_4.8.5.bbappend
>@@ -1,3 +1,14 @@
> require arago-qt4.inc
>
>-PR :=3D "${PR}.0"
>+PR :=3D "${PR}.1"
>+
>+# Some deps are missing when sgx is not set, skip this package
>+python __anonymous() {
>+    features =3D bb.data.getVar("MACHINE_FEATURES", d, 1)
>+    if not features:
>+        return
>+    pkgn =3D bb.data.getVar("PN", d, 1)
>+    pkgv =3D bb.data.getVar("PV", d, 1)

I like the solution, but what are pkgn and pkgv for?  Were you planning on =
using these in the message below?

>+    if "sgx" not in features:
>+        raise bb.parse.SkipPackage('qt4-embedded-gles needs
>dependencies derived from "sgx" in MACHINE_FEATURES')
>+}
>--
>1.8.3.2
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

