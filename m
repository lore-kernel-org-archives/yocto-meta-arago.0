Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 1F234529D9
	for <meta-arago@arago-project.org>;
	Mon, 15 Dec 2014 19:15:06 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id sBFJF5rK013858
	for <meta-arago@arago-project.org>; Mon, 15 Dec 2014 13:15:05 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id sBFJF5Jo022285
	for <meta-arago@arago-project.org>; Mon, 15 Dec 2014 13:15:05 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 15 Dec 2014 13:15:04 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id sBFJF4QC020641;
	Mon, 15 Dec 2014 13:15:05 -0600
Date: Mon, 15 Dec 2014 14:15:04 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20141215191504.GD28600@edge>
References: <1418667057-19653-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1418667057-19653-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] lksctp-tools: Add new recipe for lksctp tools: library and utilities
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
X-List-Received-Date: Mon, 15 Dec 2014 19:15:06 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Dec 15, 2014 at 01:10:57PM -0500, Sam Nelson wrote:
> - Stream Control Transmission Protocol (SCTP) is a reliable, message-oriented,
>   multihomed transport protocol. Developed by the IETF SIGTRAN working group
>   to transport SS7 over IP, it is now the third general-purpose transport developed
>   by the IETF.

Looks fine to me. Please see below for 1 small question.


> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  .../lksctp-tools/lksctp-tools_1.0.16.bb            |   44 ++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100755 meta-arago-extras/recipes-connectivity/lksctp-tools/lksctp-tools_1.0.16.bb
> 
> diff --git a/meta-arago-extras/recipes-connectivity/lksctp-tools/lksctp-tools_1.0.16.bb b/meta-arago-extras/recipes-connectivity/lksctp-tools/lksctp-tools_1.0.16.bb
> new file mode 100755
> index 0000000..3765715
> --- /dev/null
> +++ b/meta-arago-extras/recipes-connectivity/lksctp-tools/lksctp-tools_1.0.16.bb
> @@ -0,0 +1,44 @@
> +DESCRIPTION = "The Linux Kernel Stream Control Transmission Protocol (lksctp) project"
> +SECTION = "libs"
> +PRIORITY = "optional"
> +LICENSE = "LGPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=0c56db0143f4f80c369ee3af7425af6e"
> +
> +PR = "r0"
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/lksctp/lksctp-tools-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "708bb0b5a6806ad6e8d13c55b067518e"
> +SRC_URI[sha256sum] = "0903dd526b7f30a89d5031aa2c82757612becc38ed7bc6e4f972f8deae351f26"
> +
> +BBCLASSEXTEND = "native"
> +
> +inherit autotools pkgconfig binconfig
> +
> +RREPLACES_${PN} = "lksctp"
> +
> +PACKAGES =+ "${PN}-utils"
> +
> +FILES_${PN} = "${libexecdir}/* ${libdir}/lib*${SOLIBS} \
> +            ${sysconfdir} ${sharedstatedir} ${localstatedir} \
> +            ${base_libdir}/*${SOLIBS}"
> +
> +FILES_${PN}-dev += " \
> +  ${datadir}/lksctp-tools/checksctp.c \
> +  ${datadir}/lksctp-tools/sctp_socket.c \
> +  ${datadir}/lksctp-tools/sctp_bind.c \
> +  ${datadir}/lksctp-tools/sctp_darn.c \
> +  ${datadir}/lksctp-tools/sctp_load_libs.c \
> +  ${datadir}/lksctp-tools/sctp_sockopt.c \
> +  ${datadir}/lksctp-tools/sctp_socket.h \
> +  ${datadir}/lksctp-tools/sctp_test.c \
> +  ${datadir}/lksctp-tools/sctp_darn.h \
> +  ${datadir}/lksctp-tools/sctp_status.c \
> +  ${libdir}/lksctp-tools/lib*.so"

The last line above lists all lib*.so in lksctp-tools off of libdir - are 
those real libraries and do you need to list them in the main package too?


> +
> +FILES_${PN}-utils = " \
> +  ${bindir}/sctp_test \
> +  ${bindir}/sctp_darn \
> +  ${bindir}/checksctp \
> +  ${bindir}/withsctp \
> +  ${bindir}/sctp_status"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

