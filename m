Return-Path: <h-gou@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id CFF9D52A1C
	for <meta-arago@arago-project.org>;
	Tue, 20 Nov 2018 22:55:42 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wAKMtWRA053175
	for <meta-arago@arago-project.org>; Tue, 20 Nov 2018 16:55:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1542754532;
	bh=AW7WH52eLFnpz7upMX7/B4M8Bw6iZJILzZVeMkPwncI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=o7TfAiTsWoXE4sRvwkf6XC8bGGMdX4Fwvz/wM0a492fhAs0Iwyhytk4fHfSYSIauw
	So4rTXAJNqG1yxx49HCMQf/YsXN/7RARfYrp8IIal/VhPOZVtbhgLo6NV7qNQvp/Y0
	72IRy5ANhvU0VEFveQvJ0v+xx9Y/I0lzi/jXHfDk=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wAKMtWZj074680
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 20 Nov 2018 16:55:32 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 20 Nov 2018 16:55:32 -0600
Received: from DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f]) by
	DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f%18]) with mapi id
	15.01.1591.008; Tue, 20 Nov 2018 16:55:32 -0600
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [EXTERNAL] Re: [meta-arago] [rocko/master] [PATCH] matrix-gui:
	replace SysVinit with systemd service
Thread-Index: AQHUgRn4lpWJ/WRzakSxbhcJFnTfUqVZMyUAgABmWQD//5zRAIAAb0yA//+b06CAAGk5YA==
Date: Tue, 20 Nov 2018 22:55:32 +0000
Message-ID: <062feefa4fb345a4b9f059dc8781acbf@ti.com>
References: <1542749635-31317-1-git-send-email-a0271529@ti.com>
	<20181120214244.GD2540@beryl> <d236ecaafc0d409185072a38c20ee8c0@ti.com>
	<20181120215406.GE2540@beryl> <f32510a41e06400882142cc05f5b66ba@ti.com>
	<20181120223727.GF2540@beryl> <4a62881a41d442bea334eccb95078a2d@ti.com>
In-Reply-To: <4a62881a41d442bea334eccb95078a2d@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.79]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [EXTERNAL] Re: [rocko/master] [PATCH] matrix-gui: replace SysVinit with systemd service
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
X-List-Received-Date: Tue, 20 Nov 2018 22:55:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Gou, Hongmei
> Sent: Tuesday, November 20, 2018 5:43 PM
> To: Dmytriyenko, Denys
> Cc: meta-arago@arago-project.org
> Subject: [EXTERNAL] Re: [meta-arago] [rocko/master] [PATCH] matrix-gui:
> replace SysVinit with systemd service
>=20
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Tuesday, November 20, 2018 5:37 PM
> > To: Gou, Hongmei
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [rocko/master] [PATCH] matrix-gui: replace
> > SysVinit with systemd service
> >
> > On Tue, Nov 20, 2018 at 05:12:52PM -0500, Gou, Hongmei wrote:
> > > > -----Original Message-----
> > > > From: Dmytriyenko, Denys
> > > > Sent: Tuesday, November 20, 2018 4:54 PM
> > > > To: Gou, Hongmei
> > > > Cc: meta-arago@arago-project.org
> > > > Subject: Re: [meta-arago] [rocko/master] [PATCH] matrix-gui: replac=
e
> > > > SysVinit with systemd service
> > > >
> > > > On Tue, Nov 20, 2018 at 04:51:51PM -0500, Gou, Hongmei wrote:
> > > > > > -----Original Message-----
> > > > > > From: Dmytriyenko, Denys
> > > > > > Sent: Tuesday, November 20, 2018 4:43 PM
> > > > > > To: Gou, Hongmei
> > > > > > Cc: meta-arago@arago-project.org
> > > > > > Subject: Re: [meta-arago] [rocko/master] [PATCH] matrix-gui:
> replace
> > > > > > SysVinit with systemd service
> > > > > >
> > > > > > On Tue, Nov 20, 2018 at 04:33:55PM -0500, Hongmei Gou wrote:
> > > > > > > Signed-off-by: Hongmei Gou <a0271529@ti.com>
> > > > > > > ---
> > > > > > >  .../recipes-core/matrix/matrix-gui/matrix-gui-2.0.service | =
10
> > > > ++++++++++
> > > > > > >  meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb   | =
15
> > > > > > +++++++++------
> > > > > > >  2 files changed, 19 insertions(+), 6 deletions(-)
> > > > > > >  create mode 100644 meta-arago-extras/recipes-
> > core/matrix/matrix-
> > > > > > gui/matrix-gui-2.0.service
> > > > > > >
> > > > > > > diff --git a/meta-arago-extras/recipes-core/matrix/matrix-
> > gui/matrix-
> > > > gui-
> > > > > > 2.0.service b/meta-arago-extras/recipes-core/matrix/matrix-
> > gui/matrix-
> > > > gui-
> > > > > > 2.0.service
> > > > > > > new file mode 100644
> > > > > > > index 0000000..3ce1024
> > > > > > > --- /dev/null
> > > > > > > +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/matrix=
-
> > gui-
> > > > > > 2.0.service
> > > > > > > @@ -0,0 +1,10 @@
> > > > > > > +[Unit]
> > > > > > > +Description=3DMatrix GUI
> > > > > > > +After=3Dweston.service
> > > > > > > +
> > > > > > > +[Service]
> > > > > > > +Type=3Dforking
> > > > > > > +ExecStart=3D/etc/init.d/matrix-gui-2.0 start
> > > > > >
> > > > > > Looks like it's still calling a legacy initscript - any particu=
lar reason?
> > > > >
> > > > > Yes, we would like to keep the original scripts, as they are also=
 used
> for
> > > > stopping/starting matrix GUI when running GUI based demos
> > > > (/usr/share/matrix-gui-2.0/execute_command.sh):
> > > > >
> > > > > if [ $program_type =3D=3D gui ]
> > > > > then
> > > > >   /etc/init.d/matrix-gui-2.0 stop
> > > > > ..
> > > > >
> > > > > if [ $program_type =3D=3D gui ]
> > > > > then
> > > > > ...
> > > > >   /etc/init.d/matrix-gui-2.0 start
> > > > > fi
> > > >
> > > > Any plans to completely moving to systemd and calling systemctl
> > start/stop?
> > >
> > > With the current patch, "systemctl start/stop matrix-gui-2.0 " can
> > > start/stop matrix successfully.
> > > execute_command.sh can be updated to use systemctl start/stop.
> > >
> > > As for /etc/init.d/matrix-gui-2.0 (attached), I am not seeing anythin=
g
> > > specific to init.
> > > We can install it to /usr/bin instead of /etc/init.d, and then modify=
 the
> > > path in matrix-gui-2.0.service, if this is preferable.
> >
> > If you keep it in /etc/initd.d, wouldn't systemd try to automatically c=
onvert
> > it and potentially conflict with your own native unit file?
>=20
> systemd is not doing the conversion automatically.

Please note that /etc/rc5.d no longer has "S97matrix-gui-2.0 -> ../init.d/m=
atrix-gui-2.0" with the current patch.
If I understand it correctly, no automatic conversion is done for matrix-gu=
i-2.0 because of this.

>=20
> Output of "systemctl cat matrix-gui-2.0.service" with the current patch:
> [[0;1;34m# /lib/systemd/system/matrix-gui-2.0.service[[0m
> [Unit]
> Description=3DMatrix GUI
> After=3Dweston.service
>=20
> [Service]
> Type=3Dforking
> ExecStart=3D/etc/init.d/matrix-gui-2.0 start
>=20
> [Install]
> WantedBy=3Dmulti-user.target
>=20
> Output of "systemctl cat matrix-gui-2.0.service" before the patch:
> [[0;1;34m# /run/systemd/generator.late/matrix-gui-2.0.service[[0m
> # Automatically generated by systemd-sysv-generator
>=20
> [Unit]
> Documentation=3Dman:systemd-sysv-generator(8)
> SourcePath=3D/etc/init.d/matrix-gui-2.0
> Before=3Dmulti-user.target
> Before=3Dmulti-user.target
> Before=3Dmulti-user.target
> Before=3Dthermal-zone-init.service
> After=3Dthttpd.service
> After=3Dumountnfs.service
> After=3Drng-tools.service
> After=3Dredis-server.service
> After=3Ddropbear.service
> After=3Dtelnetd.service
> After=3Dgdbserverproxy.service
> After=3Dweston.service
> After=3Drc.pvr.service
> After=3Duim-sysfs.service
>=20
>=20
> [Service]
> Type=3Dforking
> Restart=3Dno
> TimeoutSec=3D5min
> IgnoreSIGPIPE=3Dno
> KillMode=3Dprocess
> GuessMainPID=3Dno
> RemainAfterExit=3Dyes
> ExecStart=3D/etc/init.d/matrix-gui-2.0 start
> ExecStop=3D/etc/init.d/matrix-gui-2.0 stop
>=20
> >
> >
> > > > > > > +
> > > > > > > +[Install]
> > > > > > > +WantedBy=3Dmulti-user.target
> > > > > > > diff --git a/meta-arago-extras/recipes-core/matrix/matrix-
> > gui_2.0.bb
> > > > > > b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> > > > > > > index d8aa00b..c79f13e 100644
> > > > > > > --- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> > > > > > > +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> > > > > > > @@ -6,14 +6,13 @@ LIC_FILES_CHKSUM =3D
> > > > > > "file://LICENSE;md5=3Da886c9ef769b2d8271115d2502512e5d"
> > > > > > >
> > > > > > >  SECTION =3D "multimedia"
> > > > > > >
> > > > > > > -PR =3D "r35"
> > > > > > > +PR =3D "r36"
> > > > > > >
> > > > > > > -INITSCRIPT_NAME =3D "matrix-gui-2.0"
> > > > > > > -INITSCRIPT_PARAMS =3D "defaults 97"
> > > > > > > +SYSTEMD_SERVICE_${PN} =3D "matrix-gui-2.0.service"
> > > > > > >
> > > > > > >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > > > > > >
> > > > > > > -inherit update-rc.d
> > > > > > > +inherit systemd
> > > > > > >
> > > > > > >  BRANCH ?=3D "master"
> > > > > > >  SRCREV =3D "9a2d12590102fefc5c29fc9e8d346ce6b0198468"
> > > > > > > @@ -23,6 +22,7 @@ MATRIX_INITSCRIPT =3D
> > > > > > "${@base_conditional('QT_PROVIDER', 'qt5', bb.utils.contains
> > > > > > >  SRC_URI =3D "git://git.ti.com/matrix-gui-v2/matrix-gui-
> > > > > > v2.git;protocol=3Dgit;branch=3D${BRANCH} \
> > > > > > >             file://${MATRIX_INITSCRIPT} \
> > > > > > >             file://php.ini \
> > > > > > > +           file://matrix-gui-2.0.service \
> > > > > > >             ${@base_conditional('QT_PROVIDER', 'qt5',
> > > > > > bb.utils.contains('DISTRO_FEATURES', 'wayland', '', 'file://000=
1-
> > > > > > execute_command-Stop-matrix-when-running-a-GUI-demo.patch',
> > d), '',
> > > > d)}
> > > > > > \
> > > > > > >             ${@bb.utils.contains('DISTRO_FEATURES', 'wayland'=
,
> > 'file://0001-
> > > > > > execute_command-workaround-for-GUI-apps-with-weston.patch',
> '',
> > d)}
> > > > \
> > > > > > >  "
> > > > > > > @@ -46,10 +46,13 @@ do_install(){
> > > > > > >  	sed -i -e "s/__MATRIX_FLAGS__/\"${MATRIX_FLAGS}\"/"
> > > > > > ${WORKDIR}/${MATRIX_INITSCRIPT}
> > > > > > >  	sed -i -e
> > > > > >
> "s/__SWITCH_FOREGROUND_VT__/${SWITCH_FOREGROUND_VT}/"
> > > > > > ${WORKDIR}/${MATRIX_INITSCRIPT}
> > > > > > >
> > > > > > > -	# Install the init script
> > > > > > > -	# TODO: replace init script with systemd files
> > > > > > > +	# Install the script
> > > > > > >  	install -d ${D}${sysconfdir}/init.d
> > > > > > >  	install -m 0755 ${WORKDIR}/${MATRIX_INITSCRIPT}
> > > > > > ${D}${sysconfdir}/init.d/matrix-gui-2.0
> > > > > > > +
> > > > > > > +	# Install the systemd unit file
> > > > > > > +	install -d ${D}${systemd_system_unitdir}
> > > > > > > +	install -m 0644 ${WORKDIR}/matrix-gui-2.0.service
> > > > > > ${D}${systemd_system_unitdir}
> > > > > > >  }
> > > > > > >
> > > > > > >  GUIDEPS =3D "matrix-gui-browser refresh-screen"
> > > > > > > --
> > > > > > > 1.9.1
> > > > > > >
> > > > > > > _______________________________________________
> > > > > > > meta-arago mailing list
> > > > > > > meta-arago@arago-project.org
> > > > > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

