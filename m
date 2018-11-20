Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 54603529AC
	for <meta-arago@arago-project.org>;
	Tue, 20 Nov 2018 21:42:55 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id wAKLgiki021600
	for <meta-arago@arago-project.org>; Tue, 20 Nov 2018 15:42:44 -0600
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wAKLgiSu087308
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 20 Nov 2018 15:42:44 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 20 Nov 2018 15:42:44 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 20 Nov 2018 15:42:44 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wAKLgiqr027878;
	Tue, 20 Nov 2018 15:42:44 -0600
Date: Tue, 20 Nov 2018 16:42:44 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Hongmei Gou <a0271529@ti.com>
Message-ID: <20181120214244.GD2540@beryl>
References: <1542749635-31317-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
In-Reply-To: <1542749635-31317-1-git-send-email-a0271529@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
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
X-List-Received-Date: Tue, 20 Nov 2018 21:42:55 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Nov 20, 2018 at 04:33:55PM -0500, Hongmei Gou wrote:
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
>  .../recipes-core/matrix/matrix-gui/matrix-gui-2.0.service | 10 ++++++++++
>  meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb   | 15 +++++++++------
>  2 files changed, 19 insertions(+), 6 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui/matrix-gui-2.0.service
> 
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/matrix-gui-2.0.service b/meta-arago-extras/recipes-core/matrix/matrix-gui/matrix-gui-2.0.service
> new file mode 100644
> index 0000000..3ce1024
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/matrix-gui-2.0.service
> @@ -0,0 +1,10 @@
> +[Unit]
> +Description=Matrix GUI
> +After=weston.service
> +
> +[Service]
> +Type=forking
> +ExecStart=/etc/init.d/matrix-gui-2.0 start

Looks like it's still calling a legacy initscript - any particular reason?


> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> index d8aa00b..c79f13e 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> @@ -6,14 +6,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a886c9ef769b2d8271115d2502512e5d"
>  
>  SECTION = "multimedia"
>  
> -PR = "r35"
> +PR = "r36"
>  
> -INITSCRIPT_NAME = "matrix-gui-2.0"
> -INITSCRIPT_PARAMS = "defaults 97"
> +SYSTEMD_SERVICE_${PN} = "matrix-gui-2.0.service"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -inherit update-rc.d
> +inherit systemd
>  
>  BRANCH ?= "master"
>  SRCREV = "9a2d12590102fefc5c29fc9e8d346ce6b0198468"
> @@ -23,6 +22,7 @@ MATRIX_INITSCRIPT = "${@base_conditional('QT_PROVIDER', 'qt5', bb.utils.contains
>  SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2.git;protocol=git;branch=${BRANCH} \
>             file://${MATRIX_INITSCRIPT} \
>             file://php.ini \
> +           file://matrix-gui-2.0.service \
>             ${@base_conditional('QT_PROVIDER', 'qt5', bb.utils.contains('DISTRO_FEATURES', 'wayland', '', 'file://0001-execute_command-Stop-matrix-when-running-a-GUI-demo.patch', d), '', d)} \
>             ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'file://0001-execute_command-workaround-for-GUI-apps-with-weston.patch', '', d)} \
>  "
> @@ -46,10 +46,13 @@ do_install(){
>  	sed -i -e "s/__MATRIX_FLAGS__/\"${MATRIX_FLAGS}\"/" ${WORKDIR}/${MATRIX_INITSCRIPT}
>  	sed -i -e "s/__SWITCH_FOREGROUND_VT__/${SWITCH_FOREGROUND_VT}/" ${WORKDIR}/${MATRIX_INITSCRIPT}
>  
> -	# Install the init script
> -	# TODO: replace init script with systemd files
> +	# Install the script
>  	install -d ${D}${sysconfdir}/init.d
>  	install -m 0755 ${WORKDIR}/${MATRIX_INITSCRIPT} ${D}${sysconfdir}/init.d/matrix-gui-2.0
> +
> +	# Install the systemd unit file
> +	install -d ${D}${systemd_system_unitdir}
> +	install -m 0644 ${WORKDIR}/matrix-gui-2.0.service ${D}${systemd_system_unitdir}
>  }
>  
>  GUIDEPS = "matrix-gui-browser refresh-screen"
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

