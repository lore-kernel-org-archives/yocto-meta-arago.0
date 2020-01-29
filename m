Return-Path: <g-tammana@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id A4C3C529D4
	for <meta-arago@arago-project.org>;
	Wed, 29 Jan 2020 21:26:03 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00TLO9FM092621
	for <meta-arago@arago-project.org>; Wed, 29 Jan 2020 15:24:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580333049;
	bh=OVNKo4NPRDJh2HjPB8UBEtLdhXZf66z3Di5tpgluH6Y=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=rEjDydxQvFyhBDvwWE7RAjjD5hlUf5g7fBRW6EcW9d5QY89FG7DrFzoa4dK8splYS
	fD4CseWX2dnzbuZZvGwp80CUU7HaxtaBuvEPBcRPYynCdd/FMQziW4K79OYWezBojx
	JHc2/iPLVYmAGoOluDibtrFoPyJ9+3GdaWxdBtR0=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00TLO9PD034876
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 29 Jan 2020 15:24:09 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 29 Jan 2020 15:24:09 -0600
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
	DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
	15.01.1847.003; Wed, 29 Jan 2020 15:24:09 -0600
From: "Tammana, Gowtham" <g-tammana@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [EXTERNAL] Re: [thud/zeus/master][PATCH]
	recipes-graphics: Add recipe for DevIL
Thread-Index: AQHV1upxCkqyqPL2aUuugIF6CAaWGA==
Date: Wed, 29 Jan 2020 21:24:09 +0000
Message-ID: <1e6e0d2d45304335ae39e2cecb18c145@ti.com>
References: <20200122173626.11984-1-g-tammana@ti.com>
	<20200128234539.GH3658@beryl> <023358a5926f4910bea382f2a280cfe7@ti.com>
	<b26a3c1112324c3e81a2b3bda7a67b66@ti.com> <20200129173432.GM3658@beryl>
	<ff183bdafef445b596f446d82778ee4d@ti.com>
In-Reply-To: <ff183bdafef445b596f446d82778ee4d@ti.com>
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
X-List-Received-Date: Wed, 29 Jan 2020 21:26:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


11:36:26AM -0600, Gowtham Tammana wrote:
>>> >>> Developers Image Library (DevIL) is a cross-platfor image utility
>>> >>> library with simple syntax (openil.sourceforge.net). Adding recipe =
to
>>> >>> build from sources.
>>> >>
>>> >>Where is it coming from? I see there are many copies in other layers =
- is
>>it
>>> >>based on something or completely done from scratch?
>>> >
>>> >Do you mean the recipe, if so yes its done from scratch.
>>> >
>>> >>
>>> >>> index 00000000..6ba7f34b
>>> >>> --- /dev/null
>>> >>> +++ b/meta-arago-extras/recipes-graphics/devil/devil_1.8.0.bb
>>> >>> @@ -0,0 +1,30 @@
>>> >>> +DESCRIPTION =3D "Developer's Image Library (DevIL) is a cross-plat=
form
>>image
>>> >>\
>>> >>> +               library utilizing simple syntax to load, save, conv=
ert,
>>\
>>> >>> +               manipulate, filter and display a variety of images.=
"
>>> >>
>>> >>Would also need a short SUMMARY set.
>>> >
>>> >Ok, let me add include that.
>>> >
>>> >>
>>> >>> +HOMEPAGE =3D "https://github.com/DentonW/DevIL"
>>> >>> +LICENSE =3D "LGPLv2"
>>> >>> +LIC_FILES_CHKSUM =3D
>>"file://LICENSE;md5=3Dfc178bcd425090939a8b634d1d6a9594"
>>> >>> +
>>> >>> +SRC_URI =3D
>>"git://github.com/dentonw/devil.git;protocol=3Dgit;branch=3Dmaster \
>>> >>> +           file://Remove-ILUT-dependency.patch"
>>> >>> +
>>> >>> +SRCREV =3D "e34284a7e07763769f671a74b4fec718174ad862"
>>> >>> +
>>> >>> +COMPATIBLE_MACHINE =3D "j7-evm"
>>> >>
>>> >>Is it really compatible with j7 only? Looks to me as rather generic..=
.
>>> >
>>> >Yes, it is generic but haven't had chance to test on other platform. S=
o
>>> >included for J7 for now.
>>> >
>>> >>
>>> >>> +
>>> >>> +PR =3D "r1"
>>> >>> +S =3D "${WORKDIR}/git"
>>> >>> +
>>> >>> +# Build only DevIL
>>> >>> +OECMAKE_SOURCEPATH =3D "${S}/DevIL"
>>> >>> +
>>> >>> +PACKAGECONFIG ??=3D "png"
>>> >>> +PACKAGECONFIG[png] =3D "-DIL_NO_PNG=3D0,-DIL_NO_PNG=3D1,libpng,"
>>> >>> +
>>> >>> +DEPENDS +=3D "libpng"
>>> >>
>>> >>Dependency on libpng should be taken care by the PACKAGECONFIG above.
>>> >
>>> >I see, will remove it.
>>> >
>>> >>
>>> >>> +inherit pkgconfig cmake
>>> >>> +
>>> >>> +INSANE_SKIP_${PN} +=3D "file-rdeps dev-so"
>>> >>> +FILES_${PN} +=3D "${libdir}/lib*${SOLIBSDEV}"
>>> >>> +FILES_SOLIBSDEV =3D ""
>>> >>
>>> >>Any way to package the libraries properly and not suppress QA checks?
>>> >
>>> >dev-so was needed, else it would complain on the symlinks. File-rdeps =
I
>>
>>If it produces proper library libfoo.so.X.Y.Z with symlinks libfoo.so.X a=
nd
>>libfoo.so, then just let the framework package everything automatically b=
y
>>removing FILES_*.
>>
>>
>>> >couldn't quite resolve without suppressing them.
>>>
>>> ERROR: devil-1.8.0-r2 do_package_qa: QA Issue: /usr/lib/libIL.so.1
>contained
>>in package devil requires libc.so.6(GLIBC_2.17)(64bit), but no providers
>found
>>in RDEPENDS_devil? [file-rdeps]
>>> ERROR: devil-1.8.0-r2 do_package_qa: QA Issue: /usr/lib/libIL.so.1
>contained
>>in package devil requires libstdc++.so.6()(64bit), but no providers found=
 in
>>RDEPENDS_devil? [file-rdeps]
>>>
>>> What does RDEPENDS_devil take the library target name or the recipe nam=
e.
>>
>>DEPENDS is build-time dependency and takes recipe names.
>>RDEPENDS is run-time dependency and takes package names.
>>
>>But libc and libstdc++ dependencies are normally taken care by the framew=
ork.
>
>That's my understanding. If I do say RDEPENDS_${PN} =3D "libstdc++6" I see
>"Nothing RPROVIDES 'libstdc++6'", which seems right as there is no explici=
t
>provider for it.
>
>>The only exception when you would see such errors is when the library was
>>built outside of the framework, i.e. consumed as a binary in the recipe, =
not
>>built from sources.
>
>Interesting, there are no prebuilt binaries in here, everything should get
>built from source. Let me do a clean build.

It looks like my earlier build was corrupted, doing a clean build didn't sh=
ow any of the above errors. Pushed a v2.

Thanks,
Gowtham

