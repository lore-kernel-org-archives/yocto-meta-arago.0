Return-Path: <h-gou@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id D66A8529AC
	for <meta-arago@arago-project.org>;
	Tue, 20 Nov 2018 21:52:01 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wAKLpp4V036856
	for <meta-arago@arago-project.org>; Tue, 20 Nov 2018 15:51:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1542750711;
	bh=uOmvRYtLPy61sGGupNc7MvCNBAcUn3evCmbyNpbzZvo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=YvEXSjE4pXaIPA82Je/WSVZStD22kSihNnUNhfG9XaghBssuJ2i1MbtgzxbkdZnHX
	RJMdmfHqJn6gc+OS7Lzu0fcU8Uu/1y1oMeBN9xtTxM5aCrh8NRTPktnFXaSbrnjBY5
	7HyDHZwEEMeRpKQGZmVlTeYb6EbcUCz40/8zay1E=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wAKLppGb022834
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 20 Nov 2018 15:51:51 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 20 Nov 2018 15:51:51 -0600
Received: from DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f]) by
	DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f%18]) with mapi id
	15.01.1591.008; Tue, 20 Nov 2018 15:51:51 -0600
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [rocko/master] [PATCH] matrix-gui: replace SysVinit
	with systemd service
Thread-Index: AQHUgRn4lpWJ/WRzakSxbhcJFnTfUqVZMyUA
Date: Tue, 20 Nov 2018 21:51:51 +0000
Message-ID: <d236ecaafc0d409185072a38c20ee8c0@ti.com>
References: <1542749635-31317-1-git-send-email-a0271529@ti.com>
	<20181120214244.GD2540@beryl>
In-Reply-To: <20181120214244.GD2540@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.79]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [rocko/master] [PATCH] matrix-gui: replace SysVinit with systemd service
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
X-List-Received-Date: Tue, 20 Nov 2018 21:52:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Tuesday, November 20, 2018 4:43 PM
> To: Gou, Hongmei
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [rocko/master] [PATCH] matrix-gui: replace
> SysVinit with systemd service
>=20
> On Tue, Nov 20, 2018 at 04:33:55PM -0500, Hongmei Gou wrote:
> > Signed-off-by: Hongmei Gou <a0271529@ti.com>
> > ---
> >  .../recipes-core/matrix/matrix-gui/matrix-gui-2.0.service | 10 +++++++=
+++
> >  meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb   | 15
> +++++++++------
> >  2 files changed, 19 insertions(+), 6 deletions(-)
> >  create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-
> gui/matrix-gui-2.0.service
> >
> > diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/matrix-gu=
i-
> 2.0.service b/meta-arago-extras/recipes-core/matrix/matrix-gui/matrix-gui=
-
> 2.0.service
> > new file mode 100644
> > index 0000000..3ce1024
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/matrix-gui-
> 2.0.service
> > @@ -0,0 +1,10 @@
> > +[Unit]
> > +Description=3DMatrix GUI
> > +After=3Dweston.service
> > +
> > +[Service]
> > +Type=3Dforking
> > +ExecStart=3D/etc/init.d/matrix-gui-2.0 start
>=20
> Looks like it's still calling a legacy initscript - any particular reason=
?

Yes, we would like to keep the original scripts, as they are also used for =
stopping/starting matrix GUI when running GUI based demos (/usr/share/matri=
x-gui-2.0/execute_command.sh):

if [ $program_type =3D=3D gui ]
then
  /etc/init.d/matrix-gui-2.0 stop
..

if [ $program_type =3D=3D gui ]
then
...
  /etc/init.d/matrix-gui-2.0 start
fi

>=20
>=20
> > +
> > +[Install]
> > +WantedBy=3Dmulti-user.target
> > diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> > index d8aa00b..c79f13e 100644
> > --- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> > +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> > @@ -6,14 +6,13 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Da886c9ef769b2d8271115d2502512e5d"
> >
> >  SECTION =3D "multimedia"
> >
> > -PR =3D "r35"
> > +PR =3D "r36"
> >
> > -INITSCRIPT_NAME =3D "matrix-gui-2.0"
> > -INITSCRIPT_PARAMS =3D "defaults 97"
> > +SYSTEMD_SERVICE_${PN} =3D "matrix-gui-2.0.service"
> >
> >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >
> > -inherit update-rc.d
> > +inherit systemd
> >
> >  BRANCH ?=3D "master"
> >  SRCREV =3D "9a2d12590102fefc5c29fc9e8d346ce6b0198468"
> > @@ -23,6 +22,7 @@ MATRIX_INITSCRIPT =3D
> "${@base_conditional('QT_PROVIDER', 'qt5', bb.utils.contains
> >  SRC_URI =3D "git://git.ti.com/matrix-gui-v2/matrix-gui-
> v2.git;protocol=3Dgit;branch=3D${BRANCH} \
> >             file://${MATRIX_INITSCRIPT} \
> >             file://php.ini \
> > +           file://matrix-gui-2.0.service \
> >             ${@base_conditional('QT_PROVIDER', 'qt5',
> bb.utils.contains('DISTRO_FEATURES', 'wayland', '', 'file://0001-
> execute_command-Stop-matrix-when-running-a-GUI-demo.patch', d), '', d)}
> \
> >             ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'file://=
0001-
> execute_command-workaround-for-GUI-apps-with-weston.patch', '', d)} \
> >  "
> > @@ -46,10 +46,13 @@ do_install(){
> >  	sed -i -e "s/__MATRIX_FLAGS__/\"${MATRIX_FLAGS}\"/"
> ${WORKDIR}/${MATRIX_INITSCRIPT}
> >  	sed -i -e
> "s/__SWITCH_FOREGROUND_VT__/${SWITCH_FOREGROUND_VT}/"
> ${WORKDIR}/${MATRIX_INITSCRIPT}
> >
> > -	# Install the init script
> > -	# TODO: replace init script with systemd files
> > +	# Install the script
> >  	install -d ${D}${sysconfdir}/init.d
> >  	install -m 0755 ${WORKDIR}/${MATRIX_INITSCRIPT}
> ${D}${sysconfdir}/init.d/matrix-gui-2.0
> > +
> > +	# Install the systemd unit file
> > +	install -d ${D}${systemd_system_unitdir}
> > +	install -m 0644 ${WORKDIR}/matrix-gui-2.0.service
> ${D}${systemd_system_unitdir}
> >  }
> >
> >  GUIDEPS =3D "matrix-gui-browser refresh-screen"
> > --
> > 1.9.1
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

