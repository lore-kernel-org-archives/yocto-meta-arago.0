Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id B64AB529C8
	for <meta-arago@arago-project.org>;
	Mon, 25 Mar 2013 18:46:34 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MK800MVMC4KJRW2@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 25 Mar 2013 13:46:12 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 946822011D; Mon,
	25 Mar 2013 14:45:56 -0400 (EDT)
Date: Mon, 25 Mar 2013 14:45:56 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-id: <20130325184556.GF30363@denix.org>
References: <1363745138-10288-1-git-send-email-fcooper@ti.com>
MIME-version: 1.0
In-reply-to: <1363745138-10288-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 01/17] wl12xx-firmware: Pull back in old r5.00.18 recipe.
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
X-List-Received-Date: Mon, 25 Mar 2013 18:46:35 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

So, due to all the comments from Chase, should I expect a v2 for all the 17 
patches?

Moreover, if I remember correctly, these 17 patches are required to go in 
before the 9 patches from Eyal, correct?

-- 
Denys


On Tue, Mar 19, 2013 at 09:05:22PM -0500, Franklin S. Cooper Jr wrote:
> * Current am180x-evm ships with a PG 2 wilink 6 module that isn't supported in
>   newer wilink 6 releases.
> * A newer PG 3 wilink 6 module is available for am180x-evm but needs to be
>   purchased separately..
> * Bring old r5.00.18 wl12x-firmware recipe with updated recipe name to add
>   support for am180x-evm default wilink 6 module.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../wl12xx-firmware/wl12xx-firmware_r5.00.18.bb    |   28 ++++++++++++++++++++
>  1 files changed, 28 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware_r5.00.18.bb
> 
> diff --git a/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware_r5.00.18.bb b/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware_r5.00.18.bb
> new file mode 100644
> index 0000000..12df963
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware_r5.00.18.bb
> @@ -0,0 +1,28 @@
> +DESCRIPTION = "Firmware files for use with TI wl12xx"
> +LICENSE = "TI-TSPA"
> +LIC_FILES_CHKSUM = "file://LICENCE;md5=ba590e1d103f891d0151609046aef9e8"
> +
> +PACKAGE_ARCH = "all"
> +
> +PR = "r0+gitr${SRCREV}"
> +
> +# This recipe provides the latest firmware files for wl12xx.
> +# Therefore, use the contents of this recipe instead of the contents
> +# of linux-firmware-wl12xx.
> +RCONFLICTS_${PN} = "linux-firmware-wl12xx"
> +RPROVIDES_${PN}  = "linux-firmware-wl12xx"
> +
> +SRCREV = "38e0dd7999b9087e00d1a59306a7c22fd23246cf"
> +SRC_URI = "git://github.com/TI-ECS/ti-utils.git;protocol=git"
> +
> +S = "${WORKDIR}/git/hw/firmware"
> +
> +do_compile() {
> +    :
> +}
> +
> +do_install() {
> +    oe_runmake 'DEST_DIR=${D}' install
> +}
> +
> +FILES_${PN} = "/lib/firmware/ti-connectivity/*"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

