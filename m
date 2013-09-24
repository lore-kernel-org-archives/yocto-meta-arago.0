Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 58728529A8
	for <meta-arago@arago-project.org>;
	Tue, 24 Sep 2013 00:49:12 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8O0nBu3025703
	for <meta-arago@arago-project.org>; Mon, 23 Sep 2013 19:49:11 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8O0nBMb001088
	for <meta-arago@arago-project.org>; Mon, 23 Sep 2013 19:49:11 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Mon, 23 Sep 2013 19:49:11 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] sourceipk.bbclass: Dereference sym links
	located in patches directory
Thread-Index: AQHOuL4+zmZBSDRfFkyMPStMXIlJ/ZnUYAOA//+sY1A=
Date: Tue, 24 Sep 2013 00:49:10 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C55B6D5@DFLE08.ent.ti.com>
References: <1379985594-25515-1-git-send-email-fcooper@ti.com>
	<20130924004143.GA4390@edge>
In-Reply-To: <20130924004143.GA4390@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] sourceipk.bbclass: Dereference sym links located in patches directory
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
X-List-Received-Date: Tue, 24 Sep 2013 00:49:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, September 23, 2013 7:42 PM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] sourceipk.bbclass: Dereference sym link=
s
> located in patches directory
>=20
> Heh, just sent out my updated patch and noticed you had one as well... An=
d
> they are so similar! I'm just wondering why you spent time on it, when I =
said I'll
> fix it?
[Franklin]  Lol yeah. Must of overlooked the part where you said you were g=
oing to fix it and I needed it for my SDK build I want to start tomorrow mo=
rning.=20
>=20
> --
> Denys
>=20
>=20
> On Mon, Sep 23, 2013 at 08:19:54PM -0500, Franklin S. Cooper Jr wrote:
> > * Latest kernel sources included symbolic links that were broken and ca=
used
> the
> >   tar command to fail.
> > * In certain circumstances broken symbolic links are valid and should b=
e
> >   packaged up.
> > * However, any patch located in the "patches" directory should be
> dereference
> > * since the original file is located in the recipe's WORKDIR.
> > * Therefore, the sym link will be broken when accessed on a different
> computer.
> > * By using the dereference option with the cp command the patches direc=
tory
> can
> >   be dereferenced.
> >
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  meta-arago-distro/classes/sourceipk.bbclass |   12 +++++++++++-
> >  1 files changed, 11 insertions(+), 1 deletions(-)
> >
> > diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-arago-
> distro/classes/sourceipk.bbclass
> > index 1ea0577..3086670 100644
> > --- a/meta-arago-distro/classes/sourceipk.bbclass
> > +++ b/meta-arago-distro/classes/sourceipk.bbclass
> > @@ -166,8 +166,18 @@ sourceipk_do_create_srcipk() {
> >              cp ${FILE} $tmp_dir/${SRCIPK_INSTALL_DIR}/
> >          fi
> >
> > +        # Dereference symbolic links to patches that are stored in pat=
ches
> directory
> > +        if [ -d "$tmp_dir/${SRCIPK_INSTALL_DIR}/patches" ]
> > +        then
> > +
> > +            mv $tmp_dir/${SRCIPK_INSTALL_DIR}/patches
> $tmp_dir/${SRCIPK_INSTALL_DIR}/patches_bak
> > +            cp -rL $tmp_dir/${SRCIPK_INSTALL_DIR}/patches_bak
> $tmp_dir/${SRCIPK_INSTALL_DIR}/patches
> > +            rm -rf $tmp_dir/${SRCIPK_INSTALL_DIR}/patches_bak
> > +        fi
> > +
> > +
> >          #Write the data tarball
> > -        tar -C $tmp_dir --owner=3D0 --group=3D0 -chzf $srcipk_dir/data=
.tar.gz .
> > +        tar -C $tmp_dir --owner=3D0 --group=3D0 -czf $srcipk_dir/data.=
tar.gz .
> >
> >          # Create the debian-binary file
> >          echo "2.0" > $srcipk_dir/debian-binary
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

