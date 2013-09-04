Return-Path: <sajesh@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 087355299B
	for <meta-arago@arago-project.org>;
	Wed,  4 Sep 2013 19:18:58 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r84JIw4t027696
	for <meta-arago@arago-project.org>; Wed, 4 Sep 2013 14:18:58 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r84JIwvG027676
	for <meta-arago@arago-project.org>; Wed, 4 Sep 2013 14:18:58 -0500
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Wed, 4 Sep 2013 14:18:58 -0500
From: "Saran, Sajesh Kumar" <sajesh@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] QA issue while packaging DSP images
Thread-Index: Ac6plE6wLgbJ9m7+T4+DDsOoAhGmUQALgrGAAAfDzWA=
Date: Wed, 4 Sep 2013 19:18:57 +0000
Message-ID: <8EAE6244CE843044A42356038645C855157723A3@DFLE12.ent.ti.com>
References: <8EAE6244CE843044A42356038645C85515771EE7@DFLE12.ent.ti.com>
	<20130904175903.GB25135@edge>
In-Reply-To: <20130904175903.GB25135@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: QA issue while packaging DSP images
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
X-List-Received-Date: Wed, 04 Sep 2013 19:18:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I set 'arch' to the INSANE_SKIP_${PN}, the recipe worked fine after that.

Thanks,
Sajesh


-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Wednesday, September 04, 2013 1:59 PM
To: Saran, Sajesh Kumar
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] QA issue while packaging DSP images

On Wed, Sep 04, 2013 at 05:33:32PM +0000, Saran, Sajesh Kumar wrote:
> Hi,
>=20
> I am getting QA issue when I try to package DSP images in /lib/firmware d=
irectory.
>=20
> In the recipe I have added following
>=20
> INHIBIT_PACKAGE_STRIP =3D "1"
> INSANE_SKIP_${PN} =3D "True"
> FILES_${PN}_append =3D "${base_libdir}"
> FILES_${PN} +=3D "${base_libdir}/firmware"
> FILES_${PN} +=3D "${base_libdir}/firmware/dsp-core0.out"
> FILES_${PN} +=3D "${base_libdir}/firmware/dsp-core1.out"
> FILES_${PN} +=3D "${base_libdir}/firmware/dsp-core2.out"
> FILES_${PN} +=3D "${base_libdir}/firmware/dsp-core3.out"
>=20
> I see following error in the log
> NOTE: DO PACKAGE QA
> NOTE: Checking Package: ti-tci6614-remoteproc-dbg
> NOTE: Checking Package: ti-tci6614-remoteproc-staticdev
> NOTE: Checking Package: ti-tci6614-remoteproc-dev
> NOTE: Checking Package: ti-tci6614-remoteproc-doc
> NOTE: Checking Package: ti-tci6614-remoteproc-locale
> NOTE: Package ti-tci6614-remoteproc skipping QA tests: ['True']
> NOTE: Checking Package: ti-tci6614-remoteproc
> ERROR: QA Issue: Architecture did not match (40 to 140) on=20
> /work/armv7ahf-vfp-neon-oe-linux-gnueabi/ti-tci6614-remoteproc-1.0-r1/
> packages-split/ti-tci6614-remoteproc/lib/firmware/dsp-core0.out
> ERROR: QA run found fatal errors. Please consider fixing them.
> DEBUG: Python function do_package_qa finished
>=20
> Is there any other flags to suppress this check?

"True" is not a correct QA test hence your INSANE_SKIP does not work.

So, the error "Architecture did not match" means that your recipe says it b=
uilds binaries for the target architecture, which is Linux ELF 32bit ARM.=20
Your binaries are not of the same arch. But we don't have an architecture d=
efined for DSP binaries. So, you can mark your recipe as machine-specific
(PACKAGE_ARCH=3DMACHINE_ARCH) and listing "arch" test case in the INSANE_SK=
IP, which is a list of cases to skip during QA check.

--=20
Denys

