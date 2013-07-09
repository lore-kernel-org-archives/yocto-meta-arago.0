Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id DC6D552090
	for <meta-arago@arago-project.org>;
	Tue,  9 Jul 2013 12:39:07 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r69Cd6fm021199;
	Tue, 9 Jul 2013 07:39:06 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r69Cd6Ml010968;
	Tue, 9 Jul 2013 07:39:06 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Tue, 9 Jul 2013 07:39:06 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>,
	"firat.kasmis@steinbeis-stg.de" <firat.kasmis@steinbeis-stg.de>
Thread-Topic: [meta-arago] Building am180x-evm
Thread-Index: AQHOfKFMak2IP3O6ukqmO9Buh9tsGg==
Date: Tue, 9 Jul 2013 12:39:05 +0000
Message-ID: <B0581B5571079145BA1CD78C126DBDE72E82F8DC@DLEE08.ent.ti.com>
References: <766D943268E37941B447D0C68B4D7048115BE280CA@ECCR11PUBLIC.exchange.local>
In-Reply-To: <766D943268E37941B447D0C68B4D7048115BE280CA@ECCR11PUBLIC.exchange.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Subject: Re: Building am180x-evm
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
X-List-Received-Date: Tue, 09 Jul 2013 12:39:08 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_B0581B5571079145BA1CD78C126DBDE72E82F8DCDLEE08entticom_"

--_000_B0581B5571079145BA1CD78C126DBDE72E82F8DCDLEE08entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

am180x cannot be built with Linaro toolchain - it has still to be built wit=
h Arago toolchain.


Denys


-----Original Message-----
From: Firat Kasmis [firat.kasmis@steinbeis-stg.de]
Received: Tuesday, 09 Jul 2013, 4:58
To: meta-arago@arago-project.org [meta-arago@arago-project.org]
Subject: [meta-arago] Building am180x-evm

Hi,

I just saw that http://arago-project.org/wiki/index.php/Setting_Up_Build_En=
vironment has been changed, so I tried building a file system and kernel fo=
r da850-omapl138-evm board like before following the new instructions.

Unfortunately this board is not available in meta-ti/conf/machine/ anymore.=
 Since am180x-evm is the same, I tried:

> MACHINE=3Dam180x-evm bitbake virtual/kernel
ERROR: No valid toolchain in PATH

Linaro is of course in my path. So after a bit of googling I tried:

> export TOOLCHAIN_BRAND=3Dlinaro
> MACHINE=3Dam180x-evm bitbake virtual/kernel
Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH (armv5).Too=
lchain tunings invalid:
Tuning 'cortexa8thf-neon' has no defined features, and cannot be used.

I could solve the first one by doing in tune-arm926ejs.inc:

+TUNE_FEATURES =3D "${TUNE_FEATURES_tune-armv5te} arm926ejs"
-TUNE_FEATURES_tune-arm926ejs =3D "${TUNE_FEATURES_tune-armv5te} arm926ejs"

+PACKAGE_EXTRA_ARCHS =3D "${PACKAGE_EXTRA_ARCHS_tune-armv5te}"
-PACKAGE_EXTRA_ARCHS_tune-arm926ejs =3D "${PACKAGE_EXTRA_ARCHS_tune-armv5te=
}"

But the second one with 'cortexa8thf-neon' still exists but I don't know wh=
ere it is exactly been set. toolchain-linaro/gcc.inc is using this as DEFAU=
LTUNE . Shouldn't this be arm926ejs for my machine?

Regards,
Firat


_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

--_000_B0581B5571079145BA1CD78C126DBDE72E82F8DCDLEE08entticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11p=
t; color:black">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11=
pt; color:black">am180x cannot be built with Linaro toolchain - it has stil=
l to be built with Arago toolchain.<br>
<br>
<br>
Denys<br>
<br>
<br>
<span style=3D"color:black">-----Original Message----- <br>
<b>From:</b> Firat Kasmis [firat.kasmis@steinbeis-stg.de]<br>
<b>Received:</b> Tuesday, 09 Jul 2013, 4:58<br>
<b>To:</b> meta-arago@arago-project.org [meta-arago@arago-project.org]<br>
<b>Subject:</b> [meta-arago] Building am180x-evm<br>
<br>
</span></span></div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">Hi,<br>
<br>
I just saw that <a href=3D"http://arago-project.org/wiki/index.php/Setting_=
Up_Build_Environment">
http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment</a> ha=
s been changed, so I tried building a file system and kernel for da850-omap=
l138-evm board like before following the new instructions.<br>
<br>
Unfortunately this board is not available in meta-ti/conf/machine/ anymore.=
 Since am180x-evm is the same, I tried:<br>
<br>
&gt; MACHINE=3Dam180x-evm bitbake virtual/kernel<br>
ERROR: No valid toolchain in PATH<br>
<br>
Linaro is of course in my path. So after a bit of googling I tried:<br>
<br>
&gt; export TOOLCHAIN_BRAND=3Dlinaro<br>
&gt; MACHINE=3Dam180x-evm bitbake virtual/kernel<br>
Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH (armv5).Too=
lchain tunings invalid:<br>
Tuning 'cortexa8thf-neon' has no defined features, and cannot be used.<br>
<br>
I could solve the first one by doing in tune-arm926ejs.inc:<br>
<br>
&#43;TUNE_FEATURES =3D &quot;${TUNE_FEATURES_tune-armv5te} arm926ejs&quot;<=
br>
-TUNE_FEATURES_tune-arm926ejs =3D &quot;${TUNE_FEATURES_tune-armv5te} arm92=
6ejs&quot;<br>
<br>
&#43;PACKAGE_EXTRA_ARCHS =3D &quot;${PACKAGE_EXTRA_ARCHS_tune-armv5te}&quot=
;<br>
-PACKAGE_EXTRA_ARCHS_tune-arm926ejs =3D &quot;${PACKAGE_EXTRA_ARCHS_tune-ar=
mv5te}&quot;<br>
<br>
But the second one with 'cortexa8thf-neon' still exists but I don't know wh=
ere it is exactly been set. toolchain-linaro/gcc.inc is using this as DEFAU=
LTUNE . Shouldn't this be arm926ejs for my machine?<br>
<br>
Regards,<br>
Firat<br>
<br>
<br>
_______________________________________________<br>
meta-arago mailing list<br>
meta-arago@arago-project.org<br>
<a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago">ht=
tp://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a><br>
</div>
</span></font>
</body>
</html>

--_000_B0581B5571079145BA1CD78C126DBDE72E82F8DCDLEE08entticom_--
