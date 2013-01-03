Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id AA0D6529AA
	for <meta-arago@arago-project.org>;
	Thu,  3 Jan 2013 20:09:33 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r03K9W7J018920;
	Thu, 3 Jan 2013 14:09:32 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r03K9WAY013917;
	Thu, 3 Jan 2013 14:09:32 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Thu, 3 Jan 2013 14:09:32 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Franklin S. Cooper Jr"
	<fcooperjr27@gmail.com>
Thread-Topic: [meta-arago] [PATCH] shadow-securetty: Allow remote telnet
	login as root
Thread-Index: AQHNvSuXktSVTqIJskql1s+Nvfici5ffRfGA//+gJmCAWXv2QA==
Date: Thu, 3 Jan 2013 20:09:31 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C359906@DFLE09.ent.ti.com>
References: <1352322311-11941-1-git-send-email-fcooper@ti.com>
	<20121107212129.GH11967@edge>
	<8F29D6B095ED194EA1980491A5E029710C31ABCD@DFLE09.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C31ABCD@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] shadow-securetty: Allow remote telnet login as root
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
X-List-Received-Date: Thu, 03 Jan 2013 20:09:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ping

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> Sent: Wednesday, November 07, 2012 3:41 PM
> To: Dmytriyenko, Denys; Franklin S. Cooper Jr
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] shadow-securetty: Allow remote telnet l=
ogin
> as root
>=20
>=20
>=20
> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, November 07, 2012 3:21 PM
> To: Franklin S. Cooper Jr
> Cc: meta-arago@arago-project.org; Cooper Jr., Franklin
> Subject: Re: [meta-arago] [PATCH] shadow-securetty: Allow remote telnet l=
ogin
> as root
>=20
> On Wed, Nov 07, 2012 at 03:05:11PM -0600, Franklin S. Cooper Jr wrote:
> > * Need to add pts/X to the securetty file to allow remote login via
> > telnet as root
>=20
> Why do we need telnetd and specifically with root login? Isn't sshd not e=
nough?
> Previously telnetd was enabled because we couldn't ship sshd...
>=20
> Franklin:
> We still have some customers that want to use telnet to login into the sy=
stem
> and some of our backend systems use telnet to login into to the system to
> perform our testing.
>=20
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  .../shadow/shadow-securetty_4.1.4.3.bbappend       |   15 ++++++++++++=
+++
> >  1 files changed, 15 insertions(+), 0 deletions(-)  create mode 100644
> > meta-arago-distro/recipes-extended/shadow/shadow-securetty_4.1.4.3.bba
> > ppend
> >
> > diff --git
> > a/meta-arago-distro/recipes-extended/shadow/shadow-securetty_4.1.4.3.b
> > bappend
> > b/meta-arago-distro/recipes-extended/shadow/shadow-securetty_4.1.4.3.b
> > bappend
> > new file mode 100644
> > index 0000000..a09c514
> > --- /dev/null
> > +++ b/meta-arago-distro/recipes-extended/shadow/shadow-securetty_4.1.4
> > +++ .3.bbappend
> > @@ -0,0 +1,15 @@
> > +PR_append =3D "-arago0"
> > +
> > +do_install_append () {
> > +    # Allow telnet sessions to login as root
> > +    securetty_file=3D${D}${sysconfdir}/securetty
> > +
> > +    printf '\n' >> $securetty_file
> > +    printf '# Allow 5 telnet login\n' >> $securetty_file
> > +    printf 'pts/0\n' >> $securetty_file
> > +    printf 'pts/1\n' >> $securetty_file
> > +    printf 'pts/2\n' >> $securetty_file
> > +    printf 'pts/3\n' >> $securetty_file
> > +    printf 'pts/4\n' >> $securetty_file
>=20
> You don't need to escape anything here, why not simply use "echo"?
>=20
> > +
> > +}
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

