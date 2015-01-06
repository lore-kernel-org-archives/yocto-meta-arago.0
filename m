Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 6F255529E0
	for <meta-arago@arago-project.org>;
	Tue,  6 Jan 2015 18:17:31 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t06IHU7c019968
	for <meta-arago@arago-project.org>; Tue, 6 Jan 2015 12:17:30 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t06IHUFC016373
	for <meta-arago@arago-project.org>; Tue, 6 Jan 2015 12:17:30 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 6 Jan 2015 12:17:30 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t06IHUCk003427;
	Tue, 6 Jan 2015 12:17:30 -0600
Date: Tue, 6 Jan 2015 13:17:30 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150106181729.GX4759@edge>
References: <1420555480-20038-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1420555480-20038-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] tisdk-image: Hide lib directory in image.
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
X-List-Received-Date: Tue, 06 Jan 2015 18:17:31 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack

On Tue, Jan 06, 2015 at 09:44:40AM -0500, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  meta-arago-distro/classes/tisdk-image.bbclass |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
> index 6023d6b..3030a38 100644
> --- a/meta-arago-distro/classes/tisdk-image.bbclass
> +++ b/meta-arago-distro/classes/tisdk-image.bbclass
> @@ -481,6 +481,7 @@ tisdk_image_setup () {
>  
>      mkdir -p ${IMAGE_ROOTFS}/etc
>      mkdir -p ${IMAGE_ROOTFS}/var/lib/opkg
> +    mkdir -p ${IMAGE_ROOTFS}/lib
>  
>      chmod 755 ${DEPLOY_DIR}/sdk/${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-tisdk*
>  
> @@ -614,6 +615,7 @@ tisdk_image_cleanup () {
>      # manifest (and maybe one day for online updates) to a hidden directory.
>      mv ${IMAGE_ROOTFS}/var ${IMAGE_ROOTFS}/.var
>      mv ${IMAGE_ROOTFS}/etc ${IMAGE_ROOTFS}/.etc
> +    mv ${IMAGE_ROOTFS}/lib ${IMAGE_ROOTFS}/.lib
>  }
>  
>  license_create_manifest() {
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

