Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 7BFFF529F8
	for <meta-arago@arago-project.org>;
	Mon,  9 Mar 2015 17:16:44 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t29HGhwC001742
	for <meta-arago@arago-project.org>; Mon, 9 Mar 2015 12:16:43 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t29HGg4p024782
	for <meta-arago@arago-project.org>; Mon, 9 Mar 2015 12:16:42 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 9 Mar 2015 12:16:42 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t29HGgWd018443;
	Mon, 9 Mar 2015 12:16:42 -0500
Date: Mon, 9 Mar 2015 13:16:42 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150309171641.GE6052@edge>
References: <1425906138-5552-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1425906138-5552-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 1/2] amsdk-av-files: Upgrade to latest version with HEVC content.
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
X-List-Received-Date: Mon, 09 Mar 2015 17:16:44 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Lately I see lots of patches with extra lines at the end of the file, for 
which patch normally complains - please don't add those.


On Mon, Mar 09, 2015 at 09:02:17AM -0400, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../amsdk-av-files/amsdk-av-files_1.2.bb           |   44 ++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.2.bb
> 
> diff --git a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.2.bb b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.2.bb
> new file mode 100644
> index 0000000..258c7b4
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.2.bb
> @@ -0,0 +1,44 @@
> +DESCRIPTION = "AMSDK multimedia support files"
> +HOMEPAGE = "https://gforge.ti.com/gf/project/am_multimedia/"
> +LICENSE = "CC-BY-NC-ND-3.0 & CC-BY-3.0"
> +SECTION = "multimedia"
> +LIC_FILES_CHKSUM = "file://Multimedia_Data_Files_Manifest.doc;md5=9254447a504d2179d83a6bc9e2c28142"
> +PR = "r0"
> +
> +COMPATIBLE_MACHINE = "(omap3evm|am37x-evm|am3517-evm|am389x-evm|beagleboard|am335x-evm|ti43x|omap-a15)"

Is it time to relax this line or at least unify it? The first 3 platforms and 
beagleboard are covered by "omap3" soc, am389 is no longer supported at all, 
am335x-evm should be expanded to cover entire "ti33x" soc...
I know some EVMs have to use specific files listed below, but for others 
having some sane default (480p) should be fine as well.


> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +VIDEO_FILES = "video_480p "
> +VIDEO_FILES_append_am37x-evm   = "video_vga_r"
> +VIDEO_FILES_append_beagleboard = "video_vga"
> +VIDEO_FILES_append_am3517-evm  = "video_wqvga"
> +VIDEO_FILES_append_am335x-evm  = "video_wvga \
> +				                  video_wqvga"
> +VIDEO_FILES_append_dra7xx  = "video_wvga \
> +                                                  video_1080p \
> +                                                  video_720p \
> +                                                  video_yuv"
> + 
> +SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/1251/7520/amsdk-av-files_${PV}.tar.gz;name=avfilestarball"
> +
> +S = "${WORKDIR}/amsdk-av-files"
> +
> +do_compile() {
> +    :
> +}
> +
> +do_install() {
> +    install -d ${D}${datadir}/ti \
> +       ${D}${datadir}/ti/audio \
> +       ${D}${datadir}/ti/video
> +    install -m 0644 ${S}/audio/* ${D}${datadir}/ti/audio/
> +    for file in ${VIDEO_FILES}; do
> +	install -m 0644 ${S}/${file}/* ${D}${datadir}/ti/video/
> +    done
> +}
> +
> +FILES_${PN} += "${datadir}/ti/*"
> +
> +SRC_URI[avfilestarball.md5sum] = "c4c849cf6c16e4898869264bbd05fd5d"
> +SRC_URI[avfilestarball.sha256sum] = "287cc95a68befa594b8b9a8514c57240620d535b2b99c6d3e1f91bc278ef37ef"
> +
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

