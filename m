Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id AF369529B9
	for <meta-arago@arago-project.org>;
	Tue, 26 Mar 2013 18:45:52 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MKA00K9B6RSIAS0@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 26 Mar 2013 13:45:44 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8293E2011D; Tue,
	26 Mar 2013 14:45:28 -0400 (EDT)
Date: Tue, 26 Mar 2013 14:45:27 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Eyal Reizer <eyalr@ti.com>
Message-id: <20130326184527.GA22032@denix.org>
References: <1363771816-4022-2-git-send-email-eyalr@ti.com>
MIME-version: 1.0
In-reply-to: <1363771816-4022-2-git-send-email-eyalr@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCHv3 2/9] wl18xx-firmware: install Wilink8 wlan firmware files
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
X-List-Received-Date: Tue, 26 Mar 2013 18:45:54 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Mar 20, 2013 at 11:30:09AM +0200, Eyal Reizer wrote:
> Add a recipe for installing the Wilink8 wlan firmware files into
> the target file system.
> 
> This package replace the wilink6 package which is provided by the
> wl12xx-firmware recipe. Selection between the two is done using a
> "WILINK_VERSION" switch added to arago.conf

I have 2 questions:

1. I seem to be missing the first patch in this series - 1/9 never made it
2. Is this set depending on Franklin's big set of 17 patches?


> Changes in v2:
> * Use an actual release name in the recipe name instead of _git
> * Add RPROVIDES, RREPLACES, RCONFLICTS as this recipe completely 
>   replace the wilink6 one.
> 
> Changes in v3:
> * Add _${PN} to all runtime variables
> 
> Signed-off-by: Eyal Reizer <eyalr@ti.com>
> ---
>  .../wl18xx-firmware/wl18xx-firmware/Makefile       |    7 +++++
>  .../wl18xx-firmware/wl18xx-firmware_r8.a6.01.bb    |   30 ++++++++++++++++++++
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware/Makefile
>  create mode 100644 meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a6.01.bb
> 
> diff --git a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware/Makefile b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware/Makefile
> new file mode 100644
> index 0000000..0bb7ab8
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware/Makefile
> @@ -0,0 +1,7 @@
> +# Installs the the ti-connectiviy wlan firmware files into the root file system
> +
> +install:
> +	install -d  $(DEST_DIR)/lib/firmware/ti-connectivity
> +	cp -RpP * $(DEST_DIR)/lib/firmware/ti-connectivity/
> +	rm -f $(DEST_DIR)/lib/firmware/ti-connectivity/Makefile
> +
> diff --git a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a6.01.bb b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a6.01.bb
> new file mode 100644
> index 0000000..fd463cc
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a6.01.bb
> @@ -0,0 +1,30 @@
> +DESCRIPTION = "Firmware files for use with TI wl18xx"
> +LICENSE = "TI-TSPA"
> +LIC_FILES_CHKSUM = "file://LICENCE;md5=b28122fd6678e89fd3a8d4bc80922969"
> +
> +PACKAGE_ARCH = "all"
> +
> +PR = "r1+gitr${SRCREV}"
> +
> +PROVIDES += "wl12xx-firmware"
> +RPROVIDES_${PN} += "wl12xx-firmware" 
> +RREPLACES_${PN} += "wl12xx-firmware"
> +RCONFLICTS_${PN} += "wl12xx-firmware"
> +
> +SRCREV = "ol_r8.a6.01"
> +SRC_URI = "git://github.com/TI-OpenLink/wl18xx_fw.git;protocol=git \
> +           file://Makefile \
> +          "
> +
> +S = "${WORKDIR}/git"
> +
> +do_compile() {
> +    :
> +}
> +
> +do_install() {
> +    cp ${WORKDIR}/Makefile ${S}
> +    oe_runmake 'DEST_DIR=${D}' install
> +}
> +
> +FILES_${PN} = "/lib/firmware/ti-connectivity/*"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

