Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 17A2E5203A
	for <meta-arago@arago-project.org>;
	Fri, 14 Sep 2018 19:40:53 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8EJejei110810
	for <meta-arago@arago-project.org>; Fri, 14 Sep 2018 14:40:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536954045;
	bh=4GekIUUWnIUmlx2//Q+YeXRgKXhkrceL+OD9PdYB8j0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=W3PygCjpUH3z0lKoeky8bzhH7sa9u5nUyOGGL6q/fnOlicHXjxTkZR76jjev5+DVc
	lUrHRoqzLo/YbdkXS4eEzdwXmUjE61RiwTF//ylF85wHYgJmlP1JGQBIpx5wgLoZ1p
	9wqCohTrxuN9wkFZVeSycN2CbZJGAH37738WCekI=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8EJejsK024539
	for <meta-arago@arago-project.org>; Fri, 14 Sep 2018 14:40:45 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 14 Sep 2018 14:40:45 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 14 Sep 2018 14:40:45 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8EJejEr015873;
	Fri, 14 Sep 2018 14:40:45 -0500
Date: Fri, 14 Sep 2018 15:39:21 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Ruei <e-ruei1@ti.com>
Message-ID: <20180914193921.GW12296@beryl>
References: <1536875257-56734-1-git-send-email-e-ruei1@ti.com>
	<1536875257-56734-2-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
In-Reply-To: <1536875257-56734-2-git-send-email-e-ruei1@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 1/2] matrix-gui: qt5-demos: break qt5 demos package into individual ones
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
X-List-Received-Date: Fri, 14 Sep 2018 19:40:54 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Eric,

Please rebase - the patch doesn't apply due to:
http://arago-project.org/git/?p=meta-arago.git;a=commitdiff;h=805e88f44bc7b1f23ced8ac568c7085e37a232c4

Denys


On Thu, Sep 13, 2018 at 05:47:36PM -0400, Eric Ruei wrote:
> - bump SRCREV of matrix-gui-v2-apps to pickup webkit-browser demo
> - break qt5 demos package into individual one for each demo to to be
>   selected based on certain conditions.
> 
> 
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  .../recipes-core/matrix/matrix-gui-apps-git.inc    |  4 ++--
>  .../matrix/matrix-gui-qt5-demos_2.0.bb             | 25 +++++++++++++++++-----
>  2 files changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> index 3620e85..a5da492 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> @@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
>  LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
>  
>  SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
> -SRCREV = "1fab50f6ceac640bf946e8716a68b1c827256489"
> +SRCREV = "28aa0adb7733f103e07d82123924c5a6d1a9bfeb"
>  BRANCH = "master"
> -INC_PR = "r57"
> +INC_PR = "r58"
>  
>  # Pull in the base package for installing matrix applications
>  require matrix-gui-apps.inc
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb
> index 2401832..78f5547 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb
> @@ -7,13 +7,28 @@ PR = "${INC_PR}.1"
>  
>  inherit allarch
>  
> -SRC_URI_append_k3 = " \
> -           file://0001-qt5_broswer-use-webkit-browser-instead-of-webengine-.patch;pnum=2 \
> -"
> -
>  S = "${WORKDIR}/git/qt5_apps"
>  
>  # Make sure qt5 submenu and app images has been installed
> -RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-qt5"
> +QT5_RDEPENDS += "matrix-gui-apps-images matrix-gui-submenus-qt5"
>  
>  FILES_${PN} += "${MATRIX_BASE_DIR}/*"
> +PACKAGES = "matrix-qt5-demo-animated \
> +            matrix-qt5-demo-browser \
> +            matrix-qt5-demo-calculator \
> +            matrix-qt5-demo-deform \
> +            matrix-qt5-demo-webkit-browser \
> +"
> +
> +RDEPENDS_matrix-qt5-demo-animated = "${QT5_RDEPENDS}"
> +RDEPENDS_matrix-qt5-demo-browser = "${QT5_RDEPENDS}"
> +RDEPENDS_matrix-qt5-demo-calculator = "${QT5_RDEPENDS}"
> +RDEPENDS_matrix-qt5-demo-deform = "${QT5_RDEPENDS}"
> +RDEPENDS_matrix-qt5-demo-webkit-browser = "${QT5_RDEPENDS}"
> +
> +# Split the matrix files by qt5 demos
> +FILES_matrix-qt5-demo-animated = "${MATRIX_APP_DIR}/qt5_animated_tiles/*"
> +FILES_matrix-qt5-demo-browser = "${MATRIX_APP_DIR}/qt5_browser/*"
> +FILES_matrix-qt5-demo-calculator = "${MATRIX_APP_DIR}/qt5_calculator/*"
> +FILES_matrix-qt5-demo-deform = "${MATRIX_APP_DIR}/qt5_deform/*"
> +FILES_matrix-qt5-demo-webkit-browser = "${MATRIX_APP_DIR}/qt5_webkit_browser/*"
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

