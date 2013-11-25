Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id C14E052A01
	for <meta-arago@arago-project.org>;
	Mon, 25 Nov 2013 16:19:45 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAPGJib4027488
	for <meta-arago@arago-project.org>; Mon, 25 Nov 2013 10:19:44 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAPGJi0a000321
	for <meta-arago@arago-project.org>; Mon, 25 Nov 2013 10:19:44 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 25 Nov 2013 10:19:44 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAPGJiUs016723;
	Mon, 25 Nov 2013 10:19:44 -0600
Date: Mon, 25 Nov 2013 11:19:43 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20131125161943.GH690@edge>
References: <1385398442-24668-1-git-send-email-fcooper@ti.com>
	<1385398442-24668-2-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1385398442-24668-2-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 2/7] packagegroup-arago-qt5: Create Qt5 target package group
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
X-List-Received-Date: Mon, 25 Nov 2013 16:19:46 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Nov 25, 2013 at 10:53:57AM -0600, Franklin S. Cooper Jr wrote:
> * Create package group that by default includes essential Qt 5 plugins.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-qt5.bb        |   33 ++++++++++++++++++++
>  1 files changed, 33 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qt5.bb
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qt5.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qt5.bb
> new file mode 100644
> index 0000000..57d9a6c
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qt5.bb
> @@ -0,0 +1,33 @@
> +DESCRIPTION = "Task to add Qt 5 embedded related packages"
> +LICENSE = "MIT"
> +PR = "r0"
> +
> +inherit packagegroup
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +QT_SGX_SUPPORT = "\
> +    qt3d \
> +    qt3d-qmlplugins \
> +"
> +
> +RDEPENDS_${PN} = "\
> +    qtbase \
> +    qtbase-plugins \
> +    qtbase-fonts \
> +    qtbase-fonts-pfa \
> +    qtbase-fonts-pfb \
> +    qtbase-fonts-qpf \
> +    qtbase-fonts-ttf-dejavu \
> +    qtbase-fonts-ttf-vera \

Please drop the specific fonts - qtbase-fonts pulls all the individual fonts 
already.


> +    qtwebkit-qmlplugins \
> +    qtwebkit \
> +    qtdeclarative \
> +    qtdeclarative-qmlplugins \
> +    qtjsbackend \
> +    qtlocation \
> +    qtsvg \
> +    qtsvg-plugins \
> +    ${@base_contains('MACHINE_FEATURES','sgx','${QT_SGX_SUPPORT}','',d)} \
> +"
> +
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

