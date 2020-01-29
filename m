Return-Path: <g-tammana@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 9FF19529D4
	for <meta-arago@arago-project.org>;
	Wed, 29 Jan 2020 17:53:57 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00THq6ZC049329
	for <meta-arago@arago-project.org>; Wed, 29 Jan 2020 11:52:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580320326;
	bh=i5xBgoe6U6f1238v4PmT8PMSDjDFEyt5F4lYtgU3kAg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=C00N4NfUpTqiR0ZQede9zjWjzUTqw0g56rZsU9+GZ22YpfeMk8qOoXKjWN6AmlwHq
	WRRV3Bm2AVJKw1h3V8iwCcDannGgqNQqHtIBhMW6r5vpZIcZgJbQghZPRbkzu6dLq1
	RsNrfw400UK50KcGQOjEr4TLcwpJMBBbCC4vxIYc=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00THq5pa104004
	for <meta-arago@arago-project.org>; Wed, 29 Jan 2020 11:52:05 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 29 Jan 2020 11:52:05 -0600
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
	DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
	15.01.1847.003; Wed, 29 Jan 2020 11:52:05 -0600
From: "Tammana, Gowtham" <g-tammana@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [EXTERNAL] Re: [meta-arago] [thud/zeus/master][PATCH]
	recipes-graphics: Add recipe for DevIL
Thread-Index: AQHV1sluPQnOHEZ4LkGIjpnKeh/6D6gCS70A//+eP6A=
Date: Wed, 29 Jan 2020 17:52:05 +0000
Message-ID: <ff183bdafef445b596f446d82778ee4d@ti.com>
References: <20200122173626.11984-1-g-tammana@ti.com>
	<20200128234539.GH3658@beryl> <023358a5926f4910bea382f2a280cfe7@ti.com>
	<b26a3c1112324c3e81a2b3bda7a67b66@ti.com> <20200129173432.GM3658@beryl>
In-Reply-To: <20200129173432.GM3658@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.247.25.184]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Pothukuchi,
	Vijay" <vijayp@ti.com>
Subject: Re: [EXTERNAL] Re: [thud/zeus/master][PATCH] recipes-graphics: Add recipe for DevIL
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
X-List-Received-Date: Wed, 29 Jan 2020 17:53:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



>-----Original Message-----
>From: Dmytriyenko, Denys
>Sent: Wednesday, January 29, 2020 11:35 AM
>To: Tammana, Gowtham
>Cc: meta-arago@arago-project.org; Pothukuchi, Vijay
>Subject: Re: [EXTERNAL] Re: [meta-arago] [thud/zeus/master][PATCH] recipes=
-
>graphics: Add recipe for DevIL
>
>On Wed, Jan 29, 2020 at 12:27:50PM -0500, Tammana, Gowtham wrote:
>>
>>
>> >>recipe for DevIL
>> >>
>> >>On Wed, Jan 22, 2020 at 11:36:26AM -0600, Gowtham Tammana wrote:
>> >>> Developers Image Library (DevIL) is a cross-platfor image utility
>> >>> library with simple syntax (openil.sourceforge.net). Adding recipe t=
o
>> >>> build from sources.
>> >>
>> >>Where is it coming from? I see there are many copies in other layers -=
 is
>it
>> >>based on something or completely done from scratch?
>> >
>> >Do you mean the recipe, if so yes its done from scratch.
>> >
>> >>
>> >>> index 00000000..6ba7f34b
>> >>> --- /dev/null
>> >>> +++ b/meta-arago-extras/recipes-graphics/devil/devil_1.8.0.bb
>> >>> @@ -0,0 +1,30 @@
>> >>> +DESCRIPTION =3D "Developer's Image Library (DevIL) is a cross-platf=
orm
>image
>> >>\
>> >>> +               library utilizing simple syntax to load, save, conve=
rt,
>\
>> >>> +               manipulate, filter and display a variety of images."
>> >>
>> >>Would also need a short SUMMARY set.
>> >
>> >Ok, let me add include that.
>> >
>> >>
>> >>> +HOMEPAGE =3D "https://github.com/DentonW/DevIL"
>> >>> +LICENSE =3D "LGPLv2"
>> >>> +LIC_FILES_CHKSUM =3D
>"file://LICENSE;md5=3Dfc178bcd425090939a8b634d1d6a9594"
>> >>> +
>> >>> +SRC_URI =3D
>"git://github.com/dentonw/devil.git;protocol=3Dgit;branch=3Dmaster \
>> >>> +           file://Remove-ILUT-dependency.patch"
>> >>> +
>> >>> +SRCREV =3D "e34284a7e07763769f671a74b4fec718174ad862"
>> >>> +
>> >>> +COMPATIBLE_MACHINE =3D "j7-evm"
>> >>
>> >>Is it really compatible with j7 only? Looks to me as rather generic...
>> >
>> >Yes, it is generic but haven't had chance to test on other platform. So
>> >included for J7 for now.
>> >
>> >>
>> >>> +
>> >>> +PR =3D "r1"
>> >>> +S =3D "${WORKDIR}/git"
>> >>> +
>> >>> +# Build only DevIL
>> >>> +OECMAKE_SOURCEPATH =3D "${S}/DevIL"
>> >>> +
>> >>> +PACKAGECONFIG ??=3D "png"
>> >>> +PACKAGECONFIG[png] =3D "-DIL_NO_PNG=3D0,-DIL_NO_PNG=3D1,libpng,"
>> >>> +
>> >>> +DEPENDS +=3D "libpng"
>> >>
>> >>Dependency on libpng should be taken care by the PACKAGECONFIG above.
>> >
>> >I see, will remove it.
>> >
>> >>
>> >>> +inherit pkgconfig cmake
>> >>> +
>> >>> +INSANE_SKIP_${PN} +=3D "file-rdeps dev-so"
>> >>> +FILES_${PN} +=3D "${libdir}/lib*${SOLIBSDEV}"
>> >>> +FILES_SOLIBSDEV =3D ""
>> >>
>> >>Any way to package the libraries properly and not suppress QA checks?
>> >
>> >dev-so was needed, else it would complain on the symlinks. File-rdeps I
>
>If it produces proper library libfoo.so.X.Y.Z with symlinks libfoo.so.X an=
d
>libfoo.so, then just let the framework package everything automatically by
>removing FILES_*.
>
>
>> >couldn't quite resolve without suppressing them.
>>
>> ERROR: devil-1.8.0-r2 do_package_qa: QA Issue: /usr/lib/libIL.so.1 conta=
ined
>in package devil requires libc.so.6(GLIBC_2.17)(64bit), but no providers f=
ound
>in RDEPENDS_devil? [file-rdeps]
>> ERROR: devil-1.8.0-r2 do_package_qa: QA Issue: /usr/lib/libIL.so.1 conta=
ined
>in package devil requires libstdc++.so.6()(64bit), but no providers found =
in
>RDEPENDS_devil? [file-rdeps]
>>
>> What does RDEPENDS_devil take the library target name or the recipe name=
.
>
>DEPENDS is build-time dependency and takes recipe names.
>RDEPENDS is run-time dependency and takes package names.
>
>But libc and libstdc++ dependencies are normally taken care by the framewo=
rk.

That's my understanding. If I do say RDEPENDS_${PN} =3D "libstdc++6" I see
"Nothing RPROVIDES 'libstdc++6'", which seems right as there is no explicit=
 provider for it.

>The only exception when you would see such errors is when the library was
>built outside of the framework, i.e. consumed as a binary in the recipe, n=
ot
>built from sources.

Interesting, there are no prebuilt binaries in here, everything should get =
built from source. Let me do a clean build.

Gowtham

