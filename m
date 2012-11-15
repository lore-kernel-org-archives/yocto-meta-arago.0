Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 7D241529EF
	for <meta-arago@arago-project.org>;
	Thu, 15 Nov 2012 23:31:58 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id qAFNVvVu030708;
	Thu, 15 Nov 2012 17:31:57 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qAFNVvES018553;
	Thu, 15 Nov 2012 17:31:57 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 15 Nov 2012 17:31:57 -0600
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id qAFNVvos024542;
	Thu, 15 Nov 2012 17:31:57 -0600
Date: Thu, 15 Nov 2012 18:31:57 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
Message-ID: <20121115233157.GL10887@edge>
References: <1353021956-18687-1-git-send-email-fcooper@ti.com>
	<1353021956-18687-2-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1353021956-18687-2-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: Re: [PATCH 2/3] task-arago-qte: Add additional packages
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
X-List-Received-Date: Thu, 15 Nov 2012 23:31:58 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Nov 15, 2012 at 05:25:55PM -0600, Franklin S. Cooper Jr wrote:
> * Adding additional packages that were automatically installed with Qt in
>   classic Arago but not being done now.
> * This insures the packages installed in the old SDK matches the new one.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../recipes-core/tasks/task-arago-qte.bb           |   14 ++++++++++++--
>  1 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-qte.bb b/meta-arago-distro/recipes-core/tasks/task-arago-qte.bb
> index 420a061..e2acea5 100644
> --- a/meta-arago-distro/recipes-core/tasks/task-arago-qte.bb
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-qte.bb
> @@ -1,10 +1,17 @@
>  DESCRIPTION = "Task to add Qt embedded related packages"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> -PR = "r0"
> +PR = "r1"
>  
>  inherit task
>  
> +QT_SGX_SUPPORT = "\
> +    qt4-embedded-plugin-gfxdriver-gfxpvregl \
> +    qt4-embedded-gles \
> +    libqt-embeddedopengl4 \
> +    libqt-embeddedpvrqwswsegl4 \
> +"
> +
>  RDEPENDS_${PN} = "\
>      qt4-embedded \

Same question - is there qt4-embedded, when you build qt4-embedded-gles?


>      qt4-embedded-plugin-mousedriver-tslib \
> @@ -13,5 +20,8 @@ RDEPENDS_${PN} = "\
>      qt4-embedded-plugin-imageformat-gif \
>      qt4-embedded-plugin-imageformat-jpeg \
>      qt4-embedded-qml-plugins \
> -    ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles', 'qt4-embedded-plugin-gfxdriver-gfxpvregl', '', d)} \
> +    libqt-embeddedmultimedia4 \
> +    libqt-embeddeddeclarative4 \
> +    libqt-embeddedxmlpatterns4 \
> +    ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles', '${QT_SGX_SUPPORT}', '', d)} \
>  "
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

