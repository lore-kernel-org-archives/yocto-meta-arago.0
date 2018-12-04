Return-Path: <h-gou@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 6BB3952092
	for <meta-arago@arago-project.org>;
	Tue,  4 Dec 2018 20:22:44 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id wB4KMXHL016651
	for <meta-arago@arago-project.org>; Tue, 4 Dec 2018 14:22:33 -0600
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wB4KMXap011704
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 4 Dec 2018 14:22:33 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 4 Dec 2018 14:22:33 -0600
Received: from DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f]) by
	DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f%18]) with mapi id
	15.01.1591.008; Tue, 4 Dec 2018 14:22:33 -0600
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [rocko/master] [PATCH] matrix-gui: update
	matrix-gui-2.0.service
Thread-Index: AQHUjAqeFdbqUIMrFk+OHDKqdBt4Q6VvBcHA
Date: Tue, 4 Dec 2018 20:22:33 +0000
Message-ID: <171ec74c0dc14a2fb98b074c645adbed@ti.com>
References: <1543952138-1375-1-git-send-email-a0271529@ti.com>
	<20181204195032.GP6887@beryl>
In-Reply-To: <20181204195032.GP6887@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.79]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [rocko/master] [PATCH] matrix-gui: update matrix-gui-2.0.service
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
X-List-Received-Date: Tue, 04 Dec 2018 20:22:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Tuesday, December 04, 2018 2:51 PM
> To: Gou, Hongmei
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [rocko/master] [PATCH] matrix-gui: update matri=
x-
> gui-2.0.service
>=20
> On Tue, Dec 04, 2018 at 02:35:38PM -0500, Hongmei Gou wrote:
> > * Add "Requires=3Dweston.service" to make matrix-gui start only after
> >   weston has successfully started
> >
> > * Match matrix-gui-2.0.service with SysVinit auto-generated service
> >   to ensure reliable matrxi-gui startup from booting
> >
> > Signed-off-by: Hongmei Gou <a0271529@ti.com>
> > ---
> >  .../recipes-core/matrix/matrix-gui/matrix-gui-2.0.service        | 9
> +++++++++
> >  meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb          | 2 +=
-
> >  2 files changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/matrix-gu=
i-
> 2.0.service b/meta-arago-extras/recipes-core/matrix/matrix-gui/matrix-gui=
-
> 2.0.service
> > index 3ce1024..cd87d8b 100644
> > --- a/meta-arago-extras/recipes-core/matrix/matrix-gui/matrix-gui-
> 2.0.service
> > +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/matrix-gui-
> 2.0.service
> > @@ -1,9 +1,18 @@
> >  [Unit]
> >  Description=3DMatrix GUI
> >  After=3Dweston.service
> > +Requires=3Dweston.service
> > +Before=3Dgraphical.target
>=20
> > +Before=3Dthermal-zone-init.service
>=20
> I don't believe this one should be added - there's no dependency between
> the
> two and thermal-zone-init may be gone in the future or on some platforms.

Yes, you are right. Will submit a V2 patch to remove this.=20

>=20
>=20
> >  [Service]
> >  Type=3Dforking
> > +Restart=3Dno
> > +TimeoutSec=3D5min
> > +IgnoreSIGPIPE=3Dno
> > +KillMode=3Dprocess
> > +GuessMainPID=3Dno
> > +RemainAfterExit=3Dyes
> >  ExecStart=3D/etc/init.d/matrix-gui-2.0 start
> >
> >  [Install]
> > diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> > index c79f13e..064e27d 100644
> > --- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> > +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> > @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Da886c9ef769b2d8271115d2502512e5d"
> >
> >  SECTION =3D "multimedia"
> >
> > -PR =3D "r36"
> > +PR =3D "r37"
> >
> >  SYSTEMD_SERVICE_${PN} =3D "matrix-gui-2.0.service"
> >
> > --
> > 1.9.1
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

