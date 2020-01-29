Return-Path: <g-tammana@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 51F0A529D4
	for <meta-arago@arago-project.org>;
	Wed, 29 Jan 2020 17:19:54 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00THI2OS041295
	for <meta-arago@arago-project.org>; Wed, 29 Jan 2020 11:18:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580318282;
	bh=Oz+/1bxaWPuNCNANlumRaAhKpF18KGoDgKiOZkc1gBI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=afyDOw8hB/vuv13PdIZFCkgd3VSV2ir5m97mJEmrGWZKrmrycCGWqjYG9OElcoOP2
	YsAhSTmz6nQL8vBTE7aiJM8PYOuUqGOw+e9GsNYuoINmc68TRr39Pvvl98rDbJfQLh
	xKjcKNHfgHBXG0QpLnujugzUT03Kw5UsQkKIHKPI=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00THI2Pu057746
	for <meta-arago@arago-project.org>; Wed, 29 Jan 2020 11:18:02 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 29 Jan 2020 11:18:02 -0600
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
	DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
	15.01.1847.003; Wed, 29 Jan 2020 11:18:02 -0600
From: "Tammana, Gowtham" <g-tammana@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago][thud/zeus/master][PATCH] recipes-graphics: Add
	recipe for DevIL
Thread-Index: AQHV0UqDEgNyWlLMmEyWt7iAJApwO6gBLBaAgACYZlA=
Date: Wed, 29 Jan 2020 17:18:02 +0000
Message-ID: <023358a5926f4910bea382f2a280cfe7@ti.com>
References: <20200122173626.11984-1-g-tammana@ti.com>
	<20200128234539.GH3658@beryl>
In-Reply-To: <20200128234539.GH3658@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.247.25.184]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Pothukuchi,
	Vijay" <vijayp@ti.com>
Subject: Re: [thud/zeus/master][PATCH] recipes-graphics: Add recipe for DevIL
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
X-List-Received-Date: Wed, 29 Jan 2020 17:19:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



>-----Original Message-----
>From: Dmytriyenko, Denys
>Sent: Tuesday, January 28, 2020 5:46 PM
>To: Tammana, Gowtham
>Cc: meta-arago@arago-project.org; Pothukuchi, Vijay
>Subject: Re: [meta-arago][thud/zeus/master][PATCH] recipes-graphics: Add
>recipe for DevIL
>
>On Wed, Jan 22, 2020 at 11:36:26AM -0600, Gowtham Tammana wrote:
>> Developers Image Library (DevIL) is a cross-platfor image utility
>> library with simple syntax (openil.sourceforge.net). Adding recipe to
>> build from sources.
>
>Where is it coming from? I see there are many copies in other layers - is =
it
>based on something or completely done from scratch?

Do you mean the recipe, if so yes its done from scratch.

>
>> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
>> ---
>>  .../recipes-graphics/devil/devil_1.8.0.bb     | 30 +++++++++++++++++++
>>  .../devil/files/Remove-ILUT-dependency.patch  | 13 ++++++++
>>  2 files changed, 43 insertions(+)
>>  create mode 100644 meta-arago-extras/recipes-graphics/devil/devil_1.8.0=
.bb
>>  create mode 100644 meta-arago-extras/recipes-graphics/devil/files/Remov=
e-
>ILUT-dependency.patch
>>
>> diff --git a/meta-arago-extras/recipes-graphics/devil/devil_1.8.0.bb b/m=
eta-
>arago-extras/recipes-graphics/devil/devil_1.8.0.bb
>> new file mode 100644
>> index 00000000..6ba7f34b
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-graphics/devil/devil_1.8.0.bb
>> @@ -0,0 +1,30 @@
>> +DESCRIPTION =3D "Developer's Image Library (DevIL) is a cross-platform =
image
>\
>> +               library utilizing simple syntax to load, save, convert, =
\
>> +               manipulate, filter and display a variety of images."
>
>Would also need a short SUMMARY set.

Ok, let me add include that.

>
>> +HOMEPAGE =3D "https://github.com/DentonW/DevIL"
>> +LICENSE =3D "LGPLv2"
>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfc178bcd425090939a8b634d1d6a=
9594"
>> +
>> +SRC_URI =3D "git://github.com/dentonw/devil.git;protocol=3Dgit;branch=
=3Dmaster \
>> +           file://Remove-ILUT-dependency.patch"
>> +
>> +SRCREV =3D "e34284a7e07763769f671a74b4fec718174ad862"
>> +
>> +COMPATIBLE_MACHINE =3D "j7-evm"
>
>Is it really compatible with j7 only? Looks to me as rather generic...

Yes, it is generic but haven't had chance to test on other platform. So inc=
luded for J7 for now.

>
>> +
>> +PR =3D "r1"
>> +S =3D "${WORKDIR}/git"
>> +
>> +# Build only DevIL
>> +OECMAKE_SOURCEPATH =3D "${S}/DevIL"
>> +
>> +PACKAGECONFIG ??=3D "png"
>> +PACKAGECONFIG[png] =3D "-DIL_NO_PNG=3D0,-DIL_NO_PNG=3D1,libpng,"
>> +
>> +DEPENDS +=3D "libpng"
>
>Dependency on libpng should be taken care by the PACKAGECONFIG above.

I see, will remove it.

>
>> +inherit pkgconfig cmake
>> +
>> +INSANE_SKIP_${PN} +=3D "file-rdeps dev-so"
>> +FILES_${PN} +=3D "${libdir}/lib*${SOLIBSDEV}"
>> +FILES_SOLIBSDEV =3D ""
>
>Any way to package the libraries properly and not suppress QA checks?

dev-so was needed, else it would complain on the symlinks. File-rdeps I cou=
ldn't quite resolve without suppressing them.

Thanks,
Gowtham


