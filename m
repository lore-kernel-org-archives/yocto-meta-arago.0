Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id E10F4529D4
	for <meta-arago@arago-project.org>;
	Wed, 29 Jan 2020 17:36:24 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00THYX0e036850
	for <meta-arago@arago-project.org>; Wed, 29 Jan 2020 11:34:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580319273;
	bh=i2sYmVRScMu2/1geYH2Dwkkrit0Ox/ilyWgL1NXNDYI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ZyJQgzn5q0YB4bOx2dVzYZKsJhM83aG4Ndn8LIUn50sFIVVtxKngWmzsUqquBl/2k
	B+6gLz2VKYaTZLWpNDUNl13ktuhMmbpMj2wGoJlGFX/ZV6zaFQo3dCnMkoC3wG4is7
	1oE0ASo/ytxjEIvMo4W+gHl3Epbq/ku9JmN8U0sw=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00THYX4b102761
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 29 Jan 2020 11:34:33 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 29 Jan 2020 11:34:32 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Wed, 29 Jan 2020 11:34:32 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00THYWND027601;
	Wed, 29 Jan 2020 11:34:32 -0600
Date: Wed, 29 Jan 2020 12:34:32 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Tammana, Gowtham" <g-tammana@ti.com>
Message-ID: <20200129173432.GM3658@beryl>
References: <20200122173626.11984-1-g-tammana@ti.com>
	<20200128234539.GH3658@beryl>
	<023358a5926f4910bea382f2a280cfe7@ti.com>
	<b26a3c1112324c3e81a2b3bda7a67b66@ti.com>
MIME-Version: 1.0
In-Reply-To: <b26a3c1112324c3e81a2b3bda7a67b66@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
X-List-Received-Date: Wed, 29 Jan 2020 17:36:25 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jan 29, 2020 at 12:27:50PM -0500, Tammana, Gowtham wrote:
> 
> 
> >>recipe for DevIL
> >>
> >>On Wed, Jan 22, 2020 at 11:36:26AM -0600, Gowtham Tammana wrote:
> >>> Developers Image Library (DevIL) is a cross-platfor image utility
> >>> library with simple syntax (openil.sourceforge.net). Adding recipe to
> >>> build from sources.
> >>
> >>Where is it coming from? I see there are many copies in other layers - is it
> >>based on something or completely done from scratch?
> >
> >Do you mean the recipe, if so yes its done from scratch.
> >
> >>
> >>> index 00000000..6ba7f34b
> >>> --- /dev/null
> >>> +++ b/meta-arago-extras/recipes-graphics/devil/devil_1.8.0.bb
> >>> @@ -0,0 +1,30 @@
> >>> +DESCRIPTION = "Developer's Image Library (DevIL) is a cross-platform image
> >>\
> >>> +               library utilizing simple syntax to load, save, convert, \
> >>> +               manipulate, filter and display a variety of images."
> >>
> >>Would also need a short SUMMARY set.
> >
> >Ok, let me add include that.
> >
> >>
> >>> +HOMEPAGE = "https://github.com/DentonW/DevIL"
> >>> +LICENSE = "LGPLv2"
> >>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=fc178bcd425090939a8b634d1d6a9594"
> >>> +
> >>> +SRC_URI = "git://github.com/dentonw/devil.git;protocol=git;branch=master \
> >>> +           file://Remove-ILUT-dependency.patch"
> >>> +
> >>> +SRCREV = "e34284a7e07763769f671a74b4fec718174ad862"
> >>> +
> >>> +COMPATIBLE_MACHINE = "j7-evm"
> >>
> >>Is it really compatible with j7 only? Looks to me as rather generic...
> >
> >Yes, it is generic but haven't had chance to test on other platform. So
> >included for J7 for now.
> >
> >>
> >>> +
> >>> +PR = "r1"
> >>> +S = "${WORKDIR}/git"
> >>> +
> >>> +# Build only DevIL
> >>> +OECMAKE_SOURCEPATH = "${S}/DevIL"
> >>> +
> >>> +PACKAGECONFIG ??= "png"
> >>> +PACKAGECONFIG[png] = "-DIL_NO_PNG=0,-DIL_NO_PNG=1,libpng,"
> >>> +
> >>> +DEPENDS += "libpng"
> >>
> >>Dependency on libpng should be taken care by the PACKAGECONFIG above.
> >
> >I see, will remove it.
> >
> >>
> >>> +inherit pkgconfig cmake
> >>> +
> >>> +INSANE_SKIP_${PN} += "file-rdeps dev-so"
> >>> +FILES_${PN} += "${libdir}/lib*${SOLIBSDEV}"
> >>> +FILES_SOLIBSDEV = ""
> >>
> >>Any way to package the libraries properly and not suppress QA checks?
> >
> >dev-so was needed, else it would complain on the symlinks. File-rdeps I

If it produces proper library libfoo.so.X.Y.Z with symlinks libfoo.so.X and 
libfoo.so, then just let the framework package everything automatically by 
removing FILES_*.


> >couldn't quite resolve without suppressing them.
> 
> ERROR: devil-1.8.0-r2 do_package_qa: QA Issue: /usr/lib/libIL.so.1 contained in package devil requires libc.so.6(GLIBC_2.17)(64bit), but no providers found in RDEPENDS_devil? [file-rdeps]
> ERROR: devil-1.8.0-r2 do_package_qa: QA Issue: /usr/lib/libIL.so.1 contained in package devil requires libstdc++.so.6()(64bit), but no providers found in RDEPENDS_devil? [file-rdeps]
> 
> What does RDEPENDS_devil take the library target name or the recipe name.

DEPENDS is build-time dependency and takes recipe names.
RDEPENDS is run-time dependency and takes package names.

But libc and libstdc++ dependencies are normally taken care by the framework. 
The only exception when you would see such errors is when the library was 
built outside of the framework, i.e. consumed as a binary in the recipe, not 
built from sources.

-- 
Denys

