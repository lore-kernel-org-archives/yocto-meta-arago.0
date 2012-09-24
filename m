Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by arago-project.org (Postfix) with ESMTP id 3C7B652A5A
	for <meta-arago@arago-project.org>;
	Mon, 24 Sep 2012 20:47:37 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MAV008KXGE77KNC@vms173007.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 24 Sep 2012 15:47:05 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 54E50200DD; Mon,
	24 Sep 2012 16:46:55 -0400 (EDT)
Date: Mon, 24 Sep 2012 16:46:55 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
Message-id: <20120924204655.GB4278@denix.org>
References: <1348274580-27428-1-git-send-email-fcooper@ti.com>
MIME-version: 1.0
In-reply-to: <1348274580-27428-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago-extra][PATCH] pinmux-utility: Add pinmux utility for am1808
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
X-List-Received-Date: Mon, 24 Sep 2012 20:47:37 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Sep 21, 2012 at 07:43:00PM -0500, Franklin S. Cooper Jr wrote:
> * Add Windows base pinmux utility for am1808.
> * This recipe was split from the pinmux-utility_2.3.1.0 recipe in arago.
> * The current recipe pulls in a zip file that doesn't contain license
>   information. No where within the zip file or actually application contains
>   licensing information.
> * Use the LICENSE file that contains the license agreement text that is
>   displayed when installing the pinmux-utility version 2.3.1.0.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../pinmux-utility/pinmux-utility_1.0.1076.3.bb    |   34 ++++++++++++++++++++
>  1 files changed, 34 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_1.0.1076.3.bb
> 
> diff --git a/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_1.0.1076.3.bb b/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_1.0.1076.3.bb
> new file mode 100644
> index 0000000..24f4a15
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_1.0.1076.3.bb
> @@ -0,0 +1,34 @@
> +DESCRIPTION = "Texas Instruments Pinmux Utility"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=2b328fcf0477d688d8b85f7310f9e6b9"
> +COMPATIBLE_MACHINE = "am180x-evm"

Do we want it to be this strict? Should this rather be "omapl138" SOC?
Well, the same applies to another pinmux-utility - should that be 
"omap3|ti33x" instead? Please be less restrictive in recipes, especially in 
meta-arago-extras, as that can be used with derivative boards, so no reason to 
limit it to a specific EVM only. And "was not tested" is not an excuse here :)


> +
> +PR = "r0"
> +
> +SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/461/4210/Pin_Setup_AM18xx_01_00_1076_03.zip;name=omapl138;subdir=${P}"

Above has name=omapl138...


> +# Temporarily add LICENSE file here since zip files don't contain any license information. This file was grabbed
> +# from the License Agreement screen when installing pinmux-utility_2.3.1.0. No license information exist for this
> +# version of the pinmux utility.
> +SRC_URI += "file://LICENSE"
> +
> +SRC_URI[base.md5sum] = "5a4eb834bde44c662aaf669882adbfe6"
> +SRC_URI[base.sha256sum] = "6701ca0e91761b9eb80b0097fbb2e2ce2cd8e0bcdc0bd18c34cd0221d9d450d0"

And checksums require name=base!


> +S = "${WORKDIR}/${P}"
> +
> +do_unpack_extra() {
> +    mv ${WORKDIR}/LICENSE ${WORKDIR}/${P}
> +}
> +
> +addtask unpack_extra after do_unpack before do_patch
> +
> +installdir = "host-tools/pinmux_utils/windows"
> +
> +do_install() {
> +    install -d ${D}/${installdir}
> +    cp -rf ${S}/bin ${D}/${installdir}/
> +    cp -rf ${S}/configurations ${D}/${installdir}/
> +}
> +
> +FILES_${PN} += "${installdir}/*"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

