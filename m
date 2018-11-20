Return-Path: <h-gou@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 3A0AA5297E
	for <meta-arago@arago-project.org>;
	Tue, 20 Nov 2018 22:13:03 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wAKMCqlM095090
	for <meta-arago@arago-project.org>; Tue, 20 Nov 2018 16:12:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1542751972;
	bh=SYiNkHAdwypDVtomu1vnzoOfm+OZIg4ZUFofhKQSwQc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=En1rTrf4dAdrnOanvIoNE+hI88uxhvD4hKo94SXFPA5MyPT+p7VmufXOvnsy+R92H
	k4c4yJ5DixFb0DeM0Ss8GaDunTZ5wr9EGoYFbvE+K+R6VY07HZ/wUJnAJOKt73QGPg
	PyvMZSWaazcKhgnGVRkSigfH4yV5K/gJsWGkSO6Y=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wAKMCqkA079029
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 20 Nov 2018 16:12:52 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 20 Nov 2018 16:12:52 -0600
Received: from DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f]) by
	DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f%18]) with mapi id
	15.01.1591.008; Tue, 20 Nov 2018 16:12:52 -0600
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [rocko/master] [PATCH] matrix-gui: replace SysVinit
	with systemd service
Thread-Index: AQHUgRn4lpWJ/WRzakSxbhcJFnTfUqVZMyUAgABmWQD//5zRAA==
Date: Tue, 20 Nov 2018 22:12:52 +0000
Message-ID: <f32510a41e06400882142cc05f5b66ba@ti.com>
References: <1542749635-31317-1-git-send-email-a0271529@ti.com>
	<20181120214244.GD2540@beryl> <d236ecaafc0d409185072a38c20ee8c0@ti.com>
	<20181120215406.GE2540@beryl>
In-Reply-To: <20181120215406.GE2540@beryl>
Accept-Language: en-US
X-MS-Has-Attach: yes
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
X-List-Received-Date: Tue, 20 Nov 2018 22:13:03 -0000
X-Groupsio-MsgNum: 10938
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_f32510a41e06400882142cc05f5b66baticom_"

--_002_f32510a41e06400882142cc05f5b66baticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Tuesday, November 20, 2018 4:54 PM
> To: Gou, Hongmei
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [rocko/master] [PATCH] matrix-gui: replace
> SysVinit with systemd service
>=20
> On Tue, Nov 20, 2018 at 04:51:51PM -0500, Gou, Hongmei wrote:
> > > -----Original Message-----
> > > From: Dmytriyenko, Denys
> > > Sent: Tuesday, November 20, 2018 4:43 PM
> > > To: Gou, Hongmei
> > > Cc: meta-arago@arago-project.org
> > > Subject: Re: [meta-arago] [rocko/master] [PATCH] matrix-gui: replace
> > > SysVinit with systemd service
> > >
> > > On Tue, Nov 20, 2018 at 04:33:55PM -0500, Hongmei Gou wrote:
> > > > Signed-off-by: Hongmei Gou <a0271529@ti.com>
> > > > ---
> > > >  .../recipes-core/matrix/matrix-gui/matrix-gui-2.0.service | 10
> ++++++++++
> > > >  meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb   | 15
> > > +++++++++------
> > > >  2 files changed, 19 insertions(+), 6 deletions(-)
> > > >  create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-
> > > gui/matrix-gui-2.0.service
> > > >
> > > > diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/matri=
x-
> gui-
> > > 2.0.service b/meta-arago-extras/recipes-core/matrix/matrix-gui/matrix=
-
> gui-
> > > 2.0.service
> > > > new file mode 100644
> > > > index 0000000..3ce1024
> > > > --- /dev/null
> > > > +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/matrix-gui-
> > > 2.0.service
> > > > @@ -0,0 +1,10 @@
> > > > +[Unit]
> > > > +Description=3DMatrix GUI
> > > > +After=3Dweston.service
> > > > +
> > > > +[Service]
> > > > +Type=3Dforking
> > > > +ExecStart=3D/etc/init.d/matrix-gui-2.0 start
> > >
> > > Looks like it's still calling a legacy initscript - any particular re=
ason?
> >
> > Yes, we would like to keep the original scripts, as they are also used =
for
> stopping/starting matrix GUI when running GUI based demos
> (/usr/share/matrix-gui-2.0/execute_command.sh):
> >
> > if [ $program_type =3D=3D gui ]
> > then
> >   /etc/init.d/matrix-gui-2.0 stop
> > ..
> >
> > if [ $program_type =3D=3D gui ]
> > then
> > ...
> >   /etc/init.d/matrix-gui-2.0 start
> > fi
>=20
> Any plans to completely moving to systemd and calling systemctl start/sto=
p?

With the current patch, "systemctl start/stop matrix-gui-2.0 " can start/st=
op matrix successfully.=20
execute_command.sh can be updated to use systemctl start/stop.

As for /etc/init.d/matrix-gui-2.0 (attached), I am not seeing anything spec=
ific to init.=20
We can install it to /usr/bin instead of /etc/init.d, and then modify the p=
ath in matrix-gui-2.0.service, if this is preferable.=20

>=20
>=20
> > > > +
> > > > +[Install]
> > > > +WantedBy=3Dmulti-user.target
> > > > diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.b=
b
> > > b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> > > > index d8aa00b..c79f13e 100644
> > > > --- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> > > > +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> > > > @@ -6,14 +6,13 @@ LIC_FILES_CHKSUM =3D
> > > "file://LICENSE;md5=3Da886c9ef769b2d8271115d2502512e5d"
> > > >
> > > >  SECTION =3D "multimedia"
> > > >
> > > > -PR =3D "r35"
> > > > +PR =3D "r36"
> > > >
> > > > -INITSCRIPT_NAME =3D "matrix-gui-2.0"
> > > > -INITSCRIPT_PARAMS =3D "defaults 97"
> > > > +SYSTEMD_SERVICE_${PN} =3D "matrix-gui-2.0.service"
> > > >
> > > >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > > >
> > > > -inherit update-rc.d
> > > > +inherit systemd
> > > >
> > > >  BRANCH ?=3D "master"
> > > >  SRCREV =3D "9a2d12590102fefc5c29fc9e8d346ce6b0198468"
> > > > @@ -23,6 +22,7 @@ MATRIX_INITSCRIPT =3D
> > > "${@base_conditional('QT_PROVIDER', 'qt5', bb.utils.contains
> > > >  SRC_URI =3D "git://git.ti.com/matrix-gui-v2/matrix-gui-
> > > v2.git;protocol=3Dgit;branch=3D${BRANCH} \
> > > >             file://${MATRIX_INITSCRIPT} \
> > > >             file://php.ini \
> > > > +           file://matrix-gui-2.0.service \
> > > >             ${@base_conditional('QT_PROVIDER', 'qt5',
> > > bb.utils.contains('DISTRO_FEATURES', 'wayland', '', 'file://0001-
> > > execute_command-Stop-matrix-when-running-a-GUI-demo.patch', d), '',
> d)}
> > > \
> > > >             ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'fil=
e://0001-
> > > execute_command-workaround-for-GUI-apps-with-weston.patch', '', d)}
> \
> > > >  "
> > > > @@ -46,10 +46,13 @@ do_install(){
> > > >  	sed -i -e "s/__MATRIX_FLAGS__/\"${MATRIX_FLAGS}\"/"
> > > ${WORKDIR}/${MATRIX_INITSCRIPT}
> > > >  	sed -i -e
> > > "s/__SWITCH_FOREGROUND_VT__/${SWITCH_FOREGROUND_VT}/"
> > > ${WORKDIR}/${MATRIX_INITSCRIPT}
> > > >
> > > > -	# Install the init script
> > > > -	# TODO: replace init script with systemd files
> > > > +	# Install the script
> > > >  	install -d ${D}${sysconfdir}/init.d
> > > >  	install -m 0755 ${WORKDIR}/${MATRIX_INITSCRIPT}
> > > ${D}${sysconfdir}/init.d/matrix-gui-2.0
> > > > +
> > > > +	# Install the systemd unit file
> > > > +	install -d ${D}${systemd_system_unitdir}
> > > > +	install -m 0644 ${WORKDIR}/matrix-gui-2.0.service
> > > ${D}${systemd_system_unitdir}
> > > >  }
> > > >
> > > >  GUIDEPS =3D "matrix-gui-browser refresh-screen"
> > > > --
> > > > 1.9.1
> > > >
> > > > _______________________________________________
> > > > meta-arago mailing list
> > > > meta-arago@arago-project.org
> > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

--_002_f32510a41e06400882142cc05f5b66baticom_
Content-Type: application/octet-stream; name="matrix-gui-2.0"
Content-Description: matrix-gui-2.0
Content-Disposition: attachment; filename="matrix-gui-2.0"; size=1101;
	creation-date="Tue, 20 Nov 2018 22:11:28 GMT";
	modification-date="Tue, 20 Nov 2018 22:11:05 GMT"
Content-Transfer-Encoding: base64

IyEgL2Jpbi9zaAoKbWF0cml4Z3VpPSIvdXNyL2Jpbi9tYXRyaXhfYnJvd3NlciIKR1VJX09QVFM9
Imh0dHA6Ly9sb2NhbGhvc3Q6ODAvICIiIgpQSURGSUxFPSIvdmFyL3J1bi9tYXRyaXgtZ3VpLTIu
MC5waWQiCgojIEltcG9ydGFudCBTeXN0ZW0gRW52aXJvbm1lbnQgVmFyaWFibGVzCmZvciBzaCBp
biAvZXRjL3Byb2ZpbGUuZC8qLnNoIDsgZG8KICAgIFsgLXIgIiRzaCIgXSAmJiAuICIkc2giCmRv
bmUKCnRlc3QgLXggIiRtYXRyaXhndWkiIHx8IGV4aXQgMAoKY2FzZSAiJDEiIGluCiAgc3RhcnQp
CiAgICAKCiAgICAjQ2xlYXIgb3V0IHRoZSB0aGUgdG1wIGFuZCBsb2NrIGRpcmVjdG9yeQogICAg
Y2QgL3Vzci9zaGFyZS9tYXRyaXgtZ3VpLTIuMAogICAgcm0gLXJmIHRtcC8qCiAgICBybSAtcmYg
bG9jay8qCiAgICBjZCAtCgoJaWYgWyAtZSAkUElERklMRSBdOyB0aGVuCiAgICAgIFBJRERJUj0v
cHJvYy8kKGNhdCAkUElERklMRSkKICAgICAgaWYgWyAtZCAke1BJRERJUn0gLWEgICIkKHJlYWRs
aW5rIC1mICR7UElERElSfS9leGUpIiA9ICIke21hdHJpeGd1aX0iIF07IHRoZW4KICAgICAgICBl
Y2hvICIkREVTQyBhbHJlYWR5IHN0YXJ0ZWQ7IG5vdCBzdGFydGluZy4iCiAgICAgIGVsc2UKICAg
ICAgICBlY2hvICJSZW1vdmluZyBzdGFsZSBQSUQgZmlsZSAkUElERklMRS4iCiAgICAgICAgcm0g
LWYgJFBJREZJTEUKICAgICAgZmkKICAgIGZpCgogICAgZWNobyAtbiAiU3RhcnRpbmcgTWF0cml4
IEdVSSBhcHBsaWNhdGlvbiIKICAgIHN0YXJ0LXN0b3AtZGFlbW9uIC0tc3RhcnQgLS1xdWlldCAt
LWJhY2tncm91bmQgLW0gLS1waWRmaWxlICRQSURGSUxFIC0tZXhlYyAkbWF0cml4Z3VpIC0tICRH
VUlfT1BUUwogICAgZWNobyAiLiIKICAgIDs7CgogIHN0b3ApCiAgICBlY2hvIC1uICJTdG9wcGlu
ZyBNYXRyaXggR1VJIGFwcGxpY2F0aW9uIgogICAgc3RhcnQtc3RvcC1kYWVtb24gLS1zdG9wIC0t
cXVpZXQgLS1waWRmaWxlICRQSURGSUxFCiAgICBlY2hvICIuIgogICAgOzsKICAqKQogICAgZWNo
byAiVXNhZ2U6IC9ldGMvaW5pdC5kL21hdHJpeC1ndWktMi4wIHtzdGFydHxzdG9wfSIKICAgIGV4
aXQgMQplc2FjCgpleGl0IDAK

--_002_f32510a41e06400882142cc05f5b66baticom_--
