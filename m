Return-Path: <g-tammana@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 3721052972
	for <meta-arago@arago-project.org>;
	Mon,  1 Jul 2019 20:14:32 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x61KDlfE075274
	for <meta-arago@arago-project.org>; Mon, 1 Jul 2019 15:13:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562012027;
	bh=432yQiUBK1+xthuiixtw9gKwHoPzHC57PQi6kdUZA04=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=fR6WPtP2XLumhShmae7aaRkRSaxQ7zJ11L7FDeqM9/lGJ9oARIIg/e83QGsfNkQ4N
	TUmmCA9R7WUht1DqcI3P4NMQGGvgwd+s1J21ChZSK2BumWfh3/UnL2Ri7oowsN1Az4
	6yu/WIcsKBoOqdE4EYnTACrhb7WUMZL3Rly59JqQ=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x61KDlqv101435
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 1 Jul 2019 15:13:47 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 1 Jul 2019 15:13:46 -0500
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
	DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
	15.01.1713.004; Mon, 1 Jul 2019 15:13:46 -0500
From: "Tammana, Gowtham" <g-tammana@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [thud][PATCH 1/3] arago-prefs: Specify gbm provider
	for J7
Thread-Index: AQHVMEW08EPA/QFRQECTEmIfpH6dMqa2L/PA
Date: Mon, 1 Jul 2019 20:13:46 +0000
Message-ID: <858e3b31cd6140568e090ad92a57b43e@ti.com>
References: <20190629043954.7786-1-g-tammana@ti.com>
	<01736aa0fb904ba99ccebbd22ca8d2d5@ti.com>
	<20190701194641.GJ21181@beryl>
In-Reply-To: <20190701194641.GJ21181@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.247.30.184]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [thud][PATCH 1/3] arago-prefs: Specify gbm provider for J7
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
X-List-Received-Date: Mon, 01 Jul 2019 20:14:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



>Subject: Re: [meta-arago] [thud][PATCH 1/3] arago-prefs: Specify gbm provi=
der for J7
>
>And grepping through meta-arago also shows omapdrmtest needs update as wel=
l.

For omapmdrmtest, I thought this will disable the omapdrmtest from building=
 for J7.
http://arago-project.org/git/?p=3Dmeta-arago.git;a=3Dcommitdiff;h=3Dd568864=
026fba1cb09935416027cf3ef385f123b

It should be disabled for J7. How do we do that if the above is not the rig=
ht way?

Thanks,
Gowtham

>On Mon, Jul 01, 2019 at 07:44:36PM +0000, Dmytriyenko, Denys wrote:
>> ERROR: Nothing PROVIDES 'libgbm' (but /OE/arago-thud-next-build/sources/=
meta-arago/meta-arago-
>extras/recipes-graphics/kmscube/kmscube_1.0.0.bb DEPENDS on or otherwise r=
equires it)
>> libgbm was skipped: PREFERRED_PROVIDER_virtual/libgbm set to ti-img-rogu=
e-umlibs, not libgbm
>> NOTE: Runtime target 'kmscube' is unbuildable, removing...
>> Missing or unbuildable dependency chain was: ['kmscube', 'libgbm']
>>
>>
>> > -----Original Message-----
>> > From: Tammana, Gowtham
>> > Sent: Saturday, June 29, 2019 12:40 AM
>> > To: meta-arago@arago-project.org; Dmytriyenko, Denys
>> > Cc: Balagopalakrishnan, Anand; Ruei, Eric; Tammana, Gowtham
>> > Subject: [meta-arago][thud][PATCH 1/3] arago-prefs: Specify gbm provid=
er for
>> > J7
>> >
>> > Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
>> > ---
>> >  meta-arago-distro/conf/distro/include/arago-prefs.inc | 8 ++++++--
>> >  1 file changed, 6 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/m=
eta-
>> > arago-distro/conf/distro/include/arago-prefs.inc
>> > index 939569c0..0f961322 100644
>> > --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
>> > +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
>> > @@ -23,8 +23,12 @@ PREFERRED_PROVIDER_virtual/gpudriver_j7-evm =3D "ti=
-
>> > img-rogue-driver"
>> >  PREFERRED_PROVIDER_virtual/libgl =3D "mesa-gl"
>> >
>> >  # GBM (Generic Buffer Management) preferences
>> > -PREFERRED_PROVIDER_libgbm =3D "libgbm"
>> > -PREFERRED_PROVIDER_libgbm-dev =3D "libgbm-dev"
>> > +PREFERRED_PROVIDER_virtual/libgbm =3D "libgbm"
>> > +PREFERRED_PROVIDER_virtual/libgbm-dev =3D "libgbm-dev"
>> > +
>> > +# J7 gbm provider
>> > +PREFERRED_PROVIDER_virtual/libgbm_j7-evm =3D "ti-img-rogue-umlibs"
>> > +PREFERRED_PROVIDER_virtual/libgbm-dev_j7-evm =3D "ti-img-rogue-umlibs=
-
>> > dev"
>> >
>> >  # This is required when using keystone devices with graphical support
>> >  # such as Qt5
>> > --
>> > 2.22.0
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

