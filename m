Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id EEAC4529CE
	for <meta-arago@arago-project.org>;
	Wed, 15 Aug 2012 20:02:42 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7FK2fbv021901;
	Wed, 15 Aug 2012 15:02:41 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7FK2etW028571;
	Wed, 15 Aug 2012 15:02:40 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Wed, 15 Aug 2012 15:02:40 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "Cooper Jr., Franklin"
	<fcooper@ti.com>
Thread-Topic: [meta-arago] [PATCH] meta-arago-upstream: Create new upstream
	layer
Thread-Index: AQHNex1HyUU6+pU1Wkec6duX7EOOqZdbSkbQ
Date: Wed, 15 Aug 2012 20:02:40 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159198DF3@DLEE12.ent.ti.com>
References: <1344888323-30885-1-git-send-email-fcooper@ti.com>
	<20120815193608.GB7503@denix.org>
In-Reply-To: <20120815193608.GB7503@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] meta-arago-upstream: Create new upstream	layer
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
X-List-Received-Date: Wed, 15 Aug 2012 20:02:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

Thinking back on this I think the alignment we reached as that we would try=
 to bbappend everything since we will know when those break when we move to=
 the next layer.  We would only create another layer in the case that there=
 were recipes we were unable to bbappend.

That being said in the case of this psplash which is an _git recipe is ther=
e a good way to force the breakage since as long as the recipe is _git the =
append will keep applying, even in the case where we have updated.  In that=
 case our append could end up holding psplash back to an older revision for=
 no reason.

Could we perhaps us the PV value in the recipe of 0.1+git${SRCPV} in the bb=
append to force the append to that specific version and therefore break on =
an upgrade?

Sincerely,
Chase Maupin
Software Applications
ARM MPU
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/=20


> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Wednesday, August 15, 2012 2:36 PM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] meta-arago-upstream: Create new
> upstream layer
>=20
> On Mon, Aug 13, 2012 at 03:05:23PM -0500, Franklin S Cooper Jr
> wrote:
> > * This patch creates a new layer called meta-arago-upstream.
> The purpose
> >   of this layer is store needed changes that were pulled from
> the applicable
> >   master branch but can't be pulled into the corresponding
> maintenance branch.
> > * Once meta-arago tracks a new maintenance branch, the contents
> of this layer
> >   should be cleared since all the changes pulled into this
> layer should be
> >   located in the new maintenance branch.
>=20
> I'm thinking creating a separate layer for tracking changes might
> be an
> overkill... Can we put the psplash fix in the meta-arago-
> distro/master for
> now? Let's see how many of those we would need - so far there's
> only couple of
> such bbappends or changes that are already in oe-core/master, but
> needed for
> denzil. If the number starts growing rapidly, we'll look into a
> separate
> "next" branch or even a layer...
>=20
> Denys
>=20
>=20
> > Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
> > ---
> >  meta-arago-upstream/COPYING.MIT     |   17 +++++++++++++++++
> >  meta-arago-upstream/README          |   26
> ++++++++++++++++++++++++++
> >  meta-arago-upstream/conf/layer.conf |    9 +++++++++
> >  3 files changed, 52 insertions(+), 0 deletions(-)
> >  create mode 100644 meta-arago-upstream/COPYING.MIT
> >  create mode 100644 meta-arago-upstream/README
> >  create mode 100644 meta-arago-upstream/conf/layer.conf
> >
> > diff --git a/meta-arago-upstream/COPYING.MIT b/meta-arago-
> upstream/COPYING.MIT
> > new file mode 100644
> > index 0000000..fb950dc
> > --- /dev/null
> > +++ b/meta-arago-upstream/COPYING.MIT
> > @@ -0,0 +1,17 @@
> > +Permission is hereby granted, free of charge, to any person
> obtaining a copy
> > +of this software and associated documentation files (the
> "Software"), to deal
> > +in the Software without restriction, including without
> limitation the rights
> > +to use, copy, modify, merge, publish, distribute, sublicense,
> and/or sell
> > +copies of the Software, and to permit persons to whom the
> Software is
> > +furnished to do so, subject to the following conditions:
> > +
> > +The above copyright notice and this permission notice shall be
> included in
> > +all copies or substantial portions of the Software.
> > +
> > +THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
> KIND, EXPRESS OR
> > +IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> > +FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
> EVENT SHALL THE
> > +AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES
> OR OTHER
> > +LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> OTHERWISE, ARISING FROM,
> > +OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> DEALINGS IN
> > +THE SOFTWARE.
> > diff --git a/meta-arago-upstream/README b/meta-arago-
> upstream/README
> > new file mode 100644
> > index 0000000..38416f8
> > --- /dev/null
> > +++ b/meta-arago-upstream/README
> > @@ -0,0 +1,26 @@
> > +meta-arago-upstream provides a place to store changes that
> were upstreamed but aren't
> > +currently located in the applicable maintenance branch.
> > +
> > +Once meta-arago tracks a new maintenance branch, the contents
> of this layer should be
> > +cleared since all the changes pulled into this layer should be
> located in the new
> > +maintenance branch.
> > +
> > +This layer works with the latest Yocto Project release
> (currently 1.2) and tracks
> > +the stable/maintenance branches (currently "denzil") of the
> corresponding layers:
> > +
> > +URI: git://git.openembedded.org/openembedded-core
> > +branch: denzil
> > +revision: HEAD
> > +
> > +URI: git://git.openembedded.org/meta-openembedded
> > +branch: denzil
> > +revision: HEAD
> > +
> > +URI: git://arago-project.org/git/meta-ti
> > +branch: denzil
> > +revision: HEAD
> > +
> > +Send pull requests to meta-arago@arago-project.org
> > +
> > +Layer maintainers: Chase Maupin <chase.maupin@ti.com>
> > +                   Denys Dmytriyenko <denys@ti.com>
> > diff --git a/meta-arago-upstream/conf/layer.conf b/meta-arago-
> upstream/conf/layer.conf
> > new file mode 100644
> > index 0000000..87b6c8c
> > --- /dev/null
> > +++ b/meta-arago-upstream/conf/layer.conf
> > @@ -0,0 +1,9 @@
> > +# We have a conf and classes directory, append to BBPATH
> > +BBPATH .=3D ":${LAYERDIR}"
> > +
> > +# We have a recipes directory, add to BBFILES
> > +BBFILES +=3D "${LAYERDIR}/recipes*/*/*.bb
> ${LAYERDIR}/recipes*/*/*.bbappend"
> > +
> > +BBFILE_COLLECTIONS +=3D "meta-arago-upstream"
> > +BBFILE_PATTERN_meta-arago-upstream :=3D "^${LAYERDIR}/"
> > +BBFILE_PRIORITY_meta-arago-upstream =3D "10"
> > --
> > 1.7.7
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

