Return-Path: <sam.nelson@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 00696529D3
	for <meta-arago@arago-project.org>;
	Tue,  9 Jul 2013 18:18:25 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r69IIPEs014925
	for <meta-arago@arago-project.org>; Tue, 9 Jul 2013 13:18:25 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r69IIP2C030145
	for <meta-arago@arago-project.org>; Tue, 9 Jul 2013 13:18:25 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Tue, 9 Jul 2013 13:18:24 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: Help needed: Devkit header files not upto date with kernel
	headers
Thread-Index: Ac58uM2PpIbXIOSeQbWrqZRCbpOZMQAK7euAAApSroD//7TtAIAAPLVw
Date: Tue, 9 Jul 2013 18:18:24 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F49054937CD9@DLEE11.ent.ti.com>
References: <4F9216F96E5DF9428610502835A9F49054937C49@DLEE11.ent.ti.com>
	<20130709154017.GD14185@edge>
	<4F9216F96E5DF9428610502835A9F49054937C6E@DLEE11.ent.ti.com>
	<20130709160710.GF14185@edge>
In-Reply-To: <20130709160710.GF14185@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Karicheri,
	Muralidharan" <m-karicheri2@ti.com>, "Shilimkar,
	Santosh" <santosh.shilimkar@ti.com>
Subject: Re: Help needed: Devkit header files not upto date with kernel headers
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
X-List-Received-Date: Tue, 09 Jul 2013 18:18:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks for the detailed information.
So  to update the headers I need to make changes in the linux-libc-headers =
recipe?

Specifically, any update needed in=20
oe-core/meta/recipes-kernel/linux-libc-headers/linux-libc-header.inc
or=20
do I need to add a new recipe for the 3.8.4 header similar to the other rec=
ipes?

oe-core/meta/recipes-kernel/linux-libc-headers$ ls
linux-libc-headers           linux-libc-headers_3.4.3.bb
linux-libc-headers_3.0.8.bb  linux-libc-headers.inc
linux-libc-headers_3.2.bb

Any guidelines on what to update to get the latest headers for 3.8.4 kernel=
 will be helpful.

with regards,
sam

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Tuesday, July 09, 2013 12:07 PM
To: Nelson, Sam
Cc: meta-arago@arago-project.org; Karicheri, Muralidharan; Shilimkar, Santo=
sh
Subject: Re: Help needed: Devkit header files not upto date with kernel hea=
ders

Sam,

Please see my last comment - there's a separate recipe for user-space kerne=
l headers. The headers need to be properly exported, you cannot just use th=
e ones from the kernel directly. Hence they are detached - updating the hea=
der in the kernel tree does not automatically update exported headers for t=
he user space in linux-libc-headers.

--=20
Denys


On Tue, Jul 09, 2013 at 12:00:34PM -0400, Nelson, Sam wrote:
> Understand the user space headers and kernel space headers are different =
in=20
> general. But in this case, I am comparing the files under "uapi" director=
y.=20
> Which I assume is actually meant for user space api. Am I wrong on this?=
=20
> Given that , I expected the header file will be updated in building the=20
> devkit.
>=20
> For example if we have update on an "uapi" header file , as part of a ker=
nel=20
> patch, Don't we expect the corresponding header file in devkit to be=20
> updated? Appreciate your comments.
>=20
> With regards,
> Sam
>=20
>=20
> -----Original Message-----
> From: Dmytriyenko, Denys=20
> Sent: Tuesday, July 09, 2013 11:40 AM
> To: Nelson, Sam
> Cc: meta-arago@arago-project.org; Karicheri, Muralidharan; Shilimkar, San=
tosh
> Subject: Re: Help needed: Devkit header files not upto date with kernel h=
eaders
>=20
> On Tue, Jul 09, 2013 at 11:30:35AM -0400, Nelson, Sam wrote:
> >    Hello all,
> >=20
> >    The header files under sysroots/armv7ahf-vfp-neon-oe-linux-gnueabi d=
oes
> >    not match the same file from the kernel tree.
>=20
> That's normal. There's a difference between kernel and user-space facing =
headers.
>=20
> http://kernelnewbies.org/KernelHeaders
>=20
>=20
> >    For example
> >=20
> >    Comparing the following 2 files, they are different.
> >=20
> >   =20
> > sysroots/armv7ahf-vfp-neon-oe-linux-gnueabi/usr/include/linux/ethtool.
> > h
> >=20
> >    and
> >=20
> >   =20
> > sysroots/armv7ahf-vfp-neon-oe-linux-gnueabi/usr/src/kernel/include/uap
> > i/linux/ethtool.h
> >=20
> >    =20
> >=20
> >    Looking into some details, the /usr/include/linux/ethtool.h, seems t=
o come
> >    from the libc package.
>=20
> Yes, those are different even on my host machine. The first is marked as =
_LINUX_ETHTOOL_H and the second one as _UAPI_LINUX_ETHTOOL_H
>=20
> http://lwn.net/Articles/113349/
> http://lwn.net/Articles/507794/
>=20
>=20
> >    Any ideas on what can be wrong in the recipes will be helpful.  Is t=
here
> >    any way to update the user space header files to match the kernel he=
ader
> >    files?
>=20
> There is a special recipe for that - linux-libc-headers.
>=20
> --
> Denys

