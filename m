Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 0E11A52A0F
	for <meta-arago@arago-project.org>;
	Fri, 20 Jun 2014 20:16:34 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5KKGXta027595
	for <meta-arago@arago-project.org>; Fri, 20 Jun 2014 15:16:33 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5KKGXrM027582
	for <meta-arago@arago-project.org>; Fri, 20 Jun 2014 15:16:33 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Fri, 20 Jun 2014 15:16:33 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Maupin, Chase" <chase.maupin@ti.com>
Thread-Topic: [meta-arago] [PATCH 14/19] toolchain-external: bb.which() is
	not part of bb.utils module
Thread-Index: AQHPjLJvXGUlG3QEIUu/VH1sCYoygZt6sQ+AgAABXQD//707oA==
Date: Fri, 20 Jun 2014 20:16:32 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6D659F@DFLE08.ent.ti.com>
References: <1403287009-11256-1-git-send-email-denis@denix.org>
	<1403287009-11256-15-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED1015D0D9475@DLEE11.ent.ti.com>
	<20140620191530.GD1825@edge>
In-Reply-To: <20140620191530.GD1825@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 14/19] toolchain-external: bb.which() is not part of bb.utils module
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
X-List-Received-Date: Fri, 20 Jun 2014 20:16:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> Sent: Friday, June 20, 2014 2:16 PM
> To: Maupin, Chase
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 14/19] toolchain-external: bb.which() is=
 not
> part of bb.utils module
>=20
> Good catch, indeed.
>=20
>=20
> On Fri, Jun 20, 2014 at 07:10:37PM +0000, Maupin, Chase wrote:
> > Do you mean is "now" part of bb.utils module?
> >
> > Acked-by: Chase Maupin <chase.maupin@ti.com>
> >
> >
> > >-----Original Message-----
> > >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > >bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > >Sent: Friday, June 20, 2014 12:57 PM
> > >To: meta-arago@arago-project.org
> > >Subject: [meta-arago] [PATCH 14/19] toolchain-external: bb.which() is
> > >not part of bb.utils module
> > >
> > >From: Denys Dmytriyenko <denys@ti.com>
> > >
> > >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > >---
> > > meta-arago-distro/conf/distro/include/toolchain-external.inc | 2
> > >+-
> > > 1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > >diff --git a/meta-arago-distro/conf/distro/include/toolchain-
> > >external.inc b/meta-arago-distro/conf/distro/include/toolchain-
> > >external.inc
> > >index 5356082..4d14c00 100644
> > >--- a/meta-arago-distro/conf/distro/include/toolchain-external.inc
> > >+++ b/meta-arago-distro/conf/distro/include/toolchain-external.inc
> > >@@ -1,4 +1,4 @@
> > > # Locate the toolchain automatically from PATH -TOOLCHAIN_SYSPATH :=
=3D
> > >"${@os.path.abspath(os.path.dirname(bb.which(d.getVar('PATH', d, 1),
> > >d.getVar('TOOLCHAIN_PREFIX', d,
> > >1)+'cpp'))+'/../'+d.getVar('TOOLCHAIN_SYS', d, 1))}"
> > >+TOOLCHAIN_SYSPATH :=3D
> > >"${@os.path.abspath(os.path.dirname(bb.utils.which(d.getVar('PATH'
> > >, d, 1), d.getVar('TOOLCHAIN_PREFIX', d,
> > >1)+'cpp'))+'/../'+d.getVar('TOOLCHAIN_SYS', d, 1))}"
> > > TOOLCHAIN_PATH :=3D "${@bool(d.getVar('TOOLCHAIN_SYSPATH', d, 1)) and
> > >(os.path.exists(d.getVar('TOOLCHAIN_SYSPATH', d, 1)) and
> > >os.path.dirname(d.getVar('TOOLCHAIN_SYSPATH', d, 1)) or bb.fatal('No
> > >valid toolchain in PATH')) or ''}"
> > > EXTERNAL_TOOLCHAIN =3D "${TOOLCHAIN_PATH}"
> > >--
> > >2.0.0
> > >
> > >_______________________________________________
> > >meta-arago mailing list
> > >meta-arago@arago-project.org
> > >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

