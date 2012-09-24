Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id 2EA3252A65
	for <meta-arago@arago-project.org>;
	Mon, 24 Sep 2012 20:56:39 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MAV00I7JGTDPSSN@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 24 Sep 2012 15:56:07 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B7AD1200DD; Mon,
	24 Sep 2012 16:56:00 -0400 (EDT)
Date: Mon, 24 Sep 2012 16:56:00 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
Message-id: <20120924205600.GC4278@denix.org>
References: <1348274766-27559-1-git-send-email-fcooper@ti.com>
MIME-version: 1.0
In-reply-to: <1348274766-27559-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago-extras][PATCH] ti-oobe-script: Add script to parse ip address
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
X-List-Received-Date: Mon, 24 Sep 2012 20:56:39 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Sep 21, 2012 at 07:46:06PM -0500, Franklin S. Cooper Jr wrote:
> * Add script to parse ip address from the target system
>   and save it into a mmc partition that is mountable by
>   the host PC.
> * This is used to determine the right ip address to bring
>   up remote Matrix.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../recipes-tisdk/ti-oobe-script/ti-oobe-script.bb |   24 ++++++++++
>  .../ti-oobe-script/ti-oobe-script/init             |   46 ++++++++++++++++++++
>  2 files changed, 70 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-tisdk/ti-oobe-script/ti-oobe-script.bb
>  create mode 100644 meta-arago-distro/recipes-tisdk/ti-oobe-script/ti-oobe-script/init

Not a big deal, but the subject says extras, while the recipe is actually in 
distro, which I think is the correct location.

> diff --git a/meta-arago-distro/recipes-tisdk/ti-oobe-script/ti-oobe-script.bb b/meta-arago-distro/recipes-tisdk/ti-oobe-script/ti-oobe-script.bb
> new file mode 100644
> index 0000000..4aba91d
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/ti-oobe-script/ti-oobe-script.bb
> @@ -0,0 +1,24 @@
> +DESCRIPTION = "Script to parse ip address during boot and make it available to the host system using shared partitions"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://init;beginline=3;endline=31;md5=fc4b04a33df6d892c9f4d4a9d92b945e"
> +
> +COMPATIBLE_MACHINE = "ti33x"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +SRC_URI = "file://init"
> +
> +PR = "r0"
> +
> +S = "${WORKDIR}"
> +
> +INITSCRIPT_NAME = "parse-ip"

Also, wouldn't it be better to call the recipe parse-ip as well, instead of 
ti-oobe-script? Is it meant to be extended in the future?


> +INITSCRIPT_PARAMS = "defaults 98"
> +
> +inherit update-rc.d
> +
> +do_install() {
> +    install -d ${D}${sysconfdir}/init.d
> +    install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/parse-ip
> +}
> +
> +FILES_${PN} = "${sysconfdir}"
> diff --git a/meta-arago-distro/recipes-tisdk/ti-oobe-script/ti-oobe-script/init b/meta-arago-distro/recipes-tisdk/ti-oobe-script/ti-oobe-script/init
> new file mode 100644
> index 0000000..0020ea2
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/ti-oobe-script/ti-oobe-script/init
> @@ -0,0 +1,46 @@
> +#!/bin/sh
> +
> +# This distribution contains contributions or derivatives under copyright
> +# as follows:
> +#
> +# Copyright (c) 2010, Texas Instruments Incorporated
> +# All rights reserved.
> +#
> +# Redistribution and use in source and binary forms, with or without
> +# modification, are permitted provided that the following conditions
> +# are met:
> +# - Redistributions of source code must retain the above copyright notice,
> +#   this list of conditions and the following disclaimer.
> +# - Redistributions in binary form must reproduce the above copyright
> +#   notice, this list of conditions and the following disclaimer in the
> +#   documentation and/or other materials provided with the distribution.
> +# - Neither the name of Texas Instruments nor the names of its
> +#   contributors may be used to endorse or promote products derived
> +#   from this software without specific prior written permission.
> +#
> +# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
> +# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
> +# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
> +# PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
> +# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
> +# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
> +# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
> +# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
> +# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
> +# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
> +# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> +
> +case "$1" in
> +    start )
> +        if [ -e /media/mmcblk0p1 ]
> +        then
> +            echo `ifconfig | grep 'inet addr:' | grep -v '127.0.0.1' | cut -d: -f2 | awk '{print $1}'` > /media/mmcblk0p1/.ipaddr
> +            sync
> +	    sync
> +	fi
> +    ;;
> +    stop )
> +        exit 0;;
> +esac
> +
> +exit 0
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

