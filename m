Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 9B4F752993
	for <meta-arago@arago-project.org>;
	Wed,  7 Feb 2018 17:29:39 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w17HTUPk008793
	for <meta-arago@arago-project.org>; Wed, 7 Feb 2018 11:29:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1518024570;
	bh=cZq1e9YzV3q7OpS/s8tJzSnTgwHIe2i3Jog1dQNFEac=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=v1f5BZwkDYt59LJ618IrOcUkUA8ZDr9WS7nlka/2RFi7pRVm1tfYfW8m9n+hmh9/B
	x4xGlwxmalKi4lsJVhMDUWe6qKVM1yeFlD1aCnl4OrC+1qboxcj6F7RlILRykjX8Mf
	WE7oCWg1e9gM8xFZUoKvL+8MMBR9EIY/g5CKiMkM=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w17HTU1x021149
	for <meta-arago@arago-project.org>; Wed, 7 Feb 2018 11:29:30 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 7 Feb 2018 11:29:30 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Wed, 7 Feb 2018 11:29:30 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w17HTU9U031607;
	Wed, 7 Feb 2018 11:29:30 -0600
Date: Wed, 7 Feb 2018 12:29:29 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Ruei <e-ruei1@ti.com>
Message-ID: <20180207172929.GB27609@edge>
References: <1517948150-41783-1-git-send-email-e-ruei1@ti.com>
	<1517948150-41783-5-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
In-Reply-To: <1517948150-41783-5-git-send-email-e-ruei1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [morty/master][PATCH 4/4] qt-tstat: pickup the latest version for both Qt4/Qt5 support
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
X-List-Received-Date: Wed, 07 Feb 2018 17:29:41 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

This should be the first patch in the series, not last.

Also, morty is pretty much done.


On Tue, Feb 06, 2018 at 03:15:50PM -0500, Eric Ruei wrote:
> - update the git URL and SRCREV
> - select matrix desktop file based on QT vesion
> - add qt-tstat.sh to force the QT5 demo to run as eglfs full-screen app

Why is it eglfs-forced?


> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  .../thermostat-demo/qt-tstat/qt_tstat.sh            | 13 +++++++++++++
>  .../recipes-apps/thermostat-demo/qt-tstat_2.0.bb    | 21 +++++++++++----------
>  2 files changed, 24 insertions(+), 10 deletions(-)
>  create mode 100755 meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat/qt_tstat.sh
> 
> diff --git a/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat/qt_tstat.sh b/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat/qt_tstat.sh
> new file mode 100755
> index 0000000..01ca4f9
> --- /dev/null
> +++ b/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat/qt_tstat.sh
> @@ -0,0 +1,13 @@
> +#!/bin/bash
> +
> +/etc/init.d/weston stop
> +sleep 1
> +
> +echo 0 > /sys/class/graphics/fbcon/cursor_blink
> +
> +ThermostatDemo -platform eglfs
> +
> +echo 1 > /sys/class/graphics/fbcon/cursor_blink
> +
> +/etc/init.d/weston start
> +sleep 1
> diff --git a/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb b/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
> index 494d582..acb0720 100644
> --- a/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
> +++ b/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
> @@ -12,31 +12,32 @@ require recipes-core/matrix/matrix-gui-paths.inc
>  
>  inherit qt-provider
>  
> -PR = "r9"
> +PR = "r10"
>  
>  DEPENDS += "${QT_DEPENDS_SVG} ${QT_DEPENDS_SCRIPT}"
>  
>  BRANCH ?= "master"
> -SRCREV = "2512773c2d9da989e6a42c1e90b2b34496713072"
> +SRCREV = "db7959b200e0ecbe59ff1c867251b1a8b17bd567"
>  
> -SRC_URI = " \
> -	git://gitorious.org/thermostat-demo/thermostat-demo.git;protocol=git \
> -"
> -
> -SRC_URI += "${@base_conditional('QT_PROVIDER', 'qt5', 'file://0002-Replace-QtGui-with-QtWidgets-per-Qt5-migration-guide.patch \
> -	file://0003-Replace-fromAscii-toAscii-with-fromLatin1-toLatin1-p.patch', '', d)}"
> +SRC_URI = "git://git.ti.com/apps/thermostat-demo.git;protocol=git;branch=${BRANCH} \
> +	   file://qt_tstat.sh"
>  
>  S = "${WORKDIR}/git/"
>  
> +DESKTOP_FILE = "${@base_conditional('QT_PROVIDER', 'qt5', 'thermostat_demo_qt5.desktop', 'thermostat_demo.desktop', d)}"
> +
> +
>  do_install() {
>  	install -d ${D}/usr/bin
>  	install -m 0755 ${B}/ThermostatDemo ${D}/usr/bin/ThermostatDemo
> +	install ${WORKDIR}/qt_tstat.sh ${D}/usr/bin/qt_tstat.sh
>  	install -d ${D}${MATRIX_APP_DIR}/qt_tstat
> -	cp -rf ${S}/matrix-files/*  ${D}${MATRIX_APP_DIR}/qt_tstat
> +	install ${S}/matrix-files/desc_thermostat_demo.html  ${D}${MATRIX_APP_DIR}/qt_tstat
> +	install ${S}/matrix-files/${DESKTOP_FILE}  ${D}${MATRIX_APP_DIR}/qt_tstat/thermostat_demo.desktop
>  }
>  
>  PACKAGES += "matrix-gui-thermostat-demo"
>  
> -RDEPENDS_matrix-gui-thermostat-demo += "matrix-gui-apps-images matrix-gui-submenus-qt4"
> +RDEPENDS_matrix-gui-thermostat-demo += "matrix-gui-apps-images ${@base_conditional('QT_PROVIDER', 'qt5', 'matrix-gui-submenus-qt5', 'matrix-gui-submenus-qt4', d)}"
>  
>  FILES_matrix-gui-thermostat-demo += "${MATRIX_APP_DIR}/*"
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

