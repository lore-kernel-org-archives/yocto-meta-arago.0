Return-Path: <h-gou@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 4DFA15296D
	for <meta-arago@arago-project.org>;
	Tue, 28 Mar 2017 19:09:43 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2SJ9Xa2027843
	for <meta-arago@arago-project.org>; Tue, 28 Mar 2017 14:09:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1490728173;
	bh=YkstssJ+HmLEYWTHgal7MTpMvefQecVBcu6Qp/0CdPI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=eNcDKPXgb1rr/5wiIIfTenX9v5gfT84B2hTfqTsYe4kduTHOLO5w8VUlw5cjqjF7D
	GLHrC8IkKGFJlE6oz+mXRNj7vYr/alT7L0ox2Wl1BsL7zT07b6Sz6cvy2PAgVK5rKh
	tc8ILDUK4kX8iLuXy44TN/p5Zo/rJhZAmxXY3EEw=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2SJ9SlR003967
	for <meta-arago@arago-project.org>; Tue, 28 Mar 2017 14:09:28 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0294.000; Tue, 28 Mar 2017 14:09:27 -0500
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [morty/krogoth][PATCH v2] opencv: bump SRCREV to
	pick up enhancement and bug fix
Thread-Index: AQHSpy1K8qFUjksVW0GzHfGQqyqvnqGqnvYA
Date: Tue, 28 Mar 2017 19:09:26 +0000
Message-ID: <2E957F12D11D904590FA9AF86D366BD926D00098@DLEE08.ent.ti.com>
References: <1490640205-1304-1-git-send-email-h-gou@ti.com>
	<20170327190649.GF29187@edge>
In-Reply-To: <20170327190649.GF29187@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Senicic,
	Djordje" <d-senicic1@ti.com>
Subject: Re: [morty/krogoth][PATCH v2] opencv: bump SRCREV to pick up enhancement and bug fix
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
X-List-Received-Date: Tue, 28 Mar 2017 19:09:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Denys,

It looks like this patch has been committed in morty-next. Can you please c=
ommit it to krogoth also?

Thanks,
Hongmei

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, March 27, 2017 3:07 PM
> To: Gou, Hongmei
> Cc: meta-arago@arago-project.org; Senicic, Djordje
> Subject: Re: [meta-arago] [morty/krogoth][PATCH v2] opencv: bump SRCREV
> to pick up enhancement and bug fix
>=20
> Thanks for sending v2 - merging it now.
>=20
>=20
> On Mon, Mar 27, 2017 at 02:43:25PM -0400, Hongmei Gou wrote:
> > * Two more kernels are added for OpenCL DSP offload: minmax and
> absdiff
> >
> > * Change priority of gstreamer videoconvert plugin so that it can be
> >   selected over autovideoconvert. This is to address the decoding
> >   issue with test clip 768x576.avi.
> >
> > Signed-off-by: Djordje Senicic <d-senicic1@ti.com>
> > Signed-off-by: Hongmei Gou <h-gou@ti.com>
> > ---
> > V2 changes:
> > * Update commit message to describe the changes picked up by the new
> commit id
> >
> >  meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-arago-distro/recipes-
> support/opencv/opencv_3.1.bbappend b/meta-arago-distro/recipes-
> support/opencv/opencv_3.1.bbappend
> > index eea040f..bcfd8dd 100644
> > --- a/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
> > +++ b/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
> > @@ -1,4 +1,4 @@
> > -PR =3D "r2"
> > +PR =3D "r3"
> >
> >  BRANCH =3D "tiopencvrelease_3.1"
> >
> > @@ -11,7 +11,7 @@ SRC_URI_append +=3D "\
> >       file://setupEnv.sh \
> >  "
> >
> > -SRCREV_opencv =3D "b4f54ac48ced0ade8223eafab9cd3ad6dbb1b515"
> > +SRCREV_opencv =3D "ffb1eb48afbb1888670f461135c023dcdb6c9aca"
> >
> >  DEPENDS_remove_keystone =3D "qtbase"
> >
> > --
> > 1.9.1
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

