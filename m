Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 8B25C5297E
	for <meta-arago@arago-project.org>;
	Tue, 20 Nov 2018 23:15:29 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id wAKNFJuG117010
	for <meta-arago@arago-project.org>; Tue, 20 Nov 2018 17:15:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1542755719;
	bh=+fYeBsWAWk+cIo1DGoSJtyFwQGEJVMrRG6oYxdE3Vos=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=aWlk122GB5IBIIDZNzSxC6HOcBYA9Zu68AhTKt/cKF58kc83wMBC0mNWdLNTEjfze
	1zoQaZsvjG9+KEeyXbF52g7ebbd/aEqOQ6Zgw4lUZjU4bBQ+wJKvXhLuxYzpjdUNtB
	BOcoGlPnX/PRrko63g2uVoy6/4tHLCiycDWQYYJ4=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wAKNFJFo106929
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 20 Nov 2018 17:15:19 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 20 Nov 2018 17:15:18 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 20 Nov 2018 17:15:18 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wAKNFIxJ030505;
	Tue, 20 Nov 2018 17:15:18 -0600
Date: Tue, 20 Nov 2018 18:15:18 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Gou, Hongmei" <h-gou@ti.com>
Message-ID: <20181120231518.GH2540@beryl>
References: <1542749635-31317-1-git-send-email-a0271529@ti.com>
	<20181120214244.GD2540@beryl>
	<d236ecaafc0d409185072a38c20ee8c0@ti.com>
	<20181120215406.GE2540@beryl>
	<f32510a41e06400882142cc05f5b66ba@ti.com>
	<20181120223727.GF2540@beryl>
	<4a62881a41d442bea334eccb95078a2d@ti.com>
	<062feefa4fb345a4b9f059dc8781acbf@ti.com>
MIME-Version: 1.0
In-Reply-To: <062feefa4fb345a4b9f059dc8781acbf@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
X-List-Received-Date: Tue, 20 Nov 2018 23:15:29 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Nov 20, 2018 at 05:55:32PM -0500, Gou, Hongmei wrote:
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Gou, Hongmei
> > Sent: Tuesday, November 20, 2018 5:43 PM
> > To: Dmytriyenko, Denys
> > Cc: meta-arago@arago-project.org
> > Subject: [EXTERNAL] Re: [meta-arago] [rocko/master] [PATCH] matrix-gui:
> > replace SysVinit with systemd service
> > 
> > > -----Original Message-----
> > > From: Dmytriyenko, Denys
> > > Sent: Tuesday, November 20, 2018 5:37 PM
> > > To: Gou, Hongmei
> > > Cc: meta-arago@arago-project.org
> > > Subject: Re: [meta-arago] [rocko/master] [PATCH] matrix-gui: replace
> > > SysVinit with systemd service
> > >
> > > On Tue, Nov 20, 2018 at 05:12:52PM -0500, Gou, Hongmei wrote:
> > > > > -----Original Message-----
> > > > > From: Dmytriyenko, Denys
> > > > > Sent: Tuesday, November 20, 2018 4:54 PM
> > > > > To: Gou, Hongmei
> > > > > Cc: meta-arago@arago-project.org
> > > > > Subject: Re: [meta-arago] [rocko/master] [PATCH] matrix-gui: replace
> > > > > SysVinit with systemd service
> > > > >
> > > > > On Tue, Nov 20, 2018 at 04:51:51PM -0500, Gou, Hongmei wrote:
> > > > > > > -----Original Message-----
> > > > > > > From: Dmytriyenko, Denys
> > > > > > > Sent: Tuesday, November 20, 2018 4:43 PM
> > > > > > > To: Gou, Hongmei
> > > > > > > Cc: meta-arago@arago-project.org
> > > > > > > Subject: Re: [meta-arago] [rocko/master] [PATCH] matrix-gui:
> > replace
> > > > > > > SysVinit with systemd service
> > > > > > >
> > > > > > > On Tue, Nov 20, 2018 at 04:33:55PM -0500, Hongmei Gou wrote:
> > > > > > > > Signed-off-by: Hongmei Gou <a0271529@ti.com>
> > > > > > > > ---
> > > > > > > >  .../recipes-core/matrix/matrix-gui/matrix-gui-2.0.service | 10
> > > > > ++++++++++
> > > > > > > >  meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb   | 15
> > > > > > > +++++++++------
> > > > > > > >  2 files changed, 19 insertions(+), 6 deletions(-)
> > > > > > > >  create mode 100644 meta-arago-extras/recipes-
> > > core/matrix/matrix-
> > > > > > > gui/matrix-gui-2.0.service
> > > > > > > >
> > > > > > > > diff --git a/meta-arago-extras/recipes-core/matrix/matrix-
> > > gui/matrix-
> > > > > gui-
> > > > > > > 2.0.service b/meta-arago-extras/recipes-core/matrix/matrix-
> > > gui/matrix-
> > > > > gui-
> > > > > > > 2.0.service
> > > > > > > > new file mode 100644
> > > > > > > > index 0000000..3ce1024
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/matrix-
> > > gui-
> > > > > > > 2.0.service
> > > > > > > > @@ -0,0 +1,10 @@
> > > > > > > > +[Unit]
> > > > > > > > +Description=Matrix GUI
> > > > > > > > +After=weston.service
> > > > > > > > +
> > > > > > > > +[Service]
> > > > > > > > +Type=forking
> > > > > > > > +ExecStart=/etc/init.d/matrix-gui-2.0 start
> > > > > > >
> > > > > > > Looks like it's still calling a legacy initscript - any particular reason?
> > > > > >
> > > > > > Yes, we would like to keep the original scripts, as they are also used
> > for
> > > > > stopping/starting matrix GUI when running GUI based demos
> > > > > (/usr/share/matrix-gui-2.0/execute_command.sh):
> > > > > >
> > > > > > if [ $program_type == gui ]
> > > > > > then
> > > > > >   /etc/init.d/matrix-gui-2.0 stop
> > > > > > ..
> > > > > >
> > > > > > if [ $program_type == gui ]
> > > > > > then
> > > > > > ...
> > > > > >   /etc/init.d/matrix-gui-2.0 start
> > > > > > fi
> > > > >
> > > > > Any plans to completely moving to systemd and calling systemctl
> > > start/stop?
> > > >
> > > > With the current patch, "systemctl start/stop matrix-gui-2.0 " can
> > > > start/stop matrix successfully.
> > > > execute_command.sh can be updated to use systemctl start/stop.
> > > >
> > > > As for /etc/init.d/matrix-gui-2.0 (attached), I am not seeing anything
> > > > specific to init.
> > > > We can install it to /usr/bin instead of /etc/init.d, and then modify the
> > > > path in matrix-gui-2.0.service, if this is preferable.
> > >
> > > If you keep it in /etc/initd.d, wouldn't systemd try to automatically convert
> > > it and potentially conflict with your own native unit file?
> > 
> > systemd is not doing the conversion automatically.
> 
> Please note that /etc/rc5.d no longer has "S97matrix-gui-2.0 -> ../init.d/matrix-gui-2.0" with the current patch.
> If I understand it correctly, no automatic conversion is done for matrix-gui-2.0 because of this.

Ah, good point - you removed update-rc.d


> > Output of "systemctl cat matrix-gui-2.0.service" with the current patch:
> > [[0;1;34m# /lib/systemd/system/matrix-gui-2.0.service[[0m
> > [Unit]
> > Description=Matrix GUI
> > After=weston.service
> > 
> > [Service]
> > Type=forking
> > ExecStart=/etc/init.d/matrix-gui-2.0 start
> > 
> > [Install]
> > WantedBy=multi-user.target
> > 
> > Output of "systemctl cat matrix-gui-2.0.service" before the patch:
> > [[0;1;34m# /run/systemd/generator.late/matrix-gui-2.0.service[[0m
> > # Automatically generated by systemd-sysv-generator
> > 
> > [Unit]
> > Documentation=man:systemd-sysv-generator(8)
> > SourcePath=/etc/init.d/matrix-gui-2.0
> > Before=multi-user.target
> > Before=multi-user.target
> > Before=multi-user.target
> > Before=thermal-zone-init.service
> > After=thttpd.service
> > After=umountnfs.service
> > After=rng-tools.service
> > After=redis-server.service
> > After=dropbear.service
> > After=telnetd.service
> > After=gdbserverproxy.service
> > After=weston.service
> > After=rc.pvr.service
> > After=uim-sysfs.service
> > 
> > 
> > [Service]
> > Type=forking
> > Restart=no
> > TimeoutSec=5min
> > IgnoreSIGPIPE=no
> > KillMode=process
> > GuessMainPID=no
> > RemainAfterExit=yes
> > ExecStart=/etc/init.d/matrix-gui-2.0 start
> > ExecStop=/etc/init.d/matrix-gui-2.0 stop
> > 
> > >
> > >
> > > > > > > > +
> > > > > > > > +[Install]
> > > > > > > > +WantedBy=multi-user.target
> > > > > > > > diff --git a/meta-arago-extras/recipes-core/matrix/matrix-
> > > gui_2.0.bb
> > > > > > > b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> > > > > > > > index d8aa00b..c79f13e 100644
> > > > > > > > --- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> > > > > > > > +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> > > > > > > > @@ -6,14 +6,13 @@ LIC_FILES_CHKSUM =
> > > > > > > "file://LICENSE;md5=a886c9ef769b2d8271115d2502512e5d"
> > > > > > > >
> > > > > > > >  SECTION = "multimedia"
> > > > > > > >
> > > > > > > > -PR = "r35"
> > > > > > > > +PR = "r36"
> > > > > > > >
> > > > > > > > -INITSCRIPT_NAME = "matrix-gui-2.0"
> > > > > > > > -INITSCRIPT_PARAMS = "defaults 97"
> > > > > > > > +SYSTEMD_SERVICE_${PN} = "matrix-gui-2.0.service"
> > > > > > > >
> > > > > > > >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > > > > > > >
> > > > > > > > -inherit update-rc.d
> > > > > > > > +inherit systemd
> > > > > > > >
> > > > > > > >  BRANCH ?= "master"
> > > > > > > >  SRCREV = "9a2d12590102fefc5c29fc9e8d346ce6b0198468"
> > > > > > > > @@ -23,6 +22,7 @@ MATRIX_INITSCRIPT =
> > > > > > > "${@base_conditional('QT_PROVIDER', 'qt5', bb.utils.contains
> > > > > > > >  SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-
> > > > > > > v2.git;protocol=git;branch=${BRANCH} \
> > > > > > > >             file://${MATRIX_INITSCRIPT} \
> > > > > > > >             file://php.ini \
> > > > > > > > +           file://matrix-gui-2.0.service \
> > > > > > > >             ${@base_conditional('QT_PROVIDER', 'qt5',
> > > > > > > bb.utils.contains('DISTRO_FEATURES', 'wayland', '', 'file://0001-
> > > > > > > execute_command-Stop-matrix-when-running-a-GUI-demo.patch',
> > > d), '',
> > > > > d)}
> > > > > > > \
> > > > > > > >             ${@bb.utils.contains('DISTRO_FEATURES', 'wayland',
> > > 'file://0001-
> > > > > > > execute_command-workaround-for-GUI-apps-with-weston.patch',
> > '',
> > > d)}
> > > > > \
> > > > > > > >  "
> > > > > > > > @@ -46,10 +46,13 @@ do_install(){
> > > > > > > >  	sed -i -e "s/__MATRIX_FLAGS__/\"${MATRIX_FLAGS}\"/"
> > > > > > > ${WORKDIR}/${MATRIX_INITSCRIPT}
> > > > > > > >  	sed -i -e
> > > > > > >
> > "s/__SWITCH_FOREGROUND_VT__/${SWITCH_FOREGROUND_VT}/"
> > > > > > > ${WORKDIR}/${MATRIX_INITSCRIPT}
> > > > > > > >
> > > > > > > > -	# Install the init script
> > > > > > > > -	# TODO: replace init script with systemd files
> > > > > > > > +	# Install the script
> > > > > > > >  	install -d ${D}${sysconfdir}/init.d
> > > > > > > >  	install -m 0755 ${WORKDIR}/${MATRIX_INITSCRIPT}
> > > > > > > ${D}${sysconfdir}/init.d/matrix-gui-2.0
> > > > > > > > +
> > > > > > > > +	# Install the systemd unit file
> > > > > > > > +	install -d ${D}${systemd_system_unitdir}
> > > > > > > > +	install -m 0644 ${WORKDIR}/matrix-gui-2.0.service
> > > > > > > ${D}${systemd_system_unitdir}
> > > > > > > >  }
> > > > > > > >
> > > > > > > >  GUIDEPS = "matrix-gui-browser refresh-screen"
> > > > > > > > --
> > > > > > > > 1.9.1
> > > > > > > >
> > > > > > > > _______________________________________________
> > > > > > > > meta-arago mailing list
> > > > > > > > meta-arago@arago-project.org
> > > > > > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > >
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

