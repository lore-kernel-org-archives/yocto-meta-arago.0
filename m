Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id A880252A1D
	for <meta-arago@arago-project.org>;
	Sat,  3 Mar 2018 03:47:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w233kQRd004725
	for <meta-arago@arago-project.org>; Fri, 2 Mar 2018 21:46:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520048786;
	bh=er6dkHmMDlK+huTW2Ux0A6WeRZ53Fjr1Vmi6BoQAoEc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=j0zgZciqHcDgAww/TXoWgF6OKB9l+8GJQyH/Zv/Nl9Qz0Zv1dMI1U6JfGultxIAzI
	MZicsz1DtLkaUVwFiPi87kNm/N9T92znjPHwxKTuQyTIyFCH8i/Lp8qIX1p63HMy4X
	/yqCoPAV4QjdoSOIwdxJC8WPe5slWua5OfzghXO4=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w233kPGR013832
	for <meta-arago@arago-project.org>; Fri, 2 Mar 2018 21:46:26 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 2 Mar 2018 21:46:25 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 2 Mar 2018 21:46:25 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w233kPgJ013857;
	Fri, 2 Mar 2018 21:46:25 -0600
Date: Fri, 2 Mar 2018 22:46:25 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Ruei <e-ruei1@ti.com>
Message-ID: <20180303034625.GA26586@edge>
References: <1519843260-55405-1-git-send-email-e-ruei1@ti.com>
	<1519843260-55405-2-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
In-Reply-To: <1519843260-55405-2-git-send-email-e-ruei1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [morty/rocko/master][PATCH v3 1/4] qt-tstat: pickup the latest version for both Qt4/Qt5 support
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
X-List-Received-Date: Sat, 03 Mar 2018 03:47:04 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Feb 28, 2018 at 01:40:57PM -0500, Eric Ruei wrote:
> - update the git URL and SRCREV
> - select matrix desktop file based on QT vesion
> 
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  .../recipes-apps/thermostat-demo/qt-tstat_2.0.bb      | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb b/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
> index 494d582..43e35ab 100644
> --- a/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
> +++ b/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
> @@ -12,31 +12,30 @@ require recipes-core/matrix/matrix-gui-paths.inc
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
> +SRCREV = "3429dfc4333f11b9022e3aa6fd2850c5093777f9"

^^^^^^^^^^^^^^^^^^^^^^^^^^^
Where is this commit ID?


> -SRC_URI = " \
> -	git://gitorious.org/thermostat-demo/thermostat-demo.git;protocol=git \
> -"
> -
> -SRC_URI += "${@base_conditional('QT_PROVIDER', 'qt5', 'file://0002-Replace-QtGui-with-QtWidgets-per-Qt5-migration-guide.patch \
> -	file://0003-Replace-fromAscii-toAscii-with-fromLatin1-toLatin1-p.patch', '', d)}"
> +SRC_URI = "git://git.ti.com/apps/thermostat-demo.git;protocol=git;branch=${BRANCH}"
>  
>  S = "${WORKDIR}/git/"
>  
> +DESKTOP_FILE = "${@base_conditional('QT_PROVIDER', 'qt5', 'thermostat_demo_qt5.desktop', 'thermostat_demo.desktop', d)}"
> +
> +
>  do_install() {
>  	install -d ${D}/usr/bin
>  	install -m 0755 ${B}/ThermostatDemo ${D}/usr/bin/ThermostatDemo
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

