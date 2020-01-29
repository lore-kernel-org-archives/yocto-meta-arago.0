Return-Path: <g-tammana@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 5DC80529D4
	for <meta-arago@arago-project.org>;
	Wed, 29 Jan 2020 23:36:26 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00TNYY1G080721
	for <meta-arago@arago-project.org>; Wed, 29 Jan 2020 17:34:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580340874;
	bh=7zZi9mdb59YEvEy1q3OaGWVhgHxkQoMu1UwnPk8rtxY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=PmUY+vfiyOeZ0zu2EPH/kAM7j9xjyS8zcsdEdXTfqGCR2GFPBeYvHv4M2c4PJRj3K
	LxKkJ45B0vbMOFUMW+exBFJQ2qoc4eZXfVQ3E9sboRHELC5p4v1CXRvhob5LVpHms2
	wFC2Hq2JRPh7GIv90ubdDXWZH1l/IX/BME3Vx3Hc=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00TNYYev031839
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 29 Jan 2020 17:34:34 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 29 Jan 2020 17:34:34 -0600
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
	DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
	15.01.1847.003; Wed, 29 Jan 2020 17:34:34 -0600
From: "Tammana, Gowtham" <g-tammana@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago][thud/zeus/master][PATCH v2] recipes-graphics: Add
	recipe for DevIL
Thread-Index: AQHV1uom1s12nyeQN0uBtWzRHiPulagClaMA//+1RSA=
Date: Wed, 29 Jan 2020 23:34:34 +0000
Message-ID: <474507d858444913bf9f6424cbdcb6a8@ti.com>
References: <20200129212206.27512-1-g-tammana@ti.com>
	<20200129215956.GP3658@beryl>
In-Reply-To: <20200129215956.GP3658@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.247.25.184]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Pothukuchi,
	Vijay" <vijayp@ti.com>
Subject: Re: [thud/zeus/master][PATCH v2] recipes-graphics: Add recipe for DevIL
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
X-List-Received-Date: Wed, 29 Jan 2020 23:36:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



>-----Original Message-----
>From: Dmytriyenko, Denys
>Sent: Wednesday, January 29, 2020 4:00 PM
>To: Tammana, Gowtham
>Cc: meta-arago@arago-project.org; Pothukuchi, Vijay
>Subject: Re: [meta-arago][thud/zeus/master][PATCH v2] recipes-graphics: Ad=
d
>recipe for DevIL
>
>On Wed, Jan 29, 2020 at 03:22:06PM -0600, Gowtham Tammana wrote:
>> Developers Image Library (DevIL) is a cross-platform image utility
>> library with simple syntax (openil.sourceforge.net). Adding recipe to
>> build from sources.
>
>Thanks! Looks good now - I'll merge it. Next time please don't forget to
>provide brief summary of changes between patch revisions after --- line.

Oops. It's an oversight from me. Will take care of it next time.

Thanks,
Gowtham

>
>> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
>> ---
>>  .../recipes-graphics/devil/devil_1.8.0.bb     | 25 +++++++++++++++++++
>>  .../devil/files/Remove-ILUT-dependency.patch  | 13 ++++++++++
>>  2 files changed, 38 insertions(+)
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
>> index 00000000..3502ed0c
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-graphics/devil/devil_1.8.0.bb
>> @@ -0,0 +1,25 @@
>> +SUMMARY =3D "DevIL cross platform image utility library"
>> +DESCRIPTION =3D "Developer's Image Library (DevIL) is a cross-platform =
image
>\
>> +               library utilizing simple syntax to load, save, convert, =
\
>> +               manipulate, filter and display a variety of images."
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
>> +PR =3D "r1"
>> +S =3D "${WORKDIR}/git"
>> +
>> +COMPATIBLE_MACHINE =3D "j7-evm"
>> +
>> +# Build only DevIL
>> +OECMAKE_SOURCEPATH =3D "${S}/DevIL"
>> +
>> +PACKAGECONFIG ??=3D "png"
>> +PACKAGECONFIG[png] =3D "-DIL_NO_PNG=3D0,-DIL_NO_PNG=3D1,libpng,"
>> +
>> +inherit pkgconfig cmake
>> diff --git a/meta-arago-extras/recipes-graphics/devil/files/Remove-ILUT-
>dependency.patch b/meta-arago-extras/recipes-graphics/devil/files/Remove-I=
LUT-
>dependency.patch
>> new file mode 100644
>> index 00000000..4f0f9dfa
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-graphics/devil/files/Remove-ILUT-
>dependency.patch
>> @@ -0,0 +1,13 @@
>> +diff --git a/DevIL/CMakeLists.txt b/DevIL/CMakeLists.txt
>> +index e342f93d..fae40167 100644
>> +--- a/DevIL/CMakeLists.txt
>> ++++ b/DevIL/CMakeLists.txt
>> +@@ -6,7 +6,7 @@ set (CMAKE_MODULE_PATH
>"${CMAKE_CURRENT_SOURCE_DIR}/cmake/Modules")
>> +
>> + add_subdirectory(src-IL)
>> + add_subdirectory(src-ILU)
>> +-add_subdirectory(src-ILUT)
>> ++# add_subdirectory(src-ILUT)
>> + option(IL_TESTS "build DevIL tests" ON)
>> + if (IL_TESTS)
>> +     ENABLE_TESTING()
>> --
>> 2.25.0
>>

