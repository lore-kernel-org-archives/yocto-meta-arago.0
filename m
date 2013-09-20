Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 4FE37529A2
	for <meta-arago@arago-project.org>;
	Fri, 20 Sep 2013 20:49:03 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8KKn2pW029193;
	Fri, 20 Sep 2013 15:49:02 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8KKn2vL005363;
	Fri, 20 Sep 2013 15:49:02 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Fri, 20 Sep 2013 15:49:02 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [meta-arago] [PATCH] sourceipk: do not dereference symlinks
	when packaging data to avoid breakage
Thread-Index: AQHOtjOrr8PUTT3Ks02uWWO/clsscJnPaCaA//+wmQA=
Date: Fri, 20 Sep 2013 20:49:00 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C558340@DFLE08.ent.ti.com>
References: <1379703595-1330-1-git-send-email-denis@denix.org>
	<20EC9FB1-3555-4CE0-9D7A-A45365A6A555@ti.com>
In-Reply-To: <20EC9FB1-3555-4CE0-9D7A-A45365A6A555@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] sourceipk: do not dereference symlinks when packaging data to avoid breakage
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
X-List-Received-Date: Fri, 20 Sep 2013 20:49:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Maupin, Chase
> Sent: Friday, September 20, 2013 3:31 PM
> To: Denys Dmytriyenko
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] sourceipk: do not dereference symlinks
> when packaging data to avoid breakage
>=20
> Will this still package things like the patches applied on top of the ker=
nel in the
> kernel sources?

[Franklin] Good call. Your right it doesn't. I gave it a shot and the symbo=
lic link remains but of course the link is broken if it is used on a differ=
ent machine.
>=20
> Sent from my iPhone
>=20
> On Sep 20, 2013, at 2:00 PM, "Denys Dmytriyenko" <denis@denix.org> wrote:
>=20
> > From: Denys Dmytriyenko <denys@ti.com>
> >
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> > meta-arago-distro/classes/sourceipk.bbclass | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-arago-
> distro/classes/sourceipk.bbclass
> > index 1ea0577..777cb4f 100644
> > --- a/meta-arago-distro/classes/sourceipk.bbclass
> > +++ b/meta-arago-distro/classes/sourceipk.bbclass
> > @@ -167,7 +167,7 @@ sourceipk_do_create_srcipk() {
> >         fi
> >
> >         #Write the data tarball
> > -        tar -C $tmp_dir --owner=3D0 --group=3D0 -chzf $srcipk_dir/data=
.tar.gz .
> > +        tar -C $tmp_dir --owner=3D0 --group=3D0 -czf $srcipk_dir/data.=
tar.gz .
> >
> >         # Create the debian-binary file
> >         echo "2.0" > $srcipk_dir/debian-binary
> > --
> > 1.8.3.2
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

