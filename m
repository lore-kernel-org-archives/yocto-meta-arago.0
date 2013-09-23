Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id A16A652099
	for <meta-arago@arago-project.org>;
	Mon, 23 Sep 2013 20:12:39 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8NKCcsT004766
	for <meta-arago@arago-project.org>; Mon, 23 Sep 2013 15:12:38 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8NKCcPc032139
	for <meta-arago@arago-project.org>; Mon, 23 Sep 2013 15:12:38 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Mon, 23 Sep 2013 15:12:38 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Maupin, Chase" <chase.maupin@ti.com>
Thread-Topic: [meta-arago] [PATCH] sourceipk: do not dereference symlinks
	when packaging data to avoid breakage
Thread-Index: AQHOtjOrr8PUTT3Ks02uWWO/clsscJnPaCaA//+wmQCAAFWAgIAEXggAgAAnUgD//9AcYA==
Date: Mon, 23 Sep 2013 20:12:37 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C55B058@DFLE08.ent.ti.com>
References: <1379703595-1330-1-git-send-email-denis@denix.org>
	<20EC9FB1-3555-4CE0-9D7A-A45365A6A555@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C558340@DFLE08.ent.ti.com>
	<20130920205310.GE30673@edge>
	<7D46E86EC0A8354091174257B2FED10159741920@DLEE11.ent.ti.com>
	<20130923175530.GF3456@edge>
In-Reply-To: <20130923175530.GF3456@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
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
X-List-Received-Date: Mon, 23 Sep 2013 20:12:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, September 23, 2013 12:56 PM
> To: Maupin, Chase
> Cc: Cooper Jr., Franklin; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] sourceipk: do not dereference symlinks
> when packaging data to avoid breakage
>=20
> On Mon, Sep 23, 2013 at 11:34:46AM -0400, Maupin, Chase wrote:
> > >-----Original Message-----
> > >From: Dmytriyenko, Denys
> > >Sent: Friday, September 20, 2013 4:53 PM
> > >To: Cooper Jr., Franklin
> > >Cc: Maupin, Chase; Denys Dmytriyenko; meta-arago@arago-project.org
> > >Subject: Re: [meta-arago] [PATCH] sourceipk: do not dereference
> > >symlinks when packaging data to avoid breakage
> > >
> > >On Fri, Sep 20, 2013 at 08:49:00PM +0000, Cooper Jr., Franklin
> > >wrote:
> > >>
> > >>
> > >> > -----Original Message-----
> > >> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > >> > bounces@arago-project.org] On Behalf Of Maupin, Chase
> > >> > Sent: Friday, September 20, 2013 3:31 PM
> > >> > To: Denys Dmytriyenko
> > >> > Cc: meta-arago@arago-project.org
> > >> > Subject: Re: [meta-arago] [PATCH] sourceipk: do not
> > >dereference symlinks
> > >> > when packaging data to avoid breakage
> > >> >
> > >> > Will this still package things like the patches applied on top
> > >of the kernel in the
> > >> > kernel sources?
> > >>
> > >> [Franklin] Good call. Your right it doesn't. I gave it a shot
> > >and the
> > >> symbolic link remains but of course the link is broken if it is
> > >used on a
> > >> different machine.
> > >
> > >Yeah, I had the same question originally. Unfortunately, you cannot
> > >assume there are no broken links in the sources to begin with. And
> > >those broken symlinks cannot be dereferenced w/o breaking the entire
> > >tar command and hence the build. That is what we discussed couple
> > >days ago - kernel now has a broken symlink that kills our
> > >sourceipk...
> > >
> > >Why do patches symlinked and not copied? Can we fix that step instead
> > >of doing it in tar command?
> >
> > For most builds I think the idea is not to have multiple copies of the
> > patches.  But we wanted to provide those patches in the sources we ship=
.
> > That was why the symlink we dereferenced to provide the real file and
> > not a pointer to the patch.  So I'm not sure that it is a good idea to
> > always copy patches instead of symlink as most people probably won't ca=
re.
>=20
> This paragraph is somewhat confusing. It sounds like the patch handling i=
s done
> by sourceipk class, which is not.
>=20
> Anyway, the ${S}/patches/ directory gets created and patches are symlinke=
d
> there by the core framework to make quilt happy. Unfortunately, there are=
 no
> flags or variables to copy patches instead of symlinking them, or affect =
that code
> in other way. So, sourceipk class just piggy-backs on the above code to p=
rep
> quilt series.
>=20
> > Is there a way to bypass the error?  Maybe something like
> > --ignore-command-error?  I'm not sure what changed that created this
> > issue so I'm not sure if this applies.
>=20
> Unfortunately, no, that flag doesn't help. What changed is that kernel so=
urces
> now contain a symlink that is currently broken. But I'm arguing that it's=
 not
> kernel's fault, as having symlinks pointing nowhere in package sources sh=
ould be
> allowed. In other words, symlinks in patches/ directory is a special case=
 and
> handling them by dereferencing should not extend on the rest of the sourc=
es.
>=20
> So, I'm thinking on possible ways to solve this - either patch the framew=
ork to
> copy patches instead of symlinking them or prep the patches/ directory be=
fore
> tarring up the sources for the sourceipk case...
[Franklin] I didn't notice before but sourceipk copies the sources in a com=
pletely different directory before the tar command is ran. So how about sim=
ply searching for broken symlink and then deleting them. Afterwards the tar=
 command can run as is.
>=20
> --
> Denys
>=20
>=20
> > >> > On Sep 20, 2013, at 2:00 PM, "Denys Dmytriyenko"
> > ><denis@denix.org> wrote:
> > >> >
> > >> > > From: Denys Dmytriyenko <denys@ti.com>
> > >> > >
> > >> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > >> > > ---
> > >> > > meta-arago-distro/classes/sourceipk.bbclass | 2 +-
> > >> > > 1 file changed, 1 insertion(+), 1 deletion(-)
> > >> > >
> > >> > > diff --git a/meta-arago-distro/classes/sourceipk.bbclass
> > >b/meta-arago-
> > >> > distro/classes/sourceipk.bbclass
> > >> > > index 1ea0577..777cb4f 100644
> > >> > > --- a/meta-arago-distro/classes/sourceipk.bbclass
> > >> > > +++ b/meta-arago-distro/classes/sourceipk.bbclass
> > >> > > @@ -167,7 +167,7 @@ sourceipk_do_create_srcipk() {
> > >> > >         fi
> > >> > >
> > >> > >         #Write the data tarball
> > >> > > -        tar -C $tmp_dir --owner=3D0 --group=3D0 -chzf
> > >$srcipk_dir/data.tar.gz .
> > >> > > +        tar -C $tmp_dir --owner=3D0 --group=3D0 -czf
> > >$srcipk_dir/data.tar.gz .
> > >> > >
> > >> > >         # Create the debian-binary file
> > >> > >         echo "2.0" > $srcipk_dir/debian-binary
> > >> > > --
> > >> > > 1.8.3.2
> > >> > >
> > >> > > _______________________________________________
> > >> > > meta-arago mailing list
> > >> > > meta-arago@arago-project.org
> > >> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > >> > _______________________________________________
> > >> > meta-arago mailing list
> > >> > meta-arago@arago-project.org
> > >> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > >> _______________________________________________
> > >> meta-arago mailing list
> > >> meta-arago@arago-project.org
> > >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

