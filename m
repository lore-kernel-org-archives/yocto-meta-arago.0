Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 53B7B52972
	for <meta-arago@arago-project.org>;
	Mon, 24 Feb 2014 18:09:23 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1OI9MxX025553
	for <meta-arago@arago-project.org>; Mon, 24 Feb 2014 12:09:22 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1OI9MQr001236
	for <meta-arago@arago-project.org>; Mon, 24 Feb 2014 12:09:22 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 24 Feb 2014 12:09:22 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1OI9LOK026250;
	Mon, 24 Feb 2014 12:09:22 -0600
Date: Mon, 24 Feb 2014 13:09:20 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20140224180920.GG18510@edge>
References: <1393123599-4661-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1393123599-4661-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v2] lksctp-tools: Add recipe for lksctp
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
X-List-Received-Date: Mon, 24 Feb 2014 18:09:23 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sat, Feb 22, 2014 at 09:46:39PM -0500, Sam Nelson wrote:
> - The linux kernel Stream control transmission protocol
> - Original recipe by Jingting Zhou
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> 
> ---
> Updated RREPLACES_${PN}
> Fix build issue with .so
> ---
> ---
>  .../recipes-bsp/lksctp-tools/lksctp-tools_1.0.7.bb |   51 ++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100755 meta-arago-extras/recipes-bsp/lksctp-tools/lksctp-tools_1.0.7.bb
> 
> diff --git a/meta-arago-extras/recipes-bsp/lksctp-tools/lksctp-tools_1.0.7.bb b/meta-arago-extras/recipes-bsp/lksctp-tools/lksctp-tools_1.0.7.bb
> new file mode 100755
> index 0000000..5c75552
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/lksctp-tools/lksctp-tools_1.0.7.bb
> @@ -0,0 +1,51 @@
> +DESCRIPTION = "The Linux Kernel Stream Control Transmission Protocol (lksctp) project"
> +SECTION = "libs"
> +PRIORITY = "optional"

PRIORITY no longer exists in Yocto, that was only applicable to OE-Classic


> +LICENSE = "LGPLv2"
> +LIC_FILES_CHKSUM = "file://src/include/netinet/sctp.h;md5=8089fbe48b63b73c8d091bee750b2ebc"

Entire file? Could be Ok, just checking if you rather want just the header 
instead.


> +
> +INC_PR = "r0"
> +PR = "${INC_PR}.0"

There's no .inc file, so no need to use INC_PR.


> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/lksctp/lksctp-tools-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "047562b40537eb3be5d5ec3ae0a2198b"
> +SRC_URI[sha256sum] = "e920e89d110cff9847f1d86a1d7a23a156a8abcc9e65a35655d687fd08377595"
> +
> +S = "${WORKDIR}/${BPN}-${PV}"
> +
> +BBCLASSEXTEND = "native"
> +
> +inherit autotools pkgconfig binconfig
> +
> +do_install_append_virtclass-native() {
> +	:
> +}

I don't get it - you requested native build with BBCLASSEXTEND and then you 
disable do_install for it? Why? Actually, it's not even overwrite, it's append 
and it doesn't make any sense...


> +
> +RREPLACES_${PN} = "lksctp"

And by this point I decided to find where this recipe really comes from... :) 
Well, it appears it was available back in OE-Classic and had all those same 
strange things. But, some of those may be just cruft from previous revisions, 
so we should clean it up...

So, let's see:

1. Drop PRIORITY
2. May want to fix LIC_FILES_CHKSUM to not checksum the entire file
3. Drop INC_PR
4. Question - is this a native/host package, or just the target. If only 
target, drop BBLASSEXTEND
5. If 4 is true, also drop do_install_append_virtclass-native()
6. Drop RREPLACES
7. Try dropping LEAD_SONAME, but may still be required due to nonstandard lib
8. PACKAGES defines ${PN}-withsctp and ${PN}-utils, but FILES_* lists don't 
match
9. Probably want ${PN}-utils to be changed to just ${PN}, as PN=lksctp-tools

Let me know if you have any questions.

-- 
Denys


> +
> +LEAD_SONAME = "libsctp.so"
> +
> +PACKAGES =+ "${PN}-withsctp ${PN}-utils"
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
> +  ${libdir}/lksctp-tools/lib*.so"
> +
> +FILES_${PN}-utils = " \
> +  ${bindir}/sctp_test \
> +  ${bindir}/sctp_darn \
> +  ${bindir}/checksctp \
> +  ${bindir}/withsctp"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

