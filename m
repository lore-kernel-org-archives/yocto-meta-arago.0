Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 8753152A6D
	for <meta-arago@arago-project.org>;
	Tue, 14 Oct 2014 17:54:07 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s9EHs6sQ028123;
	Tue, 14 Oct 2014 12:54:06 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s9EHs6dP010827;
	Tue, 14 Oct 2014 12:54:06 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Tue, 14 Oct 2014 12:54:06 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: Matt Schuckmann <Matt.Schuckmann@planar.com>
Thread-Topic: [meta-arago] Arago dependency on qt
Thread-Index: AQHP59fZjp8FTMJ/2EGuQ46eLesw4Q==
Date: Tue, 14 Oct 2014 17:54:06 +0000
Message-ID: <B0581B5571079145BA1CD78C126DBDE73212E646@DLEE08.ent.ti.com>
References: <4B07ADD556F70043925DA2E9C5D4346D2FD87996D4@MSXBEBVT12.planar.net>
In-Reply-To: <4B07ADD556F70043925DA2E9C5D4346D2FD87996D4@MSXBEBVT12.planar.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: Arago dependency on qt
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
X-List-Received-Date: Tue, 14 Oct 2014 17:54:07 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_B0581B5571079145BA1CD78C126DBDE73212E646DLEE08entticom_"

--_000_B0581B5571079145BA1CD78C126DBDE73212E646DLEE08entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Can you specify what branch you are using? 5.1.1 is rather old and since da=
isy, we have a bbappend and not a bb/inc files.

--
Denys

On Oct 14, 2014 7:48 PM, Matt Schuckmann <Matt.Schuckmann@planar.com> wrote=
:
I'm creating a new layer with a distro and image based on Arago.

The target image will have no graphics support so I don't want to included =
the qt layer in my bblayers.conf file however if I remove it I get the foll=
owing error:

ERROR: ParseError at /home/dev/builds/zanzibar/tisdk2/sources/meta-arago/me=
ta-arago-distro/recipes-qt/qt5/nativesdk-qtbase_5.1.1.bb:1: Could not inclu=
de required file recipes-qt/qt5/qt5-5.1.1.inc
ERROR: Command execution failed: Exited with 1

So it looks like something in Arago is forcing the inclusion of qt support =
even though I'm not referencing qt anywhere in my layer.

Can anyone help me understand what is going on?

Thanks,
Matt S.
_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

--_000_B0581B5571079145BA1CD78C126DBDE73212E646DLEE08entticom_
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
<div>
<p dir=3D"ltr">Can you specify what branch you are using? 5.1.1 is rather o=
ld and since daisy, we have a bbappend and not a bb/inc files.</p>
<p dir=3D"ltr">-- <br>
Denys</p>
<div class=3D"x_quote">On Oct 14, 2014 7:48 PM, Matt Schuckmann &lt;Matt.Sc=
huckmann@planar.com&gt; wrote:<br type=3D"attribution">
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">I'm creating a new layer with a distro and image b=
ased on Arago.
<br>
<br>
The target image will have no graphics support so I don't want to included =
the qt layer in my bblayers.conf file however if I remove it I get the foll=
owing error:<br>
<br>
ERROR: ParseError at /home/dev/builds/zanzibar/tisdk2/sources/meta-arago/me=
ta-arago-distro/recipes-qt/qt5/nativesdk-qtbase_5.1.1.bb:1: Could not inclu=
de required file recipes-qt/qt5/qt5-5.1.1.inc<br>
ERROR: Command execution failed: Exited with 1<br>
<br>
So it looks like something in Arago is forcing the inclusion of qt support =
even though I'm not referencing qt anywhere in my layer.
<br>
<br>
Can anyone help me understand what is going on? <br>
<br>
Thanks,<br>
Matt S. <br>
_______________________________________________<br>
meta-arago mailing list<br>
meta-arago@arago-project.org<br>
<a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago">ht=
tp://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a><br>
</div>
</span></font>
</body>
</html>

--_000_B0581B5571079145BA1CD78C126DBDE73212E646DLEE08entticom_--
