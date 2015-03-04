Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 028AA52A77
	for <meta-arago@arago-project.org>;
	Wed,  4 Mar 2015 20:35:57 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t24KZvxv010274
	for <meta-arago@arago-project.org>; Wed, 4 Mar 2015 14:35:57 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t24KZuxr018957
	for <meta-arago@arago-project.org>; Wed, 4 Mar 2015 14:35:56 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Wed, 4 Mar 2015 14:35:56 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 2/3] stream: Add append for TISDK
	customizations
Thread-Index: AQHQVraNzHu+1nr+DEusTq28FUmTgZ0NKHQA//+fKaA=
Date: Wed, 4 Mar 2015 20:35:55 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C83579A@DFLE08.ent.ti.com>
References: <1425499517-11576-1-git-send-email-fcooper@ti.com>
	<1425499517-11576-2-git-send-email-fcooper@ti.com>
	<20150304202026.GK6052@edge>
In-Reply-To: <20150304202026.GK6052@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 2/3] stream: Add append for TISDK customizations
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
X-List-Received-Date: Wed, 04 Mar 2015 20:35:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, March 04, 2015 2:20 PM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 2/3] stream: Add append for TISDK
> customizations
>=20
> On Wed, Mar 04, 2015 at 02:05:15PM -0600, Franklin S. Cooper Jr wrote:
> > From: "Franklin S. Cooper Jr" <fcooper@ti.com>
> >
> > * Use an SDK branch that slightly tweaks the makefile to include generi=
c
> >   optimizations that should be used by all TI platforms.
> > * Also manually set certain variables to insure no additional/unexpecte=
d
> >   compiler optimization are pulled in.
> >
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  .../recipes-benchmark/stream/stream_git.bbappend   |   10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >  create mode 100644
> > meta-arago-distro/recipes-benchmark/stream/stream_git.bbappend
> >
> > diff --git
> > a/meta-arago-distro/recipes-benchmark/stream/stream_git.bbappend
> > b/meta-arago-distro/recipes-benchmark/stream/stream_git.bbappend
> > new file mode 100644
> > index 0000000..83adfb6
> > --- /dev/null
> > +++ b/meta-arago-distro/recipes-
> benchmark/stream/stream_git.bbappend
> > @@ -0,0 +1,10 @@
> > +PR_append =3D "-arago0"
> > +
> > +BRANCH =3D "sdk"
> > +SRCREV =3D "cfd73a33c0ceef1f8532ce6a71de3bcf9435f6a2"
> > +
> > +do_compile_prepend() {
> > +    #Explicitly set some variables to insure no unexpected optimizatio=
ns are
> being passed in.
> > +    export CFLAGS=3D"-
> isystem${EXTERNAL_TOOLCHAIN}/${ELT_TARGET_SYS}/include"
> > +    export LDFLAGS=3D"-L${EXTERNAL_TOOLCHAIN}/${ELT_TARGET_SYS}/lib -
> Wl,-rpath-link,${EXTERNAL_TOOLCHAIN}/${ELT_TARGET_SYS}/lib"
>=20
> NAK, this assumes external Linaro toolchain. Can you make it more generic=
?
> Why can't you use the sysroots?
[Franklin] Oops didn't notice that. I simply looked at the bitbake env vari=
ables and stripped away what I didn't need from CFLAGS and LDFLAGS. I'll se=
nd a v2 shortly.
> --
> Denys

