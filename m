Return-Path: <j-stiffler@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id D0FCC52AB0
	for <meta-arago@arago-project.org>;
	Mon,  1 Aug 2016 17:08:25 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u71H4WiO015939
	for <meta-arago@arago-project.org>; Mon, 1 Aug 2016 12:04:32 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u71H8Obp027091
	for <meta-arago@arago-project.org>; Mon, 1 Aug 2016 12:08:24 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0294.000; Mon, 1 Aug 2016 12:08:23 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: gstreamer 1.6: bad plugins
Thread-Index: AdHr4hiQQHFXgrANQXCjU+yWeIjpqwAXWcgAAAofqlA=
Date: Mon, 1 Aug 2016 17:08:22 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F958142EFE8B@DFLE09.ent.ti.com>
References: <4B26FB5A64EBA14C87266869E037F958142EFC43@DFLE09.ent.ti.com>
	<20160801165603.GB3677@edge>
In-Reply-To: <20160801165603.GB3677@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "R,
	Karthik" <karthik.ramanan@ti.com>
Subject: Re: gstreamer 1.6: bad plugins
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
X-List-Received-Date: Mon, 01 Aug 2016 17:08:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, August 01, 2016 12:56 PM
> To: Stiffler, Jacob
> Cc: meta-arago@arago-project.org; R, Karthik
> Subject: Re: gstreamer 1.6: bad plugins
>=20
> Surprisingly, I don't see this error in my K2 builds...
>=20

Are you building gstreamer for k2? I think we have not yet upstreamed addin=
g gstreamer to the tisdk-server images.

>=20
> On Mon, Aug 01, 2016 at 06:52:36AM -0400, Stiffler, Jacob wrote:
> >    Karthik, Denys,
> >
> >
> >
> >    We are seeing a failure with building the gstreamer1.0-plugins-bad f=
or k2
> >    since upgrading to 1.6.
> >
> >
> >
> >    In file included from
> >    ../../../../git/gst-libs/gst/drm/gstdrmallocator.c:32:0:
> >
> >    ../../../../git/gst-libs/gst/drm/gstdrmallocator.h:39:21: fatal erro=
r:
> >    xf86drm.h: No such file or directory
> >
> >    compilation terminated.
> >
> >    Makefile:866: recipe for target 'libgstdrm_1.0_la-gstdrmallocator.lo=
'
> >    failed
> >
> >    make[4]: *** [libgstdrm_1.0_la-gstdrmallocator.lo] Error 1
> >
> >    make[4]: Leaving directory
> >    '/home/gtbldadm/processor-sdk-linux-krogoth-build/build-
> CORTEX_1/arago-tmp-external-linaro-toolchain/work/k2hk_evm-linux-
> gnueabi/gstreamer1.0-plugins-bad/1.6.3-r20/build/gst-libs/gst/drm'
> >
> >    Makefile:1050: recipe for target 'drm' failed
> >
> >
> >
> >
> >
> >    This appears to be related to
> >    http://git.ti.com/glsdk/gstreamer1-0-plugins-
> bad/commit/04ee4d353888a210c5ee5792ff402eb8c3d3e6e4.
> >    Is there a config option to disable the drm allocator?
> >
> >
> >
> >    I am also curious as to why we are using different versions of these
> >    plugins for ti33x and ti43x. Should k2 also use that commit? I am
> >    referring to the lines in gstreamer1.0-plugins-bad_git.bbappend:
> >
> >
> >
> >      38 SRCREV =3D "f0694b5fcec997036ef7df4d382b28e833c8ebfd"
> >
> >      39 SRCREV_ti43x =3D "d0160ca810be30bf2b2e7681f5047933402efb52"
> >
> >      40 SRCREV_ti33x =3D "d0160ca810be30bf2b2e7681f5047933402efb52"
> >
> >
> >
> >
> >
> >    Thank you,
> >
> >    Jake

