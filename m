Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 3D20452A01
	for <meta-arago@arago-project.org>;
	Mon, 25 Nov 2013 16:22:17 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAPGMGw1019989
	for <meta-arago@arago-project.org>; Mon, 25 Nov 2013 10:22:16 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAPGMGvh017930
	for <meta-arago@arago-project.org>; Mon, 25 Nov 2013 10:22:16 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 25 Nov 2013 10:22:16 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAPGMGYN009954;
	Mon, 25 Nov 2013 10:22:16 -0600
Date: Mon, 25 Nov 2013 11:22:15 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20131125162215.GI690@edge>
References: <1385398442-24668-1-git-send-email-fcooper@ti.com>
	<1385398442-24668-3-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1385398442-24668-3-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 3/7] packagegroup-arago-tisdk-qt: Make packagegroup generic
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
X-List-Received-Date: Mon, 25 Nov 2013 16:22:17 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Nov 25, 2013 at 10:53:58AM -0600, Franklin S. Cooper Jr wrote:
> * Update packagegroup so it applies to Qt 5 users along with Qt 4 users.
> * To reflect this change also rename recipe top reflect that its a generic qt
>   packagegroup.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-tisdk-qt.bb   |   27 ++++++++++++++++++++
>  .../packagegroups/packagegroup-arago-tisdk-qte.bb  |   19 --------------
>  2 files changed, 27 insertions(+), 19 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qt.bb
>  delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qt.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qt.bb
> new file mode 100644
> index 0000000..c981f9e
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qt.bb
> @@ -0,0 +1,27 @@
> +DESCRIPTION = "Task to add Qt embedded related packages"
> +LICENSE = "MIT"
> +PR = "r0"
> +
> +inherit packagegroup
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +QT4_DEMOS = "\
> +    qt4-embedded-examples \
> +    qt4-embedded-demos \
> +    ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles', 'quick-playground', '', d)} \

BTW, should we drop ARAGO_QT_PROVIDER?
We now have QT_PROVIDER for qt4 vs qt5 (can possibly extend it to cover 
qt4-gles too)
Otherwise, we started using "sgx" in MACHINE_FEATURES to determine whether to 
enable gles or not. So, if we unify on that, we can drop ARAGO_QT_PROVIDER to 
avoid confusion with QT_PROVIDER.


> +"
> +
> +QT5_DEMOS = "\
> +    qtwebkit-examples-examples \
> +"
> +
> +QT_DEMOS = "\
> +    ${@base_conditional('QT_PROVIDER', 'qt5', '${QT5_DEMOS}', '${QT4_DEMOS}', d)} \
> +    qt-tstat \
> +"
> +
> +RDEPENDS_${PN} = "\
> +    ${@base_conditional('QT_PROVIDER', 'qt5', 'packagegroup-arago-qt5', 'packagegroup-arago-qte', d)} \
> +    ${QT_DEMOS} \
> +"
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
> deleted file mode 100644
> index 10187a6..0000000
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -DESCRIPTION = "Task to add Qt embedded related packages"
> -LICENSE = "MIT"
> -PR = "r4"
> -
> -inherit packagegroup
> -
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> -
> -QT_DEMOS = "\
> -    qt4-embedded-examples \
> -    qt4-embedded-demos \
> -    qt-tstat \
> -    ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles', 'quick-playground', '', d)} \
> -"
> -
> -RDEPENDS_${PN} = "\
> -    packagegroup-arago-qte \
> -    ${QT_DEMOS} \
> -"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

